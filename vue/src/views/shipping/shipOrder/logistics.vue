<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="快递单号" prop="waybillCode">
        <el-input
          v-model="queryParams.waybillCode"
          placeholder="请输入快递单号"
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
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['shop:order:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="订单号" align="left" prop="orderId" width="220"/>
      <el-table-column label="店铺" prop="orderId" align="left"  >
        <template slot-scope="scope">
         {{shopList.find(x=>x.id === scope.row.shopId).name}}
        </template>
      </el-table-column>

       <el-table-column label="物流公司" align="center" prop="logisticsCode" />
       <el-table-column label="物流单号" align="center" prop="waybillCode" />
      <el-table-column label="取号时间" align="center" prop="createTime" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="发货时间" align="center" prop="updateTime" >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 0">待备货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 1">备货中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已出库</el-tag>
          <el-tag size="small" v-if="scope.row.status === 3">已发货</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="快递单号" align="center" prop="shippingNumber" />-->
      <!-- <el-table-column label="物流公司" align="center" prop="shippingCompany" /> -->
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-col :span="24">-->
<!--          <el-button-->
<!--            size="mini" style="width: 80px;"-->
<!--            type="success"-->
<!--            icon="el-icon-s-promotion"-->
<!--            @click="handleShip(scope.row)"-->
<!--            v-hasPermi="['shop:order:edit']"-->
<!--          >打包发货</el-button>-->
<!--          </el-col>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-view"-->
<!--            @click="handleDetail(scope.row)"-->
<!--            v-hasPermi="['shop:order:edit']"-->
<!--          >详情</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-view"-->
<!--            @click="handleDetail(scope.row)"-->
<!--            v-hasPermi="['shop:order:edit']"-->
<!--          >打印发货单</el-button>-->

<!--        </template>-->
<!--      </el-table-column>-->
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
import {listShipOrderWaybill} from "@/api/shipping/shipOrder";
import { listShop } from "@/api/shop/shop";

export default {
  name: "ShipOrderLogistics",
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
      shipOpen:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shipStatus: 3
      },
      logisticsList:[],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        height: [{ required: true, message: '不能为空' }],
        weight: [{ required: true, message: '不能为空' }],
        shippingNumber: [{ required: true, message: '不能为空' }],
        shippingCompany: [{ required: true, message: '不能为空' }],
        shippingMan: [{ required: true, message: '不能为空' }],
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
      listShipOrderWaybill(this.queryParams).then(response => {
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
    cancel(){
      this.shipOpen = false
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('api/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    },
    reset(){

    },
    /** 删除按钮操作 */
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
    /** 打包发货 **/
    handleShip(row){
      this.reset();
      getOrder(row.id).then(response => {
        this.form = response.data;

        this.shipOpen = true;
        // this.detailTitle = "订单详情";
      });

    },
    submitShipForm(){
      this.$refs["form"].validate(valid => {
        if (valid) {
          shipOrder(this.form).then(resp =>{
            this.$modal.msgSuccess("发货成功");
          })
        }
      })
    }
  }
};
</script>
