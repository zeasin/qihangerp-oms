<template>
  <div class="app-container">
    <el-row>
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="订单号" prop="tid">
          <el-input
            v-model="queryParams.tid"
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

    </el-row>


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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="left" prop="orderId" >
        <template slot-scope="scope">
          <p>{{scope.row.orderId}}</p>
          <el-tag size="small">{{shopList.find(x=>x.id === scope.row.shopId).name}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
        <template slot-scope="scope">
          <el-row v-for="item in scope.row.itemList" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <!--              <el-image  style="width: 70px; height: 70px;" :src="item.picPath"></el-image>-->
              <div style="margin-left:10px">
                <p>{{item.skuName}}</p>
                <p>{{item.outerSkuId}}&nbsp;
                  <el-tag size="small">x {{item.itemTotal}}</el-tag>
                </p>
                <p v-if="scope.row.refundStatus === 0">
                  <el-button type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </p>
              </div>
            </div>
          </el-row>
        </template>
      </el-table-column>
      <el-table-column label="下单时间" align="center" prop="orderStartTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderStartTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="buyerMessage" >
        <template slot-scope="scope">
          <span v-if="scope.row.orderRemark">买家备注:{{ scope.row.orderRemark }}</span>
          <span v-if="scope.row.venderRemark">商家备注:{{ scope.row.venderRemark }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收件信息" align="left" prop="receiverState" >
        <template slot-scope="scope">
          <div>
            {{scope.row.fullname}}&nbsp;{{scope.row.mobile}}
          </div>
          <div>
            {{scope.row.province}} &nbsp;{{scope.row.city}}&nbsp;{{scope.row.county}}&nbsp;{{scope.row.town}}
          </div>
          <div>
            {{scope.row.fullAddress}}
          </div>
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
                :label="item.providerName"
                :value="item.id">
                <span style="float: left">{{ item.providerName }}</span>
                <span style="float: right; color: #8492a6; font-size: 13px" >{{item.branchName}}:{{item.amount}}</span>
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
import {listOrder} from "@/api/jd/order";
import {
  getWaybillAccountList,
  pullWaybillAccount,
  getWaybillCode,
  getWaybillPrintData,
  pushWaybillPrintSuccess, pushShipSend
} from "@/api/jd/ewaybill";

export default {
  name: "printJd",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      shopList: [],
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
      // 取号弹出
      getCodeOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderState: 'WAIT_SELLER_STOCK_OUT',
        erpSendStatus:-1,
        shopId: null
      },
      // 打印参数
      printParams: {
        deliver: null,
        printer: null
      },
      // 表单参数
      form: {},
      orderList: [],
      printerList: [],
      deliverList: [],
      // 表单校验
      rules: {
        accountId: [{ required: true, message: '请选择电子面单账户' }],
      }
    };
  },
  created() {
    this.openWs()
    listShop({platform: 3}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
  },
  methods: {
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    openWs() {
      const ws = new WebSocket('ws://127.0.0.1:9113');
      ws.onopen = () => {
        console.log('与打印组件建立连接成功: ');
        // 或打印机
        ws.send(JSON.stringify({
          requestID: '12345',
          cmd: 'getPrinters',
          "version": "1.0"
        }))
      };
      let obj = this.$modal;
      ws.onmessage = (e) => {
        const resp = JSON.parse(e.data || '{}')
        if (resp.cmd === 'getPrinters') {
          this.printerList = resp.printers
          obj.msgSuccess("打印组件连接成功！");
          console.log('打印机列表: ', resp.printers);
        }
      };
      // 当发生错误时触发
      ws.onerror = function (error) {
        obj.msgError("打印组件连接失败！请安装并启动京东云打印组件！");
        console.error('WebSocket error:', error);
        // alert('WebSocket error occurred. Check the console for more details.');
      };
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
    handlePrintEwaybill() {
      // if (!this.ws) {
      //   this.$modal.msgError('打印组件连接失败！请安装并启动微信视频号小单打印组件！');
      //   this.openWs()
      // }
      // if(!this.printParams.deliver){
      //   this.$modal.msgError('请选择快递公司！');
      //   return
      // }
      if (!this.printParams.printer) {
        this.$modal.msgError('请选择打印机！');
        return
      }
      const ids = this.ids;
      getWaybillPrintData({shopId: this.queryParams.shopId, ids: ids}).then(response => {
        console.log("======打印======", response.data)
        if (response.data) {
          const ws = new WebSocket('ws://127.0.0.1:9113');
          ws.onopen = () => {
            let printData = []
            response.data.forEach(x => printData.push(JSON.parse(x.printData)))
            console.log('开始打印: 组合打印数据：', printData);
            // 打印
            ws.send(JSON.stringify({
              "cmd": "print",
              "requestID": this.getUUID(8, 16),
              "version": "1.0",
              "task": {
                "taskID": this.getUUID(8,10),
                "preview": false,
                "printer": this.printParams.printer,
                "previewType": "pdf",
                "firstDocumentNumber": 10,
                "totalDocumentCount": 100,
                "documents": [{
                  "documentID": this.getUUID(8,10),
                  "contents": printData
                }]
              }
            }))
          };
          let obj = this.$modal;
          ws.onmessage = (e) => {
            const resp = JSON.parse(e.data || '{}')
            if (resp.cmd === 'print') {
              console.log('打印结果: ', resp);
              obj.msgSuccess("打印成功！" + JSON.stringify(resp));
              // 请求回调
              return pushWaybillPrintSuccess({shopId: this.queryParams.shopId, ids: ids})
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
      pushShipSend({shopId: this.queryParams.shopId, ids: ids}).then(response => {
        this.$modal.msgSuccess("发货成功！");
        this.getList()
      })
    },
    getUUID(len, radix) {
      var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
      var uuid = [], i;
      radix = radix || chars.length;
      if (len) {
        for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
      } else {
        var r;
        uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
        uuid[14] = '4';
        for (i = 0; i < 36; i++) {
          if (!uuid[i]) {
            r = 0 | Math.random() * 16;
            uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
          }
        }
      }
      return uuid.join('');
    }
  }
};
</script>
