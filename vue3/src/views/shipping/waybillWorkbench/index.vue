<template>
  <div class="app-container waybill-workbench">
    <!-- 筛选区 -->
    <el-form :model="filters" size="small" :inline="true" label-width="68px" class="filter-form">
      <el-form-item label="订单号">
        <el-input
          v-model="filters.orderNums"
          type="textarea"
          :autosize="{ minRows: 1, maxRows: 3 }"
          placeholder="多单号逗号/换行分隔"
          clearable
          style="width: 210px"
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="店铺">
        <el-select v-model="filters.shopId" placeholder="全部店铺" filterable clearable style="width: 170px" @change="handleQuery">
          <el-option v-for="s in shopList" :key="s.id" :label="s.name" :value="s.id" />
        </el-select>
      </el-form-item>
      <el-form-item label="平台">
        <el-select v-model="filters.shopType" placeholder="全部平台" clearable style="width: 140px" @change="handleQuery">
          <el-option v-for="p in platformOptions" :key="p.value" :label="p.label" :value="p.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="取号状态">
        <el-select v-model="filters.waybillStatus" placeholder="全部" clearable style="width: 110px" @change="handleQuery">
          <el-option label="未取号" :value="0" />
          <el-option label="已取号" :value="1" />
          <el-option label="已打印" :value="2" />
        </el-select>
      </el-form-item>
      <el-form-item label="待分配">
        <el-switch v-model="filters.allocatePending" @change="handleQuery" />
      </el-form-item>
      <el-form-item label="商品">
        <el-input v-model="filters.goodsKeyword" placeholder="标题/规格编码/条码" clearable style="width: 160px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="收件人">
        <el-input v-model="filters.receiverName" placeholder="收件人姓名" clearable style="width: 120px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="手机号">
        <el-input v-model="filters.receiverMobile" placeholder="收件人手机号" clearable style="width: 130px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="small" @click="handleQuery"><el-icon><Search /></el-icon>搜索</el-button>
        <el-button size="small" @click="resetQuery"><el-icon><Refresh /></el-icon>重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 电子面单账号筛选条：全部 / 发货主体分类 / 具体账号 三层 chip，互斥，再点取消 -->
    <div class="account-group-bar">
      <span class="bar-label">电子面单：</span>
      <el-tag
        size="small"
        :effect="!filters.waybillAccountId && !filters.shipperCategory ? 'dark' : 'plain'"
        @click="selectAllGroup"
      >全部</el-tag>
      <el-tag
        v-for="c in categoryChips"
        :key="c.value"
        size="small"
        :effect="filters.shipperCategory === c.value && !filters.waybillAccountId ? 'dark' : 'plain'"
        @click="selectCategory(c.value)"
      >{{ c.label }}</el-tag>
      <template v-if="accountGroups.length">
        <el-divider direction="vertical" />
        <span v-for="g in accountGroups" :key="g.key" class="account-group">
          <span class="group-name">{{ g.name }}：</span>
          <el-tag
            v-for="a in g.accounts"
            :key="a.id"
            size="small"
            :effect="filters.waybillAccountId === a.id ? 'dark' : 'plain'"
            @click="selectAccount(a)"
          >{{ a.refLogisticsName || a.providerCode }} · {{ a.name }}</el-tag>
        </span>
      </template>
      <el-tag v-if="filters.allocatePending" type="warning" size="small" closable @close="clearAllocatePending">仅看未分配面单</el-tag>
    </div>

    <!-- 批量工具条 -->
    <div class="toolbar">
      <el-button v-hasPermi="['orderWorkbench:waybill:distribute']" size="small" type="primary" :disabled="!selection.length" @click="openDistribute(null)">分配/改派</el-button>
      <el-button v-hasPermi="['orderWorkbench:waybill:take']" size="small" type="success" :disabled="!selection.length" @click="handleTake(null)">取号</el-button>
      <el-button v-hasPermi="['orderWorkbench:waybill:print']" size="small" :disabled="!selection.length" @click="handlePrint(null)">打印</el-button>
      <el-button v-hasPermi="['orderWorkbench:waybill:ship']" size="small" type="primary" :disabled="!selection.length" @click="handleShip(null)">发货</el-button>
      <el-button v-hasPermi="['orderWorkbench:waybill:cancel']" size="small" :disabled="!selection.length" @click="handleCancel(null)">取消取号</el-button>
      <span class="selection-tip">已选 {{ selection.length }} 单</span>
    </div>

    <!-- 打单队列 -->
    <el-table
      ref="tableRef"
      v-loading="loading"
      :data="rows"
      border
      size="small"
      row-key="id"
      @selection-change="handleSelectionChange"
      @sort-change="handleSortChange"
    >
      <el-table-column type="selection" width="42" align="center" />
      <el-table-column type="expand" width="36">
        <template #default="scope">
          <el-table :data="scope.row.items || []" size="small" class="inner-table">
            <el-table-column label="图片" width="60">
              <template #default="itemScope">
                <ImagePreview :src="itemScope.row.goodsImg" :width="40" :height="40" />
              </template>
            </el-table-column>
            <el-table-column label="商品" prop="goodsTitle" min-width="240" show-overflow-tooltip />
            <el-table-column label="规格" prop="goodsSpec" min-width="120" show-overflow-tooltip />
            <el-table-column label="SKU编码" prop="skuNum" width="150" />
            <el-table-column label="商品编码" prop="goodsNum" width="150" />
            <el-table-column label="数量" prop="quantity" width="70" align="center" />
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="订单号/平台" min-width="200">
        <template #default="scope">
          <div class="order-num-line">
            <span class="order-num">{{ scope.row.orderNum }}</span>
            <el-tag v-if="Number(scope.row.orderRole) === 1" size="small" type="success" effect="plain">子单</el-tag>
            <el-tag v-if="scope.row.splitFlag" size="small" type="warning" effect="plain">已拆分</el-tag>
            <el-tag v-if="scope.row.hasChildren" size="small" type="info" effect="plain">{{ scope.row.childCount || 0 }}子单</el-tag>
          </div>
          <div class="sub-line">{{ shopName(scope.row.shopId) }} · {{ platformName(scope.row.shopType) }}</div>
        </template>
      </el-table-column>
      <el-table-column label="商品" min-width="240">
        <template #default="scope">
          <div class="goods-cell">
            <ImagePreview :src="scope.row.firstImage" :width="40" :height="40" />
            <div class="goods-info">
              <div class="goods-title" :title="scope.row.goodsSummary">{{ scope.row.goodsSummary }}</div>
              <div class="goods-sub">
                <span v-if="scope.row.skuNumText" class="sku-text" :title="scope.row.skuNumText">SKU：{{ scope.row.skuNumText }}</span>
                <el-tag size="small" type="info">{{ scope.row.itemCount || 0 }}款 / {{ scope.row.totalQuantity || 0 }}件</el-tag>
              </div>
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="收件信息" min-width="190">
        <template #default="scope">
          <div>{{ scope.row.receiverName }}&nbsp;{{ scope.row.receiverMobile }}</div>
          <div class="sub-line">{{ scope.row.province }}{{ scope.row.city }}{{ scope.row.town }}{{ scope.row.address }}</div>
        </template>
      </el-table-column>
      <el-table-column label="面单状态" width="150">
        <template #default="scope">
          <el-tag size="small" :type="waybillTagType(scope.row.waybillStatus)">{{ waybillStatusName(scope.row.waybillStatus) }}</el-tag>
          <div v-if="scope.row.waybillCode" class="sub-line">{{ scope.row.waybillCompany }} {{ scope.row.waybillCode }}</div>
        </template>
      </el-table-column>
      <el-table-column label="面单账号" min-width="140">
        <template #default="scope">
          <template v-if="scope.row.allocated">
            <div>{{ scope.row.waybillAccountName || ('账号#' + scope.row.waybillAccountId) }}</div>
          </template>
          <el-tag v-else size="small" type="danger">未分配</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="实付" width="110" prop="payment" sortable="custom">
        <template #default="scope">{{ formatAmount(scope.row.payment) }}</template>
      </el-table-column>
      <el-table-column label="下单时间" width="160" prop="orderTime" sortable="custom">
        <template #default="scope">{{ parseTime(scope.row.orderTime) }}</template>
      </el-table-column>
      <el-table-column label="最晚发货倒计时" width="150">
        <template #default="scope">
          <span :class="deliveryClass(scope.row)">{{ deliveryText(scope.row) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="290" fixed="right">
        <template #default="scope">
          <el-button
            v-if="canDistribute(scope.row)"
            v-hasPermi="['orderWorkbench:waybill:distribute']"
            link
            type="primary"
            size="small"
            @click="openDistribute(scope.row)"
          >分配</el-button>
          <el-button v-if="canTake(scope.row)" v-hasPermi="['orderWorkbench:waybill:take']" link type="success" size="small" @click="handleTake(scope.row)">取号</el-button>
          <el-button v-if="canPrint(scope.row)" v-hasPermi="['orderWorkbench:waybill:print']" link type="primary" size="small" @click="handlePrint(scope.row)">打印</el-button>
          <el-button v-if="canReprint(scope.row)" v-hasPermi="['orderWorkbench:waybill:print']" link size="small" @click="handleReprint(scope.row)">补打</el-button>
          <el-button v-if="canShip(scope.row)" v-hasPermi="['orderWorkbench:waybill:ship']" link type="primary" size="small" @click="handleShip(scope.row)">发货</el-button>
          <el-button v-if="canCancel(scope.row)" v-hasPermi="['orderWorkbench:waybill:cancel']" link size="small" @click="handleCancel(scope.row)">取消取号</el-button>
          <el-button v-if="canManualShip(scope.row)" v-hasPermi="['orderWorkbench:waybill:manualShip']" link type="warning" size="small" @click="openManualShip(scope.row)">手动发货</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 分配 / 改派面单账号弹窗 -->
    <el-dialog v-model="distributeVisible" title="分配 / 改派面单账号" width="720px" append-to-body>
      <div class="dialog-tip">
        已选 <b>{{ distributeOrders.length }}</b> 单；店铺：{{ distributeShopName }}。选中账号即确定发货主体 + 快递 + 网点。
      </div>
      <el-empty v-if="!distributeGroups.length" description="该店铺暂无可用面单账号（无绑定账号的主体只能走手动发货）" />
      <div v-for="g in distributeGroups" :key="g.key" class="account-option-group">
        <div class="group-title">{{ g.name }}</div>
        <el-radio-group v-model="selectedAccountId">
          <el-radio v-for="a in g.accounts" :key="a.id" :value="a.id" border class="account-radio">
            {{ a.refLogisticsName || a.providerCode }} · {{ a.name }}
            <span class="sub-line">余额 {{ a.num == null ? '-' : a.num }}</span>
          </el-radio>
        </el-radio-group>
      </div>
      <template #footer>
        <el-button @click="distributeVisible = false">取消</el-button>
        <el-button type="primary" :loading="submitting" :disabled="!selectedAccountId" @click="submitDistribute">确定分配</el-button>
      </template>
    </el-dialog>

    <!-- 打印 / 补打弹窗：选打印机 + 逐单份数 -->
    <el-dialog v-model="printVisible" :title="printIsReprint ? '补打面单' : '打印面单'" width="760px" append-to-body :close-on-click-modal="false">
      <div class="dialog-tip">
        平台：{{ platformName(printShopType) }}；共 {{ printDocs.length }} 张面单。打印成功后自动回传「已打印」状态{{ printIsReprint ? '（补打仅重发打印任务，不回传状态）' : '' }}。
      </div>
      <el-form size="small" :inline="true">
        <el-form-item label="打印机">
          <el-select v-model="printPrinterName" placeholder="请选择打印机" filterable style="width: 240px" :loading="printerLoading">
            <el-option v-for="p in printerList" :key="p.name" :label="p.label || p.name" :value="p.name" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button size="small" :loading="printerLoading" @click="loadPrinters">刷新打印机</el-button>
        </el-form-item>
      </el-form>
      <el-table :data="printDocs" size="small" border max-height="320">
        <el-table-column label="订单号" prop="orderNum" min-width="170" show-overflow-tooltip />
        <el-table-column label="快递单号" prop="waybillCode" min-width="150" show-overflow-tooltip />
        <el-table-column label="打印数据" width="100" align="center">
          <template #default="scope">
            <el-tag v-if="scope.row.hasData" size="small" type="success">就绪</el-tag>
            <el-tag v-else size="small" type="danger">缺失</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="份数" width="140" align="center">
          <template #default="scope">
            <el-input-number v-model="scope.row.copies" :min="1" :max="20" :controls="false" size="small" style="width: 80px" :disabled="!scope.row.hasData" />
          </template>
        </el-table-column>
      </el-table>
      <div v-if="printMissingCount" class="sub-line danger">
        {{ printMissingCount }} 单缺少打印数据，将跳过本地打印，仅回传已打印状态。
      </div>
      <template #footer>
        <el-button @click="printVisible = false">取消</el-button>
        <el-button type="primary" :loading="printSubmitting" :disabled="!printPrinterName" @click="submitPrint">开始打印</el-button>
      </template>
    </el-dialog>

    <!-- 手动发货弹窗 -->
    <el-dialog v-model="manualShipVisible" title="手动发货" width="520px" append-to-body>
      <el-alert
        type="info"
        :closable="false"
        show-icon
        title="手动发货用于无面单账号或线下已寄出的订单：填写物流公司与运单号后直接置为已发货；若平台支持发货回传，会同步回传平台。"
        class="mb12"
      />
      <el-form ref="manualShipFormRef" :model="manualShipForm" :rules="manualShipRules" label-width="90px" size="small">
        <el-form-item label="订单号">
          <span>{{ manualShipOrder ? manualShipOrder.orderNum : '-' }}</span>
        </el-form-item>
        <el-form-item label="快递公司" prop="logisticsCode">
          <el-select v-model="manualShipForm.logisticsCode" filterable placeholder="请选择快递公司" style="width: 100%">
            <el-option v-for="c in logisticsOptions" :key="c.logisticsCode" :label="c.logisticsName" :value="c.logisticsCode" />
          </el-select>
        </el-form-item>
        <el-form-item label="快递单号" prop="waybillCode">
          <el-input v-model="manualShipForm.waybillCode" placeholder="请输入快递运单号" style="width: 100%" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="manualShipVisible = false">取消</el-button>
        <el-button type="primary" :loading="submitting" @click="submitManualShip">确认发货</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, onUnmounted, reactive, ref } from 'vue'
import { ElMessage, ElMessageBox, type FormInstance, type FormRules } from 'element-plus'
import { Search, Refresh } from '@element-plus/icons-vue'
import {
  pageWaybillOrders,
  takeWaybill,
  cancelWaybill,
  getWaybillPrintData,
  printWaybill,
  shipWaybill,
  manualShipWaybill,
  distributeWaybill,
  getWaybillAccountOptions,
  getWaybillCapabilities
} from '@/api/shipping/waybillWorkbench'
import { listShop } from '@/api/shop/shop'
import { getFavoriteList } from '@/api/shipping/shipLogistics'
import { getPrinters, printWaybills, type PrinterInfo, type PrintDocument } from '@/utils/waybillPrinter'
import { parseTime } from '@/utils/zhijian'
import Pagination from '@/components/Pagination/index.vue'
import ImagePreview from '@/components/ImagePreview/index.vue'

defineOptions({ name: 'WaybillWorkbench' })

// 平台索引常量（EnumShopType），开源版行 VO 无平台名，直接按枚举展示
const platformOptions = [
  { value: 1, label: '淘宝/天猫' },
  { value: 2, label: '京东' },
  { value: 3, label: '拼多多' },
  { value: 4, label: '抖店' },
  { value: 5, label: '微信小店' },
  { value: 6, label: '快手' },
  { value: 7, label: '小红书' }
]

function defaultFilters() {
  return {
    orderNums: '',
    shopId: null as number | null,
    shopType: null as number | null,
    waybillStatus: null as number | null,
    allocatePending: false,
    goodsKeyword: '',
    receiverName: '',
    receiverMobile: '',
    waybillAccountId: null as number | null,
    shipperCategory: null as string | null,
    sortField: '',
    sortOrder: ''
  }
}

const filters = reactive<any>(defaultFilters())
const queryParams = reactive({ pageNum: 1, pageSize: 50 })
const loading = ref(false)
const submitting = ref(false)
const rows = ref<any[]>([])
const total = ref(0)
const selection = ref<any[]>([])
const tableRef = ref<any>(null)
const now = ref(Date.now())
let countdownTimer: number | undefined

// ==================== 基础数据 ====================

const shopList = ref<any[]>([])

function loadShops() {
  listShop({ pageNum: 1, pageSize: 1000 }).then((res: any) => {
    shopList.value = res.rows || []
  }).catch(() => {})
}

function shopName(id: any) {
  const shop = shopList.value.find((s) => Number(s.id) === Number(id))
  return shop?.name || (id ? '#' + id : '—')
}

function platformName(type: any) {
  const matched = platformOptions.find((p) => p.value === Number(type))
  return matched?.label || (type == null ? '—' : String(type))
}

function formatAmount(value: any) {
  if (value === null || value === undefined || value === '') return '—'
  const num = Number(value)
  if (Number.isNaN(num)) return String(value)
  return '¥' + num.toFixed(2)
}

// 面单状态：0未取号 1已取号 2已打印 3已发货 10手动发货
function waybillStatusName(status: any) {
  const value = status == null ? 0 : Number(status)
  const names: Record<number, string> = { 0: '未取号', 1: '已取号', 2: '已打印', 3: '已发货', 10: '手动发货' }
  return names[value] || '未知'
}

function waybillTagType(status: any) {
  const value = status == null ? 0 : Number(status)
  const map: Record<number, string> = { 0: 'info', 1: 'warning', 2: 'primary', 3: 'success', 10: 'success' }
  return map[value] || 'info'
}

// 最晚发货倒计时：latestDeliveryTime(epoch秒) - 当前时间；超时>48h红，超时/临近24h内橙
function deliveryDiffMs(row: any) {
  if (!row.latestDeliveryTime) return null
  return Number(row.latestDeliveryTime) * 1000 - now.value
}

function deliveryText(row: any) {
  const diff = deliveryDiffMs(row)
  if (diff === null) return '-'
  const abs = Math.abs(diff)
  const hours = Math.floor(abs / 3600000)
  const days = Math.floor(hours / 24)
  const text = days > 0 ? `${days}天${hours % 24}小时` : `${hours}小时${Math.floor((abs % 3600000) / 60000)}分`
  return diff < 0 ? `已超时 ${text}` : `剩 ${text}`
}

function deliveryClass(row: any) {
  const diff = deliveryDiffMs(row)
  if (diff === null) return ''
  if (diff < 0 && Math.abs(diff) >= 48 * 3600000) return 'stay-over'
  if (diff < 24 * 3600000) return 'stay-warn'
  return ''
}

// ==================== 平台能力缓存 ====================

const capabilities = reactive<Record<number, any>>({})

function loadCapabilities() {
  const types = [...new Set(rows.value.map((r: any) => r.shopType).filter((t: any) => t != null))]
    .filter((t: number) => capabilities[t] === undefined)
  types.forEach((shopType: number) => {
    getWaybillCapabilities(shopType).then((res: any) => {
      capabilities[shopType] = res.data || {}
    }).catch(() => {
      capabilities[shopType] = {}
    })
  })
}

function capability(row: any) {
  return capabilities[Number(row?.shopType)] || {}
}

// ==================== 面单账号筛选条 ====================

// 按行内出现的 shopId 懒加载账号并缓存
const accountCache = reactive<Record<number, any[]>>({})
const accountPool = ref<any[]>([])

const categoryChips = [
  { label: '店铺自用', value: 'self' },
  { label: '供应商', value: 'supplier' },
  { label: '云仓', value: 'cloud' }
]

function shipperTypeLabel(type: any) {
  const value = type == null ? 0 : Number(type)
  if (value === 0) return '店铺自用'
  if (value === 300) return '供应商'
  if (value === 100 || value === 110 || value === 200) return '云仓'
  return '其他'
}

/** 按 shipperType#shipperId 分组，0#（店铺自用）置顶 */
function groupAccounts(list: any[]) {
  const map: Record<string, any> = {}
  list.forEach((a: any) => {
    const type = a.shipperType == null ? 0 : Number(a.shipperType)
    const shipperId = Number(a.shipperId || 0)
    const key = `${type}#${shipperId}`
    if (!map[key]) {
      const label = shipperTypeLabel(type)
      map[key] = { key, name: shipperId ? `${label}#${shipperId}` : label, type, accounts: [] }
    }
    map[key].accounts.push(a)
  })
  return Object.keys(map).map((k) => map[k]).sort((a: any, b: any) => {
    if (a.key.indexOf('0#') === 0) return -1
    if (b.key.indexOf('0#') === 0) return 1
    return String(a.name).localeCompare(String(b.name))
  })
}

/** 行内出现过的店铺懒加载面单账号，chip 条展示当前页可筛选账号 */
function loadRowAccounts() {
  const pairs: { shopId: number; shopType: number }[] = []
  const seen = new Set<number>()
  rows.value.forEach((r: any) => {
    const shopId = Number(r.shopId)
    if (!shopId || seen.has(shopId)) return
    seen.add(shopId)
    pairs.push({ shopId, shopType: Number(r.shopType) })
  })
  const tasks = pairs
    .filter((p) => !accountCache[p.shopId])
    .map((p) => getWaybillAccountOptions({ shopId: p.shopId }).then((res: any) => {
      accountCache[p.shopId] = res.data || []
    }).catch(() => {
      accountCache[p.shopId] = []
    }))
  Promise.allSettled(tasks).then(() => {
    const pool: any[] = []
    seen.forEach((shopId) => {
      (accountCache[shopId] || []).forEach((a: any) => {
        if (!pool.some((x: any) => x.id === a.id)) pool.push(a)
      })
    })
    accountPool.value = pool
  })
}

const accountGroups = computed(() => groupAccounts(accountPool.value))

function selectAllGroup() {
  filters.waybillAccountId = null
  filters.shipperCategory = null
  handleQuery()
}

function selectCategory(value: string) {
  filters.waybillAccountId = null
  filters.shipperCategory = filters.shipperCategory === value ? null : value
  handleQuery()
}

function selectAccount(account: any) {
  filters.shipperCategory = null
  filters.waybillAccountId = filters.waybillAccountId === account.id ? null : account.id
  handleQuery()
}

function clearAllocatePending() {
  filters.allocatePending = false
  handleQuery()
}

// ==================== 列表查询 ====================

function buildQuery() {
  const p: any = {
    pageNum: queryParams.pageNum,
    pageSize: queryParams.pageSize
  }
  if (filters.orderNums) p.orderNums = filters.orderNums
  if (filters.shopId !== null && filters.shopId !== undefined) p.shopId = filters.shopId
  if (filters.shopType !== null && filters.shopType !== undefined) p.shopType = filters.shopType
  if (filters.waybillStatus !== null && filters.waybillStatus !== undefined) p.waybillStatus = filters.waybillStatus
  if (filters.goodsKeyword) p.goodsKeyword = filters.goodsKeyword
  if (filters.receiverName) p.receiverName = filters.receiverName
  if (filters.receiverMobile) p.receiverMobile = filters.receiverMobile
  if (filters.waybillAccountId) p.waybillAccountId = filters.waybillAccountId
  if (filters.shipperCategory) p.shipperCategory = filters.shipperCategory
  if (filters.allocatePending) p.allocatePending = true
  if (filters.sortField && filters.sortOrder) {
    p.sortField = filters.sortField
    p.sortOrder = filters.sortOrder
  }
  return p
}

function getList() {
  loading.value = true
  pageWaybillOrders(buildQuery()).then((res: any) => {
    rows.value = res.rows || []
    total.value = res.total || 0
    selection.value = []
    loadCapabilities()
    loadRowAccounts()
  }).finally(() => {
    loading.value = false
  })
}

function handleQuery() {
  queryParams.pageNum = 1
  getList()
}

function resetQuery() {
  Object.assign(filters, defaultFilters())
  handleQuery()
}

function handleSelectionChange(selected: any[]) {
  selection.value = selected
}

function handleSortChange({ prop, order }: any) {
  filters.sortField = order ? prop : ''
  filters.sortOrder = order || ''
  queryParams.pageNum = 1
  getList()
}

// ==================== 行内动作显隐 ====================

function isNoWaybill(row: any) {
  return row.waybillStatus == null || Number(row.waybillStatus) === 0
}

function canDistribute(row: any) {
  return isNoWaybill(row)
}

function canTake(row: any) {
  return !!capability(row).take && row.allocated && isNoWaybill(row)
}

function canCancel(row: any) {
  return !!capability(row).cancel && Number(row.waybillStatus) === 1
}

function canPrint(row: any) {
  return !!capability(row).print && Number(row.waybillStatus) === 1
}

function canReprint(row: any) {
  return !!capability(row).print && Number(row.waybillStatus) === 2
}

function canShip(row: any) {
  return !!capability(row).ship && Number(row.waybillStatus) === 2
}

function canManualShip(row: any) {
  return isNoWaybill(row)
}

// ==================== 通用目标单筛选与结果提示 ====================

function pickOrders(row: any, predicate: (r: any) => boolean, emptyMsg: string): any[] {
  const source = row ? [row] : selection.value.slice()
  if (!source.length) {
    ElMessage.warning('请先勾选订单')
    return []
  }
  const matched = source.filter(predicate)
  if (!matched.length) {
    ElMessage.warning(emptyMsg)
    return []
  }
  if (matched.length < source.length) {
    ElMessage.info(`已跳过不符合条件的 ${source.length - matched.length} 单，本次操作 ${matched.length} 单`)
  }
  return matched
}

function notifyResult(data: any, action: string) {
  if (!data) {
    ElMessage.success(`${action}成功`)
    return
  }
  if (Number(data.failCount || 0) > 0) {
    const fails = (data.failures || [])
      .slice(0, 3)
      .map((i: any) => `${i.orderNum || i.orderId}：${i.reason || '未知原因'}`)
      .join('；')
    ElMessage.warning(`成功 ${data.successCount || 0} 单，失败 ${data.failCount} 单。${fails}`)
  } else {
    ElMessage.success(`${action}成功 ${data.successCount || 0} 单`)
  }
}

// ==================== 取号 / 取消取号 / 发货 ====================

function handleTake(row: any) {
  const orders = pickOrders(row, canTake, '所选订单均不满足取号条件（平台支持取号、已分配面单账号且未取号）')
  if (!orders.length) return
  ElMessageBox.confirm(`将对 ${orders.length} 单发起取号，取号成功后回写快递单号，是否继续？`, '取号确认', { type: 'warning' })
    .then(() => {
      submitting.value = true
      return takeWaybill({ orderIds: orders.map((o: any) => o.id) })
    }).then((res: any) => {
      notifyResult(res.data, '取号')
      getList()
    }).catch(() => {}).finally(() => {
      submitting.value = false
    })
}

function handleCancel(row: any) {
  const orders = pickOrders(row, canCancel, '所选订单均不能取消取号（平台支持取消且处于已取号未打印）')
  if (!orders.length) return
  ElMessageBox.confirm(`将取消 ${orders.length} 单的平台快递单号并回到未取号（面单账号保留），是否继续？`, '取消取号确认', { type: 'warning' })
    .then(() => {
      submitting.value = true
      return cancelWaybill({ orderIds: orders.map((o: any) => o.id) })
    }).then((res: any) => {
      notifyResult(res.data, '取消取号')
      getList()
    }).catch(() => {}).finally(() => {
      submitting.value = false
    })
}

function handleShip(row: any) {
  const orders = pickOrders(row, canShip, '所选订单均不满足发货条件（平台支持发货且处于已打印未发货）')
  if (!orders.length) return
  ElMessageBox.confirm(`将对 ${orders.length} 单回传平台并发货，发货后不可撤销，是否继续？`, '发货确认', { type: 'warning' })
    .then(() => {
      submitting.value = true
      return shipWaybill({ orderIds: orders.map((o: any) => o.id) })
    }).then((res: any) => {
      notifyResult(res.data, '发货')
      getList()
    }).catch(() => {}).finally(() => {
      submitting.value = false
    })
}

// ==================== 打印 / 补打（本地打印组件 + 状态回传） ====================

const printVisible = ref(false)
const printSubmitting = ref(false)
const printIsReprint = ref(false)
const printShopType = ref<number>(0)
const printOrders = ref<any[]>([])
const printDocs = ref<any[]>([])
const printerList = ref<PrinterInfo[]>([])
const printerLoading = ref(false)
const printPrinterName = ref('')

const printMissingCount = computed(() => printDocs.value.filter((d: any) => !d.hasData).length)

function handlePrint(row: any) {
  const orders = pickOrders(row, canPrint, '所选订单均不满足打印条件（平台支持打印且处于已取号未打印）')
  if (!orders.length) return
  if (!ensureSameShopType(orders)) return
  ElMessageBox.confirm(
    `将通过本地打印组件打印 ${orders.length} 单电子面单，打印成功后回传「已打印」状态，是否继续？`,
    '打印确认',
    { type: 'warning' }
  ).then(() => {
    openPrintDialog(orders, false)
  }).catch(() => {})
}

function handleReprint(row: any) {
  const orders = pickOrders(row, canReprint, '所选订单均不满足补打条件（平台支持打印且处于已打印状态）')
  if (!orders.length) return
  if (!ensureSameShopType(orders)) return
  // 补打只重发打印任务，不再调 /print（状态已为已打印，重复回传会被后端拦截）
  openPrintDialog(orders, true)
}

function ensureSameShopType(orders: any[]) {
  const types = [...new Set(orders.map((o: any) => Number(o.shopType)))]
  if (types.length > 1) {
    ElMessage.warning('一次批量打印只能选择同一平台的订单（不同平台打印组件通道不同），请分平台操作')
    return false
  }
  return true
}

function openPrintDialog(orders: any[], isReprint: boolean) {
  printShopType.value = Number(orders[0].shopType)
  printIsReprint.value = isReprint
  printOrders.value = orders
  printDocs.value = []
  printPrinterName.value = ''
  printerList.value = []
  printVisible.value = true
  // 拉打印数据 + 打印机列表
  const tasks: Promise<any>[] = [
    getWaybillPrintData({ orderIds: orders.map((o: any) => o.id) }).then((res: any) => {
      const dataList: any[] = res.data || []
      const docMap = new Map<number, any>()
      dataList.forEach((d: any) => docMap.set(Number(d.orderId), d))
      printDocs.value = orders.map((o: any) => {
        const doc: any = docMap.get(Number(o.id)) || {}
        return {
          orderId: o.id,
          orderNum: o.orderNum,
          waybillCode: doc.waybillCode || o.waybillCode || '',
          hasData: !!doc.printData,
          copies: 1,
          doc
        }
      })
      if (printMissingCount.value > 0) {
        ElMessage.warning(`有 ${printMissingCount.value} 单未获取到打印数据，将仅回传已打印状态`)
      }
    }).catch(() => {
      printVisible.value = false
    }),
    loadPrinters().catch((e: any) => {
      ElMessage.error(e?.message || '打印组件连接失败')
    })
  ]
  Promise.allSettled(tasks)
}

function loadPrinters(): Promise<void> {
  if (!printShopType.value) return Promise.resolve()
  printerLoading.value = true
  return getPrinters(printShopType.value).then((list: PrinterInfo[]) => {
    printerList.value = list
    if (!printPrinterName.value && list.length) {
      printPrinterName.value = list[0].name
    }
  }).finally(() => {
    printerLoading.value = false
  })
}

function submitPrint() {
  if (!printPrinterName.value) {
    ElMessage.warning('请选择打印机')
    return
  }
  const validRows = printDocs.value.filter((d: any) => d.hasData && d.copies > 0)
  printSubmitting.value = true
  const afterPrintSuccess = () => {
    // 打印成功的单 + 缺打印数据的单，统一回传状态（补打不回传）
    if (!printIsReprint.value) {
      return printWaybill({ orderIds: printOrders.value.map((o: any) => o.id) }).then((res: any) => {
        notifyResult(res.data, '打印')
      })
    }
    ElMessage.success(`补打任务已发送至本地打印组件（${platformName(printShopType.value)}）`)
    return Promise.resolve()
  }
  const run = validRows.length
    ? printWaybills(
        printShopType.value,
        printPrinterName.value,
        validRows.flatMap((d: any) => Array.from({ length: d.copies }, () => toPrintDocument(d.doc)))
      ).then(afterPrintSuccess)
    : afterPrintSuccess()
  run.then(() => {
    printVisible.value = false
    getList()
  }).catch((e: any) => {
    ElMessage.error(e?.message || '打印失败')
  }).finally(() => {
    printSubmitting.value = false
  })
}

function toPrintDocument(doc: any): PrintDocument {
  return {
    waybillCode: doc.waybillCode || '',
    printData: doc.printData,
    sign: doc.sign,
    params: doc.params,
    templateUrl: doc.templateUrl,
    goodsDetail: doc.goodsDetail
  }
}

// ==================== 分配 / 改派 ====================

const distributeVisible = ref(false)
const distributeOrders = ref<any[]>([])
const distributeGroups = ref<any[]>([])
const selectedAccountId = ref<number | null>(null)

const distributeShopName = computed(() => {
  if (!distributeOrders.value.length) return '-'
  return shopName(distributeOrders.value[0].shopId)
})

function openDistribute(row: any) {
  const orders = row ? [row] : selection.value.slice()
  if (!orders.length) {
    ElMessage.warning('请先勾选订单')
    return
  }
  const shopKeys = [...new Set(orders.map((o: any) => `${o.shopId}#${o.shopType}`))]
  if (shopKeys.length > 1) {
    ElMessage.warning('一次分配只能选择同一店铺的订单，请分店铺操作')
    return
  }
  distributeOrders.value = orders
  selectedAccountId.value = null
  const shopId = Number(orders[0].shopId)
  const fetchAccounts = accountCache[shopId]
    ? Promise.resolve(accountCache[shopId])
    : getWaybillAccountOptions({ shopId }).then((res: any) => {
        accountCache[shopId] = res.data || []
        return accountCache[shopId]
      }).catch(() => {
        accountCache[shopId] = []
        return []
      })
  fetchAccounts.then((list: any[]) => {
    distributeGroups.value = groupAccounts(list)
    const availableIds = distributeGroups.value.reduce((acc: number[], g: any) => acc.concat(g.accounts.map((a: any) => a.id)), [])
    const accountIds = [...new Set(orders.map((o: any) => o.waybillAccountId).filter(Boolean))]
    if (accountIds.length === 1 && availableIds.indexOf(accountIds[0]) >= 0) {
      selectedAccountId.value = accountIds[0]
    } else if (availableIds.length === 1) {
      selectedAccountId.value = availableIds[0]
    }
    distributeVisible.value = true
  })
}

function submitDistribute() {
  if (!selectedAccountId.value) {
    ElMessage.warning('请选择面单账号')
    return
  }
  submitting.value = true
  distributeWaybill({
    orderIds: distributeOrders.value.map((o: any) => o.id),
    accountId: selectedAccountId.value
  }).then((res: any) => {
    notifyResult(res.data, '分配')
    distributeVisible.value = false
    getList()
  }).finally(() => {
    submitting.value = false
  })
}

// ==================== 手动发货 ====================

const manualShipVisible = ref(false)
const manualShipOrder = ref<any>(null)
const manualShipFormRef = ref<FormInstance>()
const logisticsOptions = ref<any[]>([])
const manualShipForm = reactive({ logisticsCode: '', waybillCode: '' })
const manualShipRules = reactive<FormRules>({
  logisticsCode: [{ required: true, message: '请选择快递公司', trigger: 'change' }],
  waybillCode: [{ required: true, message: '请输入快递单号', trigger: 'blur' }]
})

function openManualShip(row: any) {
  manualShipOrder.value = row
  manualShipForm.logisticsCode = ''
  manualShipForm.waybillCode = ''
  getFavoriteList().then((res: any) => {
    // 收藏快递公司按平台 shopType 过滤（rows: {id, shopType, logisticsName, logisticsCode}）
    logisticsOptions.value = (res.rows || []).filter((f: any) => String(f.shopType) === String(row.shopType))
    if (!logisticsOptions.value.length) {
      ElMessage.warning('该平台还没有收藏的常用快递，请先在「发货 → 常用快递公司」中添加')
      return
    }
    manualShipVisible.value = true
    manualShipFormRef.value?.clearValidate()
  })
}

function submitManualShip() {
  manualShipFormRef.value?.validate((valid: boolean) => {
    if (!valid) return
    const selected = logisticsOptions.value.find((c: any) => c.logisticsCode === manualShipForm.logisticsCode)
    submitting.value = true
    manualShipWaybill({
      orderId: manualShipOrder.value.id,
      logisticsCode: manualShipForm.logisticsCode,
      waybillCompany: selected?.logisticsName,
      waybillCode: manualShipForm.waybillCode
    }).then((res: any) => {
      notifyResult(res.data, '手动发货')
      manualShipVisible.value = false
      getList()
    }).finally(() => {
      submitting.value = false
    })
  })
}

// ==================== 初始化 ====================

onMounted(() => {
  loadShops()
  getList()
  // 倒计时列随时间刷新
  countdownTimer = window.setInterval(() => {
    now.value = Date.now()
  }, 60000)
})

onUnmounted(() => {
  if (countdownTimer) window.clearInterval(countdownTimer)
})
</script>

<style scoped lang="scss">
.filter-form {
  padding-top: 4px;
}

.account-group-bar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
  padding: 8px 10px;
  margin-bottom: 8px;
  background: #f7f8fa;
  border-radius: 4px;
}

.account-group-bar .bar-label {
  color: #606266;
  font-size: 13px;
}

.account-group-bar :deep(.el-tag) {
  cursor: pointer;
}

.account-group {
  display: inline-flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px;
  margin-right: 12px;
}

.account-group .group-name {
  color: #909399;
  font-size: 12px;
}

.toolbar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
  margin-bottom: 8px;
}

.selection-tip {
  color: #909399;
  font-size: 12px;
}

.order-num-line {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 4px;
}

.order-num {
  font-weight: 600;
}

.sub-line {
  margin-top: 2px;
  color: #909399;
  font-size: 12px;
}

.danger {
  color: #f56c6c;
}

.goods-cell {
  display: flex;
  align-items: center;
  gap: 10px;
}

.goods-info {
  min-width: 0;
}

.goods-title {
  overflow: hidden;
  font-size: 13px;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.goods-sub {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px;
  margin-top: 4px;
}

.sku-text {
  max-width: 180px;
  overflow: hidden;
  color: #909399;
  font-size: 12px;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.stay-warn {
  color: #e6a23c;
}

.stay-over {
  color: #f56c6c;
  font-weight: 600;
}

.dialog-tip {
  margin-bottom: 12px;
  color: #606266;
  font-size: 13px;
}

.account-option-group {
  margin-bottom: 14px;
}

.account-option-group .group-title {
  margin-bottom: 8px;
  font-weight: 600;
  color: #303133;
}

.account-radio {
  margin-bottom: 8px;
}

.mb12 {
  margin-bottom: 12px;
}

.inner-table {
  padding: 4px 20px;
  background: #fafafa;
}
</style>
