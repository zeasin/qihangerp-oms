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
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘宝天猫</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 13">快手小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他</span>
          </el-option>
        </el-select>
      </el-form-item>
      <!--
        <el-form-item label="标签" prop="tag">
          <el-input
            v-model="queryParams.tag"
            placeholder="请输入标签"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        -->
      <el-form-item label="收件人" prop="receiverName">
        <el-input
          v-model="queryParams.receiverName"
          placeholder="请输入收件人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="receiverPhone">
        <el-input
          v-model="queryParams.receiverPhone"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <!--  <el-form-item label="城市" prop="city">
         <el-input
           v-model="queryParams.city"
           placeholder="请输入城市"
           clearable
           @keyup.enter.native="handleQuery"
         />
       </el-form-item>
       <el-form-item label="省份" prop="province">
         <el-input
           v-model="queryParams.province"
           placeholder="请输入省份"
           clearable
           @keyup.enter.native="handleQuery"
         />
       </el-form-item> -->

      <el-form-item label="快递单号" prop="shippingNumber">
        <el-input
          v-model="queryParams.shippingNumber"
          placeholder="请输入快递单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
<!--      <el-table-column label="订单ID" align="center" prop="id" />-->
      <el-table-column label="订单号" align="center" prop="orderNum" />
       <el-table-column label="物流公司" align="center" prop="logisticsCompany" />
       <el-table-column label="物流单号" align="center" prop="logisticsCode" />
       <el-table-column label="发货时间" align="center" prop="shipTime" />
       <el-table-column label="运费" align="center" prop="logisticsFee" />
       <el-table-column label="发货人" align="center" prop="shippingMan" />


      <el-table-column label="收件信息" align="center" prop="receiverName" >
        <template slot-scope="scope">
          {{scope.row.receiverName}}   {{scope.row.receiverPhone}}<br />
          {{scope.row.address}}
        </template>
      </el-table-column>
      <!-- <el-table-column label="手机号" align="center" prop="receiverPhone" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="address" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="town" /> -->
      <!-- <el-table-column label="省" align="center" prop="province" /> -->
      <!-- <el-table-column label="市" align="center" prop="city" /> -->
      <el-table-column label="包裹信息" align="center" >
        <template slot-scope="scope">
          长：{{scope.row.length}}mm   宽：{{scope.row.width}}mm  高：{{scope.row.height}}mm<br />
          重量：{{scope.row.weight}}g

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
import {listShipOrder} from "@/api/shipping/shipOrder";
import { listShop } from "@/api/shop/shop";
import { listLogistics } from "@/api/shipping/logistics";
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
    listLogistics({}).then(resp=>{
      this.logisticsList = resp.rows
    })
    this.getList();
  },
  methods: {
    /** 查询店铺订单列表 */
    getList() {
      this.loading = true;
      listShipOrder(this.queryParams).then(response => {
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
