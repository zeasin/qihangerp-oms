<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单编号"
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
            <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 1">1688</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 2">视频号小店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 3">京东</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 4">淘宝天猫</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 5">拼多多</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 6">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 7">小红书</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 8">快手</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 99">其他渠道</span>
          </el-option>
        </el-select>
      </el-form-item>
<!--      <el-form-item label="收件人" prop="receiverName">-->
<!--        <el-input-->
<!--          v-model="queryParams.receiverName"-->
<!--          placeholder="请输入收件人"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="手机号" prop="receiverMobile">-->
<!--        <el-input-->
<!--          v-model="queryParams.receiverMobile"-->
<!--          placeholder="请输入手机号"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="快递单号" prop="shippingNumber">-->
<!--        <el-input-->
<!--          v-model="queryParams.shippingNumber"-->
<!--          placeholder="请输入快递单号"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="订单状态" prop="orderStatus">
        <el-select v-model="queryParams.orderStatus" placeholder="请选择状态" clearable @change="handleQuery">
          <el-option label="待发货" value="1" ></el-option>
          <el-option label="已发货" value="2"></el-option>
          <el-option label="已完成" value="3"> </el-option>
          <el-option label="已取消" value="11"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="primary"-->
<!--          plain-->
<!--          icon="el-icon-refresh"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handlePushOms"-->
<!--        >手动将选中订单推送到ERP</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['shop:order:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="订单ID" align="center" prop="id" />-->
      <el-table-column label="订单编号" align="center" prop="orderNum" >
        <template slot-scope="scope">
          <p>{{scope.row.orderNum}}</p>
          <el-tag>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="店铺" align="center" prop="shopId" >-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.itemList" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.goodsImg"></el-image>
              <div style="margin-left:10px">
              <p>{{item.goodsTitle}}</p>
              <p>{{item.goodsSpec}}&nbsp;
                <el-tag size="small">x {{item.quantity}}</el-tag>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="订单备注" align="center" prop="remark" >
        <template slot-scope="scope">
          {{scope.row.buyerMemo}}<br />
          {{scope.row.sellerMemo}}
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="orderStatus" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.orderStatus === 1" style="margin-bottom: 6px;">待发货</el-tag>
          <el-tag v-if="scope.row.orderStatus === 2" style="margin-bottom: 6px;">已发货</el-tag>
          <el-tag v-if="scope.row.orderStatus === 3" style="margin-bottom: 6px;">已完成</el-tag>
          <el-tag v-if="scope.row.orderStatus === 21" style="margin-bottom: 6px;">待付款</el-tag>
          <el-tag v-if="scope.row.orderStatus === 11" style="margin-bottom: 6px;">已取消</el-tag>
          <br />
          <el-tag style="margin-bottom: 6px;" v-if="scope.row.hasPushErp === 1">已推送到ERP</el-tag>
          <el-tag type="danger" style="margin-bottom: 6px;" v-if="scope.row.hasPushErp === 0">待推送到ERP</el-tag>
<!--          <br />-->
<!--           &lt;!&ndash; 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 &ndash;&gt;-->
<!--           <el-tag v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>-->
<!--           <el-tag v-if="scope.row.refundStatus === 2">售后处理中</el-tag>-->
<!--           <el-tag v-if="scope.row.refundStatus === 3">退款中</el-tag>-->
<!--           <el-tag v-if="scope.row.refundStatus === 4">退款成功</el-tag>-->
        </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="amount" />
      <el-table-column label="收件信息" prop="receiverName" >
        <template slot-scope="scope">
          {{scope.row.receiverName}}&nbsp;  {{scope.row.receiverMobile}} <br />
          {{scope.row.province}} {{scope.row.city}} {{scope.row.town}}
        </template>
      </el-table-column>
      <el-table-column label="发货信息" align="center" prop="shippingNumber" >
        <template slot-scope="scope">
          {{scope.row.shippingNumber}}&nbsp; {{scope.row.shippingCompany}}<br />
          {{ parseTime(scope.row.shippingTime, '{y}-{m}-{d} {h}:{m}:{s}') }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
          >详情</el-button>
<!--          <div>-->
<!--            <el-button-->
<!--              size="mini"-->
<!--              type="success"-->
<!--              icon="el-icon-share"-->
<!--              @click="handleShip(scope.row)"-->
<!--            >订单发货</el-button>-->
<!--          </div>-->
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

    <!-- 订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body>
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="订单详情" name="orderDetail">
          <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>
            <el-descriptions title="订单信息">
              <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
              <el-descriptions-item label="订单号">{{form.orderNum}}</el-descriptions-item>

              <el-descriptions-item label="店铺">
                {{ shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:'' }}
                <el-tag size="small" v-if="form.shopType === 1">天猫</el-tag>
                <el-tag size="small" v-if="form.shopType === 4">拼多多</el-tag>
                <el-tag size="small" v-if="form.shopType === 3">抖店</el-tag>
                <el-tag size="small" v-if="form.shopType === 2">京东</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="买家留言">
                {{form.buyerMemo}}
              </el-descriptions-item>
              <el-descriptions-item label="卖家留言">
                {{form.sellerMemo}}
              </el-descriptions-item>

              <el-descriptions-item label="备注">
                {{form.remark}}
              </el-descriptions-item>
              <el-descriptions-item label="创建时间">
                {{ parseTime(form.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}
                <!-- <el-date-picker
                disabled
                  v-model="form.orderCreateTime"
                  type="datetime"
                  value-format="yyyy-MM-dd HH:mm:ss"
                  placeholder="请选择订单创建时间">
                </el-date-picker> -->
              </el-descriptions-item>
              <el-descriptions-item label="支付时间"> {{ form.payTime }}</el-descriptions-item>
              <el-descriptions-item label="最后更新时间"> {{ form.updateTime }}</el-descriptions-item>

              <el-descriptions-item label="订单状态">
                <el-tag v-if="form.orderStatus === 1" style="margin-bottom: 6px;">待发货</el-tag>
                <el-tag v-if="form.orderStatus === 2" style="margin-bottom: 6px;">已出库</el-tag>
                <el-tag v-if="form.orderStatus === 3" style="margin-bottom: 6px;">已发货</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="退款状态">
                <el-tag v-if="form.refundStatus === 1">无售后或售后关闭</el-tag>
                <el-tag v-if="form.refundStatus === 2">售后处理中</el-tag>
                <el-tag v-if="form.refundStatus === 3">退款中</el-tag>
                <el-tag v-if="form.refundStatus === 4">退款成功</el-tag>
              </el-descriptions-item>

            </el-descriptions>
            <el-descriptions title="付款信息">
              <el-descriptions-item label="商品总额">{{form.goodsAmount}}</el-descriptions-item>
              <el-descriptions-item label="实际支付金额">{{form.amount}}</el-descriptions-item>
            </el-descriptions>


            <el-descriptions title="收货信息">
              <el-descriptions-item label="收件人姓名">{{form.receiverName}}</el-descriptions-item>
              <el-descriptions-item label="收件人手机号">{{form.receiverMobile}}</el-descriptions-item>
              <el-descriptions-item label="省市区">{{form.province}}{{form.city}}{{form.town}}</el-descriptions-item>
              <el-descriptions-item label="详细地址">{{form.address}}</el-descriptions-item>
            </el-descriptions>
            <el-descriptions title="发货信息">

              <el-descriptions-item label="物流公司">{{form.shippingCompany}}</el-descriptions-item>
              <el-descriptions-item label="物流单号">{{form.shippingNumber}}</el-descriptions-item>
              <el-descriptions-item label="发货时间">{{form.shippingTime}}</el-descriptions-item>
            </el-descriptions>

          </el-form>

        </el-tab-pane>
        <el-tab-pane label="商品列表" name="orderItems" lazy>
          <el-table :data="form.itemList"  style="margin-bottom: 10px;">
            <!-- <el-table-column type="selection" width="50" align="center" /> -->
            <el-table-column label="序号" align="center" type="index" width="50"/>

            <el-table-column label="商品图片" prop="goodsImg" width="80">
              <template slot-scope="scope">
                <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
              </template>
            </el-table-column>
            <el-table-column label="商品标题" prop="goodsTitle" ></el-table-column>
            <el-table-column label="SKU" prop="goodsSpec" width="150"></el-table-column>
            <el-table-column label="sku编码" prop="specNum"></el-table-column>
            <el-table-column label="单价" prop="goodsPrice"></el-table-column>
            <el-table-column label="子订单金额" prop="itemAmount"></el-table-column>
            <el-table-column label="实付金额" prop="payment"></el-table-column>
            <el-table-column label="数量" prop="quantity"></el-table-column>
            <el-table-column label="状态" prop="refundStatus">
              <template slot-scope="scope">
                <el-tag v-if="scope.row.orderStatus === 1">待发货</el-tag>
                <el-tag v-if="scope.row.orderStatus === 2">已发货</el-tag>
                <el-tag v-if="scope.row.orderStatus === 3">已完成</el-tag>
                <el-tag v-if="scope.row.orderStatus === 11">已取消</el-tag>
              </template>
            </el-table-column>
<!--            <el-table-column label="退款状态" prop="refundStatus">-->
<!--              <template slot-scope="scope">-->
<!--                &lt;!&ndash; 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 &ndash;&gt;-->
<!--                <el-tag v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>-->
<!--                <el-tag v-if="scope.row.refundStatus === 2">售后处理中</el-tag>-->
<!--                <el-tag v-if="scope.row.refundStatus === 3">退款中</el-tag>-->
<!--                <el-tag v-if="scope.row.refundStatus === 4">退款成功</el-tag>-->
<!--              </template>-->
<!--            </el-table-column>-->
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="优惠明细" name="orderCou" lazy>
          <el-table :data="form.discounts"  style="margin-bottom: 10px;">
            <el-table-column label="序号" align="center" type="index" width="50"/>
            <el-table-column label="优惠名称" prop="name" ></el-table-column>
            <el-table-column label="优惠金额" prop="discountAmount"></el-table-column>
            <el-table-column label="优惠描述" prop="description"></el-table-column>
          </el-table>
        </el-tab-pane>
        <el-tab-pane label="物流单" name="orderLog" lazy>

        </el-tab-pane>
      </el-tabs>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrder, delOrder, addOrder, updateOrder } from "@/api/order/order";
import { listShop } from "@/api/shop/shop";

export default {
  name: "Order",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedSShopOrderItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 店铺订单表格数据
      orderList: [],
      // ${subTable.functionName}表格数据
      sShopOrderItemList: [],
      shopList:[],
      // 弹出层标题
      detailTitle:'订单详情',
      detailOpen:false,
      isAudit:false,
      activeName: 'orderDetail',
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null,
        shopId: null,
        tag: null,
        refundStatus: null,
        orderStatus: null,
        payTime: null,
        receiverName: null,
        receiverMobile: null,
        town: null,
        city: null,
        province: null,
        shippingTime: null,
        shippingNumber: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {

      }
    };
  },
  created() {
     listShop({}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  methods: {
    /** 查询店铺订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },

    reset(){

    },
    handleShip(row){

    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        // this.$nextTick(()=>{
        //   this.form.shipType = response.data.shipType
        // })
        this.detailOpen = true;
        this.detailTitle = "订单详情";
      });
      this.isAudit = false
    },
  }
};
</script>
