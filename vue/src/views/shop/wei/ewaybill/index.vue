<template>
  <div class="app-container">
    <el-form :model="printParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
      <el-form-item label="订单号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
          <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
      <el-form-item>
        <el-select v-model="printParams.printer" placeholder="请选择打印机" clearable>
          <el-option
            v-for="item in printerList"
            :key="item.name"
            :label="item.name"
            :value="item.name">
          </el-option>
        </el-select>

      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-time"
          size="mini"
          :disabled="multiple"
          @click="handleGetEwaybillCode"
        >电子面单取号</el-button>
      </el-col>

      <el-col :span="1.5">

        <el-button
          type="success"
          plain
          :disabled="multiple"
          icon="el-icon-printer"
          size="mini"
          @click="handlePrintEwaybill"
        >电子面单打印</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-d-arrow-right"
          size="mini"
          :disabled="multiple"
          @click="handleShipSend"
        >电子面单发货</el-button>
      </el-col>

<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handlePrintEwaybill"-->
<!--        >打印电子面单</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />

      <el-table-column label="订单号" align="left" prop="orderId" width="180">
        <template slot-scope="scope">
          <p>{{scope.row.orderId}}</p>
          <el-tag  effect="plain">{{shopList.find(x=>x.id === scope.row.shopId).name}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="550">
        <template slot-scope="scope">
          <el-table :data="scope.row.items" :show-header="false">
            <el-table-column label="商品" align="center" prop="title" />
            <el-table-column label="SKU编码" align="center" prop="skuCode" />
            <el-table-column label="数量" align="center" prop="num" width="60">
              <template slot-scope="scope">
                <el-tag size="small">x {{scope.row.skuCnt}}</el-tag>
              </template>
            </el-table-column>
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="下单时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="收件信息" align="left" prop="userName" >
        <template slot-scope="scope">
          <span>{{scope.row.userName}} {{scope.row.telNumber}}</span><br />
          <span> {{scope.row.provinceName}} {{scope.row.cityName}} {{scope.row.countyName}}
            </span>
          <p>
            {{scope.row.maskPostAddress}}
          </p>
        </template>
      </el-table-column>
      <el-table-column label="面单号" align="center" prop="erpSendCode" />
      <el-table-column label="状态" align="center" prop="erpSendStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.erpSendStatus==0">未取号</el-tag>
          <el-tag size="small" v-if="scope.row.erpSendStatus==1">已取号</el-tag>
          <el-tag size="small" v-if="scope.row.erpSendStatus==2">已打印</el-tag>
          <el-tag size="small" v-if="scope.row.erpSendStatus==3">已发货</el-tag>
          <el-tag size="small" v-if="scope.row.erpSendStatus==10">手动发货</el-tag>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 取号 -->
    <el-dialog title="取号" :visible.sync="getCodeOpen" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="电子面单账户" prop="accountId">
          <el-select v-model="form.accountId" placeholder="请选择电子面单账户" clearable>
            <el-option
              v-for="item in deliverList"
              :key="item.id"
              :label="item.deliveryId"
              :value="item.id">
              <span style="float: left">{{ item.deliveryId }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px" >{{item.siteName}}:{{item.available}}</span>
            </el-option>
          </el-select>
          <el-button type="success" plain @click="updateWaybillAccount" >更新电子面单账户信息</el-button>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="getCodeOpenForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

import {listShop} from "@/api/shop/shop";
import {getWaybillAccountList, pullWaybillAccount, getWaybillCode, pushWaybillPrintSuccess,pushShipSend} from "@/api/wei/ewaybill";
import {listOrder} from "@/api/wei/order";
import {getWaybillPrintData} from "@/api/tao/ewaybill";


export default {
  name: "printWei",
  data() {
    return {
      // 遮罩层
      loading: true,
      getCodeOpen: false,
      // 选中数组
      ids: [],
      shopList: [],
      orderList: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        status: 20,
        erpSendStatus: -1,
      },
      // 打印参数
      printParams: {
        deliver: null,
        printer: null
      },
      // 表单参数
      form: {},
      printerList: [],
      deliverList: [],
      // 表单校验
      rules: {}
    };
  },
  created() {
    this.openWs()
    listShop({platform: 2}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    // 取号弹窗
    handleGetEwaybillCode() {
      const ids = this.ids;
      if (ids) {
        getWaybillAccountList({shopId: this.queryParams.shopId}).then(response => {
          this.deliverList = response.data;
          this.getCodeOpen = true
        });
      } else {
        this.$modal.msgError("请选择订单")
      }
    },
    // 更新电子面单信息
    updateWaybillAccount() {
      pullWaybillAccount({shopId: this.queryParams.shopId}).then(response => {
        this.deliverList = response.data;
      });
    },
    /** 取号提交按钮 */
    getCodeOpenForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          const ids = this.ids;
          console.log('=========3333========', ids)
          if (ids) {
            console.log('===请求参数=====', {shopId: this.queryParams.shopId, ids: ids, accountId: this.form.accountId})
            getWaybillCode({
              shopId: this.queryParams.shopId,
              ids: ids,
              accountId: this.form.accountId
            }).then(response => {
              this.$modal.msgSuccess("取号成功")
              this.getList()
              this.getCodeOpen = false
            });
          } else {
            this.$modal.msgError("请选择订单")
          }
        }
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.getCodeOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        erpSkuId: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleLink(row) {
      this.reset();
      const id = row.id || this.ids
      getGoodsSku(id).then(response => {
        console.log('=====00000000============',response)
        this.form = response.data;
        this.open = true;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          linkErpGoodsSkuId(this.form).then(response => {
            this.$modal.msgSuccess("关联成功");
            this.open = false;
            this.getList();
          });
        }
      });
    },
    openWs() {
      const ws = new WebSocket('ws://127.0.0.1:12705');
      ws.onopen = () => {
        console.log('与打印组件建立连接成功: ');
        // 或打印机
        ws.send(JSON.stringify({
          requestID: '12345',
          command: 'getPrinterList'
        }))
      };
      let obj = this.$modal;
      ws.onmessage = (e) => {
        const resp = JSON.parse(e.data || '{}')
        if (resp.command === 'getPrinterList') {
          this.printerList = resp.printerList
          obj.msgSuccess("打印组件连接成功！");
          console.log('打印机列表: ', resp.printerList);
        }
      };
      // 当发生错误时触发
      ws.onerror = function(error) {
        obj.msgError("打印组件连接失败！请安装并启动微信视频号小店打印组件！");
        console.error('WebSocket error:', error);
        // alert('WebSocket error occurred. Check the console for more details.');
      };
    },
    handlePrintEwaybill() {
      if (!this.printParams.printer) {
        this.$modal.msgError('请选择打印机！');
        return
      }
      getWaybillPrintData({shopId: this.queryParams.shopId, ids: this.ids}).then(response => {
        console.log("======打印======", response.data)
        if (response.data) {
          const ws = new WebSocket('ws://127.0.0.1:12705');

          ws.onopen = () => {
            console.log('开始打印: ');
            // 打印
            ws.send(JSON.stringify({
              command: 'print',
              version: '2.0', // 必传
              requestID: '1234', // String, 调用方保证唯一
              taskList: [{
                taskID: '1234', // String, 调用方保证唯一
                printInfo: 'JTdCJTIycHJpbnREYXRhJTIyJTNBJTdCJTIyd2F5YmlsbElkJTIyJTNBJTIyNzM2MTE0NjI1MzgzODUlMjIlMkMlMjJwcmludFRpbWUlMjIlM0ElMjIyMDI0JTJGMDYlMkYwMyUyMDE4JTNBNDUlMjIlMkMlMjJzZXJ2aWNlcyUyMiUzQSU1QiU1RCUyQyUyMnJlY2VpdmVyTmFtZSUyMiUzQSUyMiVFNSVBRSVBMyoqJTIyJTJDJTIycmVjZWl2ZXJQaG9uZSUyMiUzQSUyMjEzNyoqKiozODQwJTIyJTJDJTIycmVjZWl2ZXJBZGRyZXNzJTIyJTNBJTIyJUU0JUI4JThBJUU2JUI1JUI3JUU1JUI4JTgyJUU0JUI4JThBJUU2JUI1JUI3JUU1JUI4JTgyJUU2JUI1JUE2JUU0JUI4JTlDJUU2JTk2JUIwJUU1JThDJUJBJUU1JUJDJUEwJUU2JUIxJTlGJUU5JTk1JTg3JUU1JUFEJTk5JUU2JUExJUE1JUU4JUI3JUFGMjM4JUU1JUJDJTg0MzAlRTUlOEYlQjcyMDIlRTUlQUUlQTQlMjIlMkMlMjJzZW5kZXJOYW1lJTIyJTNBJTIyJUU0JUI4JTgzJUU5JTg3JThDJUU1JTlEJUFBJTIyJTJDJTIyc2VuZGVyUGhvbmUlMjIlM0ElMjIxNTgxODU5MDExOSUyMiUyQyUyMnNlbmRlckFkZHJlc3MlMjIlM0ElMjIlRTUlQjklQkYlRTQlQjglOUMlRTclOUMlODElRTYlQjclQjElRTUlOUMlQjMlRTUlQjglODIlRTUlQUUlOUQlRTUlQUUlODklRTUlOEMlQkF4eHh4eDElRTUlOEYlQjclRTUlOEMlOTclRTklOTclQTglMjIlMkMlMjJzaXRlQ29kZSUyMiUzQSUyMjU1ODMwJTIyJTJDJTIyZXdheWJpbGxPcmRlcklkJTIyJTNBJTIyMzQ4NjYxMzA5Mzg5ODE0MTY5OSUyMiUyQyUyMmJhZ0FkZHIlMjIlM0ElMjIlRTYlQjIlQUElRTQlQjglOUMlMjIlMkMlMjJtYXJrJTIyJTNBJTIyMzEwLSUyMFA2JTIwMDMxJTIwJTVCQjMxJTVEJTIyJTJDJTIyc3RvcmVOYW1lJTIyJTNBJTIyJUU5JUFBJTg0JUU5JUI5JUJGJUU2JTlDJTlCJUU1JUIxJUIxJUU0JUI4JTkzJUU1JThEJTk2JUU1JUJBJTk3JTIyJTJDJTIyY3VzdG9tZXJOb3RlcyUyMiUzQSUyMiUyMiUyQyUyMm1lcmNoYW50Tm90ZXMlMjIlM0ElMjIlMjIlMkMlMjJvcmRlcklkJTIyJTNBJTIyMzcyMDI5MzQxNTUwOTk1NDgxNiUyMiU3RCUyQyUyMnRlbXBsYXRlJTIyJTNBJTdCJTIydGVtcGxhdGVJZCUyMiUzQSUyMnNpbmdsZSUyMiUyQyUyMnRlbXBsYXRlTmFtZSUyMiUzQSUyMiVFOSVCQiU5OCVFOCVBRSVBNCVFNyVBOSVCQSVFNiVBOCVBMSVFNiU5RCVCRiUyMiUyQyUyMnRlbXBsYXRlRGVzYyUyMiUzQSUyMiVFNCVCOCU4MCVFOCU4MSU5NCVFNSU4RCU5NSVFNiVBMCU4NyVFNSU4NyU4NiVFNiVBOCVBMSVFNiU5RCVCRiUyMiUyQyUyMnRlbXBsYXRlVHlwZSUyMiUzQSUyMnNpbmdsZSUyMiUyQyUyMm9wdGlvbkxpc3QlMjIlM0ElN0IlN0QlMkMlMjJvcHRpb25zJTIyJTNBJTVCJTVEJTJDJTIyY29kZSUyMiUzQTAlMkMlMjJkZWxpdmVyeUlkJTIyJTNBJTIyWlRPJTIyJTJDJTIydGVtcGxhdGVVcmwlMjIlM0ElMjJodHRwcyUzQSUyRiUyRm1tZWMtc2hvcC0xMjU4MzQ0NzA3LmNvcy5hcC1zaGFuZ2hhaS5teXFjbG91ZC5jb20lMkZzaG9wJTJGcHVibGljJTJGMjAyMy0xMC0yNSUyRjNlY2JiM2FhLTViY2YtNDA0ZC05NzJhLThhMDhhODE2MjIzYy5odG1sJTIyJTJDJTIyY3VzdG9tQ29uZmlnJTIyJTNBJTdCJTIyd2lkdGglMjIlM0E2NTYlMkMlMjJoZWlnaHQlMjIlM0EzMDAlMkMlMjJsZWZ0JTIyJTNBNjAlMkMlMjJ0b3AlMjIlM0E5MzAlN0QlMkMlMjJ3aWR0aCUyMiUzQTc2JTJDJTIyaGVpZ2h0JTIyJTNBMTMwJTdEJTdE', // String, [获取打印报文]接口返回的print_info
                printNum: {
                  curNum: 1, // 打印计数-当前张数
                  sumNum: 2, // 打印计数-总张数
                },
                splitControl: 0,// 可不传， 默认为0， 根据自定义内容自动分页；1，禁止分页；2；强制分页， 内容打印在第二页
                showDeliveryLogo: 0, // 可不传， 默认为1， 传0时不展示快递公司logo
                // 自定义模板信息，没有自定义模板需求可不传

                // 面单补充信息，用来覆盖寄件人信息，没有这种需求可以不传

              }],
              printType: 1, // Number 打印类型，默认为 1，打印固定高度的面单；如果为2，则打印任意自定义内容，需要传递 size 参数指定纸张尺寸，printInfo 改为传递 base64 格式的 html
              size: {
                width: 76, // 纸张尺寸，单位毫米，printType 为 2 时必传
                height: 130
              },
              printer: this.printParams.printer, // 选中的打印机，printer.name
            }))
          };


          let obj = this.$modal;
          ws.onmessage = (e) => {
            const resp = JSON.parse(e.data || '{}')
            if (resp.command === 'print') {
              console.log('打印结果: ', resp);
              // 请求回调
              return pushWaybillPrintSuccess({shopId: this.queryParams.shopId, ids: this.ids})
              // obj.msgError("打印结果！"+JSON.stringify(resp));
            }
          };


          // 当发生错误时触发
          ws.onerror = function (error) {
            obj.msgError("打印失败！");
            console.error('WebSocket error:', error);
            // alert('WebSocket error occurred. Check the console for more details.');
          };
        }
      });
    },
    handleShipSend(){
      // this.$modal.msgError("开源版本未实现平台发货！请自行对接发货");
      pushShipSend({shopId: this.queryParams.shopId, ids: this.ids}).then(response => {
        this.$modal.msgSuccess("发货成功！");
        this.getList()
      })
    },
  }
};
</script>
