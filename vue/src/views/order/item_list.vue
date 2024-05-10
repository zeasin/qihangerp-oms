<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="子订单号" prop="subOrderNum">
        <el-input
          v-model="queryParams.subOrderNum"
          placeholder="请输入子订单号"
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
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">1688</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">视频号小店</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">京东</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘宝天猫</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 8">快手</span>
           <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他渠道</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="refundStatus">
        <el-select v-model="queryParams.refundStatus" placeholder="请选择状态" clearable @change="handleQuery">
          <el-option label="无售后或售后关闭" value="1" ></el-option>
          <el-option label="售后处理中" value="2"></el-option>
          <el-option label="退款中" value="3"> </el-option>
          <el-option label="退款成功" value="4"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="子订单编号" align="center" prop="subOrderNum" />
      <el-table-column label="订单编号" align="center" prop="orderNum" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <el-table-column label="商品图片"  prop="goodsImg">
        <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px;" :src="scope.row.goodsImg"></el-image>
        </template>
      </el-table-column>
      <el-table-column label="商品标题" align="center" prop="goodsTitle" />
      <el-table-column label="商品SKU" align="center" prop="goodsSpec" />
      <el-table-column label="平台SkuId" align="center" prop="skuId" />
      <el-table-column label="ERP SkuId" align="center" prop="erpSkuId" />
      <el-table-column label="子订单金额" align="center" prop="itemAmount" />
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
      <el-table-column label="退款状态" align="center" prop="refundStatus" >
        <template slot-scope="scope">
           <!-- 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 -->
           <el-tag v-if="scope.row.refundStatus === 1">无售后或售后关闭</el-tag>
           <el-tag v-if="scope.row.refundStatus === 2">售后处理中</el-tag>
           <el-tag v-if="scope.row.refundStatus === 3">退款中</el-tag>
           <el-tag v-if="scope.row.refundStatus === 4">退款成功</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleEditErpSku(scope.row)"
          >补充ERP SKU</el-button>
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
    <!-- 修改Erp Sku 对话框 -->
    <el-dialog title="修改ERP SKU ID" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="ERP商品skuId" prop="erpSkuId">
          <el-input type="number" v-model="form.erpSkuId" placeholder="请输入ERP商品skuId" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listOrderItem, updateErpSkuId} from "@/api/order/order";
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
      open:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null,
        shopId: null,
        subOrderNum: null,
        refundStatus: null
      },
      // 表单参数
      form: {
        id:null,
        erpSkuId:null
      },
      // 表单校验
      rules: {
        erpSkuId: [{ required: true, message: "请输入ERP系统商品SkuId", trigger: "change" }],
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
      listOrderItem(this.queryParams).then(response => {
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
    cancel(){
      this.form.id = null
      this.form.erpSkuId = null
      this.open = false
    },
    handleEditErpSku(row){
      this.form.id = row.id
      if(this.form.erpSkuId && this.form.erpSkuId > 0) {
        this.form.erpSkuId = row.erpSkuId
      }
      this.open = true
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          console.log('====修改参数====',this.form)
          updateErpSkuId(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });

        }
      });
    }
  }
};
</script>
