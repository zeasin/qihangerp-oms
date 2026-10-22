/**
 * 统一面单打印通道
 * 按平台（shopType）通过 WebSocket 连接本地各平台打印组件，完成「取打印机列表」与「打印面单」。
 * 协议报文逐一移植自开源版旧页面 vue2/src/views/shipping/ewaybillPrint/{tao,jd,pdd,dou,wei,ks,xhs}/shipping_list.vue：
 * - 淘宝(1)/拼多多(3)/抖店(4)：cmd 族协议（requestID + cmd + version，响应回 cmd）
 * - 京东(2)：orderType 族协议（GET_Printers / PRINT，响应 code='6' 为打印机列表）
 * - 微信小店(5)/快手(6)/小红书(7)：command 族协议（requestID + command，响应回 command）
 * 每次任务使用一次性连接：连接 → 发送 → 等待结果 → 关闭；失败/超时统一抛出带组件名的可读 Error，
 * 由页面层决定如何提示（ElMessage）。
 */

/** 归一化后的打印机信息 */
export interface PrinterInfo {
  name: string
  label?: string
}

/** 打印文档（字段对应后端 WaybillPrintDataVo 的打印相关载荷） */
export interface PrintDocument {
  waybillCode: string
  printData?: string
  sign?: string
  params?: string
  templateUrl?: string
  goodsDetail?: string
}

/** 平台打印组件对应的本地 WebSocket 端口（EnumShopType：1淘宝 2京东 3拼多多 4抖店 5微信小店 6快手 7小红书） */
const PORT_MAP: Record<number, number> = { 1: 13528, 2: 9113, 3: 5000, 4: 13888, 5: 12705, 6: 16888, 7: 10818 }

/** 各平台打印组件名称（错误提示用） */
const COMPONENT_NAME: Record<number, string> = {
  1: '菜鸟云打印组件',
  2: '京东云打印组件',
  3: '拼多多打印组件',
  4: '字节（抖店）打印组件',
  5: '微信小店打印组件',
  6: '快手打印组件',
  7: '小红书打印组件'
}

/** 一次性连接的收发超时（毫秒） */
const DEFAULT_TIMEOUT = 10000

/** 京东组件需要过滤掉的系统虚拟打印机（移植自 vue2 jd/shipping_list.vue） */
const JD_VIRTUAL_PRINTERS = ['Fax', 'OneNote for Windows 10', 'Microsoft XPS Document Writer', 'Microsoft Print to PDF', 'Adobe PDF']

/** 抖店商品明细副联固定模板（移植自 vue2 dou/shipping_list.vue） */
const DOU_GOODS_DETAIL_TEMPLATE = 'https://cloudprint.douyinec.com/api/logistics/davinci/template/xml/D1l4jpyxn4gf8k'

/** 京东云打印默认模板：账号未配置 templateUrl 时兜底（移植自 vue2 jd/shipping_list.vue） */
const JD_DEFAULT_TEMPLATE = 'https://template-content.jd.com/template-oss?tempCode=ytokd76x130'

/** 生成随机ID（移植自 vue2 页面 getUUID） */
function getUUID(len: number, radix?: number): string {
  const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('')
  const uuid: string[] = []
  const base = radix || chars.length
  for (let i = 0; i < len; i++) {
    uuid[i] = chars[0 | Math.random() * base]
  }
  return uuid.join('')
}

function checkShopType(shopType: number): void {
  if (!PORT_MAP[shopType]) {
    throw new Error(`平台 ${shopType} 暂无本地打印组件通道`)
  }
}

/** 建立一次性 WebSocket 连接；连接失败/超时抛出可读错误 */
function connectSocket(shopType: number, timeoutMs = DEFAULT_TIMEOUT): Promise<WebSocket> {
  checkShopType(shopType)
  const componentName = COMPONENT_NAME[shopType]
  return new Promise((resolve, reject) => {
    let settled = false
    let socket: WebSocket | null = null
    try {
      socket = new WebSocket(`ws://127.0.0.1:${PORT_MAP[shopType]}`)
    } catch {
      reject(new Error(`无法连接${componentName}，请确认已安装并启动`))
      return
    }
    const timer = window.setTimeout(() => {
      if (settled) return
      settled = true
      try { socket?.close() } catch { /* ignore */ }
      reject(new Error(`连接${componentName}超时，请确认已安装并启动打印组件`))
    }, timeoutMs)
    socket.onopen = () => {
      if (settled) return
      settled = true
      window.clearTimeout(timer)
      resolve(socket as WebSocket)
    }
    socket.onerror = () => {
      if (settled) return
      settled = true
      window.clearTimeout(timer)
      reject(new Error(`连接${componentName}失败，请确认已安装并启动打印组件`))
    }
  })
}

/** 等待一条满足条件的组件响应；超时/连接关闭抛出可读错误 */
function waitMessage(
  socket: WebSocket,
  accept: (resp: any) => boolean,
  timeoutMs = DEFAULT_TIMEOUT,
  failPrefix = '打印'
): Promise<any> {
  const componentName = Object.values(COMPONENT_NAME).includes(failPrefix) ? failPrefix : '打印组件'
  return new Promise((resolve, reject) => {
    let settled = false
    const cleanup = () => {
      window.clearTimeout(timer)
      socket.onmessage = null
      socket.onerror = null
      socket.onclose = null
    }
    const timer = window.setTimeout(() => {
      if (settled) return
      settled = true
      cleanup()
      reject(new Error(`${componentName}${failPrefix}超时，请检查打印组件与打印机状态`))
    }, timeoutMs)
    socket.onmessage = (e) => {
      let resp: any
      try {
        resp = JSON.parse(e.data || '{}')
      } catch {
        return
      }
      if (!accept(resp)) return
      if (settled) return
      settled = true
      cleanup()
      resolve(resp)
    }
    socket.onerror = () => {
      if (settled) return
      settled = true
      cleanup()
      reject(new Error(`${componentName}通信异常，${failPrefix}失败`))
    }
    socket.onclose = () => {
      if (settled) return
      settled = true
      cleanup()
      reject(new Error(`${componentName}连接已断开，${failPrefix}失败`))
    }
  })
}

/** 等待 count 条满足条件的响应（拼多多逐单发送、逐单回执） */
function waitMessages(
  socket: WebSocket,
  accept: (resp: any) => boolean,
  count: number,
  timeoutMs = DEFAULT_TIMEOUT
): Promise<void> {
  return new Promise((resolve, reject) => {
    let received = 0
    let settled = false
    const cleanup = () => {
      window.clearTimeout(timer)
      socket.onmessage = null
      socket.onerror = null
      socket.onclose = null
    }
    const timer = window.setTimeout(() => {
      if (settled) return
      settled = true
      cleanup()
      reject(new Error(`拼多多打印组件响应超时（已回执 ${received}/${count}），请检查打印组件状态`))
    }, timeoutMs)
    socket.onmessage = (e) => {
      let resp: any
      try {
        resp = JSON.parse(e.data || '{}')
      } catch {
        return
      }
      if (!accept(resp)) return
      const error = extractPrintError(resp)
      if (error && !settled) {
        settled = true
        cleanup()
        reject(new Error(error))
        return
      }
      received += 1
      if (received >= count && !settled) {
        settled = true
        cleanup()
        resolve()
      }
    }
    socket.onerror = () => {
      if (settled) return
      settled = true
      cleanup()
      reject(new Error('拼多多打印组件通信异常，打印失败'))
    }
    socket.onclose = () => {
      if (settled) return
      settled = true
      cleanup()
      reject(new Error('拼多多打印组件连接已断开，打印失败'))
    }
  })
}

/** 从组件回执里提取明显的失败原因（各协议错误字段兼容，不凭空扩展判定） */
function extractPrintError(resp: any): string {
  if (!resp) return ''
  const status = String(resp.taskStatus || resp.status || '').toLowerCase()
  if (status && status !== 'success' && status !== 'started' && status !== 'received') {
    return resp.errorMsg || `打印任务状态异常：${resp.taskStatus || resp.status}`
  }
  if (resp.errorCode && Number(resp.errorCode) !== 0) {
    return resp.errorMsg || `打印组件返回错误：${resp.errorCode}`
  }
  if (resp.code && /[1-9]/.test(String(resp.code)) && String(resp.code) !== '0' && resp.orderType === 'PRINT') {
    return resp.msg || resp.detail || `京东打印组件返回错误：${resp.code}`
  }
  return ''
}

/** 打印机列表归一化：兼容字符串数组与 {name,label} 对象数组 */
function normalizePrinters(raw: any, dropVirtual = false): PrinterInfo[] {
  const list = Array.isArray(raw) ? raw : []
  const result: PrinterInfo[] = []
  list.forEach((item: any) => {
    let name = ''
    let label: string | undefined
    if (typeof item === 'string') {
      name = item
    } else if (item && typeof item === 'object') {
      name = String(item.name || item.printerName || item.label || '')
      label = item.label ? String(item.label) : undefined
    }
    if (!name) return
    if (dropVirtual && JD_VIRTUAL_PRINTERS.includes(name)) return
    result.push({ name, label })
  })
  return result
}

/**
 * 读取指定平台本地打印组件的打印机列表
 * @param shopType 平台（EnumShopType 索引）
 */
export async function getPrinters(shopType: number): Promise<PrinterInfo[]> {
  checkShopType(shopType)
  const socket = await connectSocket(shopType)
  try {
    if (shopType === 2) {
      // 京东：orderType 族，打印机列表在 detailinfo.printers（字符串数组），过滤系统虚拟打印机
      socket.send(JSON.stringify({ orderType: 'GET_Printers' }))
      const resp = await waitMessage(socket, (r) => r.code === '6' || r.orderType === 'GET_Printers', DEFAULT_TIMEOUT, '获取打印机')
      return normalizePrinters(resp.detailinfo?.printers, true)
    }
    if (shopType === 1 || shopType === 3 || shopType === 4) {
      // 淘宝 / 拼多多 / 抖店：cmd 族
      socket.send(JSON.stringify({ requestID: getUUID(8, 16), cmd: 'getPrinters', version: '1.0' }))
      const resp = await waitMessage(socket, (r) => r.cmd === 'getPrinters', DEFAULT_TIMEOUT, '获取打印机')
      return normalizePrinters(resp.printers)
    }
    // 微信小店 / 快手 / 小红书：command 族（微信小店的命令名是 getPrinterList）
    const command = shopType === 5 ? 'getPrinterList' : 'getPrinters'
    socket.send(JSON.stringify({ requestID: getUUID(8, 16), command }))
    const resp = await waitMessage(socket, (r) => r.command === command, DEFAULT_TIMEOUT, '获取打印机')
    return normalizePrinters(resp.printerList)
  } finally {
    try { socket.close() } catch { /* ignore */ }
  }
}

/** 解析后端 printData 载荷（tao/pdd 为 JSON 字符串） */
function parsePrintData(doc: PrintDocument, shopType: number): any {
  if (!doc.printData) {
    throw new Error(`运单 ${doc.waybillCode || '?'} 缺少打印数据，请先确认订单已取号且打印载荷已落库`)
  }
  try {
    return JSON.parse(doc.printData)
  } catch {
    throw new Error(`${COMPONENT_NAME[shopType]}打印数据解析失败（订单 ${doc.waybillCode || '?'}）`)
  }
}

/**
 * 通过指定平台的本地打印组件打印面单
 * @param shopType 平台（EnumShopType 索引）
 * @param printerName 打印机名称（getPrinters 返回的 name）
 * @param docs 打印文档列表（一份文档打印一张；需要份数时由调用方重复传入）
 */
export async function printWaybills(shopType: number, printerName: string, docs: PrintDocument[]): Promise<void> {
  checkShopType(shopType)
  if (!printerName) {
    throw new Error('请先选择打印机')
  }
  if (!docs || !docs.length) {
    throw new Error('没有需要打印的面单数据')
  }

  if (shopType === 1) {
    // 淘宝（菜鸟云打印）：所有 printData 解析后合并进单个 document 的 contents
    const contents = docs.map((d) => parsePrintData(d, shopType))
    const socket = await connectSocket(shopType)
    try {
      const requestID = getUUID(8, 16)
      socket.send(JSON.stringify({
        cmd: 'print',
        requestID,
        version: '1.0',
        task: {
          taskID: getUUID(8, 10),
          preview: false,
          printer: printerName,
          previewType: 'pdf',
          firstDocumentNumber: 1,
          totalDocumentCount: contents.length,
          documents: [{
            documentID: getUUID(8, 10),
            contents
          }]
        }
      }))
      const resp = await waitMessage(socket, (r) => r.cmd === 'print' && (!r.requestID || r.requestID === requestID))
      const error = extractPrintError(resp)
      if (error) throw new Error(error)
    } finally {
      try { socket.close() } catch { /* ignore */ }
    }
    return
  }

  if (shopType === 3) {
    // 拼多多：逐单发送 print 指令，每单一条回执
    const socket = await connectSocket(shopType)
    try {
      docs.forEach((d) => {
        const parsed = parsePrintData(d, shopType)
        socket.send(JSON.stringify({
          cmd: 'print',
          requestID: getUUID(8, 16),
          version: '1.0',
          task: {
            taskID: getUUID(8, 10),
            preview: false,
            printer: printerName,
            previewType: 'pdf',
            documents: [{
              documentID: getUUID(8, 10),
              contents: [{
                encryptedData: parsed.encryptedData,
                signature: parsed.signature,
                templateUrl: parsed.templateUrl,
                ver: parsed.ver
              }]
            }]
          }
        }))
      })
      await waitMessages(socket, (r) => r.cmd === 'print', docs.length)
    } finally {
      try { socket.close() } catch { /* ignore */ }
    }
    return
  }

  if (shopType === 4) {
    // 抖店：每单一个 document；contents 首项为加密面单，副项为商品明细模板
    const documents = docs.map((d, i) => {
      const contents: any[] = [{
        signature: d.sign,
        encryptedData: d.printData,
        templateURL: d.templateUrl,
        addData: {},
        config: { packageNumber: `${i + 1}/${docs.length}` }
      }]
      if (d.params) {
        contents[0].params = d.params
      }
      if (d.goodsDetail) {
        contents.push({
          data: { detail: d.goodsDetail },
          templateURL: DOU_GOODS_DETAIL_TEMPLATE
        })
      }
      return { documentID: d.waybillCode || getUUID(8, 10), contents }
    })
    const socket = await connectSocket(shopType)
    try {
      const requestID = getUUID(8, 16)
      socket.send(JSON.stringify({
        cmd: 'print',
        requestID,
        version: '1.0',
        task: {
          taskID: getUUID(8, 10),
          preview: false,
          printer: printerName,
          previewType: 'pdf',
          firstDocumentNumber: 1,
          totalDocumentCount: documents.length,
          documents
        }
      }))
      const resp = await waitMessage(socket, (r) => r.cmd === 'print' && (!r.requestID || r.requestID === requestID))
      const error = extractPrintError(resp)
      if (error) throw new Error(error)
    } finally {
      try { socket.close() } catch { /* ignore */ }
    }
    return
  }

  if (shopType === 2) {
    // 京东：单条 PRINT 指令，printData 为后端拉取的云打印加密串数组
    const printData: string[] = []
    docs.forEach((d) => {
      if (!d.printData) {
        throw new Error(`运单 ${d.waybillCode || '?'} 缺少京东云打印数据，请先取号`)
      }
      printData.push(d.printData)
    })
    const tempUrl = docs[0].templateUrl || JD_DEFAULT_TEMPLATE
    const key = getUUID(8, 16)
    const socket = await connectSocket(shopType)
    try {
      socket.send(JSON.stringify({
        orderType: 'PRINT',
        key,
        parameters: {
          printName: printerName,
          offsetTop: '0mm',
          offsetLeft: '0mm',
          tempUrl,
          printData,
          customData: [{ addData: {} }],
          addData: {}
        }
      }))
      const resp = await waitMessage(socket, (r) => r.orderType === 'PRINT' || r.cmd === 'print', DEFAULT_TIMEOUT, '京东打印')
      const error = extractPrintError(resp)
      if (error) throw new Error(error)
    } finally {
      try { socket.close() } catch { /* ignore */ }
    }
    return
  }

  // 微信小店 / 快手 / 小红书：command 族，printInfo 即平台 print_info 报文（后端 printData 字段）
  const taskList = docs.map((d, i) => {
    if (!d.printData) {
      throw new Error(`运单 ${d.waybillCode || '?'} 缺少${COMPONENT_NAME[shopType]}打印报文（print_info），请确认取号载荷已落库`)
    }
    return {
      taskID: getUUID(8, 10),
      printInfo: d.printData,
      printNum: { curNum: i + 1, sumNum: docs.length },
      splitControl: 0,
      showDeliveryLogo: 0
    }
  })
  const socket = await connectSocket(shopType)
  try {
    const requestID = getUUID(8, 16)
    socket.send(JSON.stringify({
      command: 'print',
      version: '2.0',
      requestID,
      taskList,
      printType: 1,
      size: { width: 76, height: 130 },
      printer: printerName
    }))
    const resp = await waitMessage(socket, (r) => r.command === 'print' && (!r.requestID || r.requestID === requestID))
    const error = extractPrintError(resp)
    if (error) throw new Error(error)
  } finally {
    try { socket.close() } catch { /* ignore */ }
  }
}
