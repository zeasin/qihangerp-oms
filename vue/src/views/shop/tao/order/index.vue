<template>
  <div class="app-container">
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

<!--      <el-form-item label="下单日期" prop="orderCreateTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.orderCreateTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="请选择订单创建时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
      <el-form-item label="订单状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable @change="handleQuery">
          <el-option label="等待卖家发货" value="WAIT_SELLER_SEND_GOODS" ></el-option>
          <el-option label="等待买家确认收货" value="WAIT_BUYER_CONFIRM_GOODS"></el-option>
          <el-option label="交易成功" value="TRADE_FINISHED"> </el-option>
          <el-option label="交易自动关闭" value="TRADE_CLOSED"></el-option>
          <el-option label="卖家或买家主动关闭交易" value="TRADE_CLOSED_BY_TAOBAO"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">

      <el-col :span="1.5">
        <el-button
          :loading="pullLoading"
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
        >API拉取订单</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          :loading="pullLoading"-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handlePullDetailByTid"-->
<!--        >API拉取单个订单</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-refresh"
          size="mini"
          :disabled="multiple"
          @click="handlePushOms"
        >手动推送订单</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单号" align="center" prop="tid" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.items" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.picPath"></el-image>
              <div style="margin-left:10px">
              <p>{{item.title}}</p>
              <p>{{item.skuPropertiesName}}&nbsp;
                <el-tag size="small">x {{item.num}}</el-tag>
                </p>
                <p v-if="scope.row.refundStatus === 0">
                  <el-button type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="总金额" align="center" prop="payment" :formatter="amountFormatter" />
      <el-table-column label="下单时间" align="center" prop="orderCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.created) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="买家留言" align="center" prop="buyerMessage" />
      <el-table-column label="卖家备注" align="center" prop="sellerMemo" />
      <el-table-column label="订单状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 'WAIT_BUYER_PAY'"> 等待买家付款</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'SELLER_CONSIGNED_PART'"> 卖家部分发货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'WAIT_SELLER_SEND_GOODS'"> 等待卖家发货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'WAIT_BUYER_CONFIRM_GOODS'"> 等待买家确认收货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'TRADE_FINISHED'"> 交易成功</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'TRADE_CLOSED'"> 交易自动关闭</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'TRADE_CLOSED_BY_TAOBAO'"> 卖家或买家主动关闭交易</el-tag>
          <el-tag size="small" v-if="scope.row.status === 'PAID_FORBID_CONSIGN'"> 禁止发货</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row>
            <el-button
              :loading="pullLoading"
              type="text"
              @click="handlePullUpdate(scope.row)"
            >详情</el-button>
            <el-button
              :loading="pullLoading"
              type="text"
              icon="el-icon-refresh"
              @click="handlePullUpdate(scope.row)"
            >更新</el-button>
          </el-row>
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


  </div>
</template>

<script>
import {listOrder, pullOrder, getOrder, pushOms, pullOrderDetail} from "@/api/tao/order";
import { listShop } from "@/api/shop/shop";
import { searchSku } from "@/api/goods/goods";
import {MessageBox} from "element-ui";
import {isRelogin} from "../../../../utils/request";

export default {
  name: "OrderTao",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      pullLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      detailOpen: false,
      multiple: true,
      // 总条数
      total: 0,
      // 淘宝订单表格数据
      orderList: [],
      shopList:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopId: null,
        tid: null,
        status: null
      },
      // 表单参数
      form: {
      },
      rules: {
      }
    };
  },
  created() {
    listShop({platform: 4}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
    // this.getList();
  },
  methods: {
    amountFormatter(row, column, cellValue, index) {
      return '￥' + cellValue.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
    /** 查询淘宝订单列表 */
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
      this.open = false;
      this.detailOpen = false;
      this.saleAfterOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        shopId: null
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
      this.ids = selection.map(item => item.tid)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handlePullDetailByTid(){
      if(this.queryParams.shopId && this.queryParams.tid) {
        this.pullLoading = true
        pullOrderDetail({shopId:this.queryParams.shopId,orderId:this.queryParams.tid}).then(response => {
          console.log('拉取淘宝订单接口返回=====',response)
          this.$modal.msgSuccess(JSON.stringify(response));
          this.pullLoading = false
        })
      }else{
        this.$modal.msgSuccess("请先输入订单号并且选择店铺");
      }
    },
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullOrder({shopId:this.queryParams.shopId,updType:0}).then(response => {
          console.log('拉取淘宝订单接口返回=====',response)
          if(response.code === 1401) {
              MessageBox.confirm('Token已过期，需要重新授权', '系统提示', { confirmButtonText: '重新授权', cancelButtonText: '取消', type: 'warning' }).then(() => {
                isRelogin.show = false;
                // store.dispatch('LogOut').then(() => {
                location.href = response.data.tokenRequestUrl+'?shopId='+this.queryParams.shopId
                // })
              }).catch(() => {
                isRelogin.show = false;
              });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          }else{
            this.$modal.msgSuccess(JSON.stringify(response));
            this.getList()
          }
          this.pullLoading = false
        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    handlePullUpdate(row) {
      // 接口拉取订单并更新
      this.pullLoading = true
      pullOrderDetail({shopId:row.shopId,orderId:row.tid}).then(response => {
          console.log('拉取淘宝订单接口返回=====',response)
        this.$modal.msgSuccess(JSON.stringify(response));
        this.pullLoading = false
      })
    },
    handleDetail(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.taoOrderItemList;
        this.detailOpen = true;
        this.detailTitle = "订单详情";
      });
      this.isAudit = false
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {

        }
      });
    },
    handlePushOms(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否批量重新推送订单？').then(function() {
        return pushOms({ids:ids});
      }).then(() => {
        // this.getList();
        this.$modal.msgSuccess("推送成功");
      }).catch(() => {});
    },
  }
};
</script>
