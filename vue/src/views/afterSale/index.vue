<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="退货单号" prop="afterSaleOrderId">
        <el-input
          v-model="queryParams.afterSaleOrderId"
          placeholder="请输入退货单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="源订单号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入源订单号"
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
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">淘宝天猫</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">京东</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">拼多多</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">视频号小店</span>
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="商品id" prop="goodsId">
        <el-input
          v-model="queryParams.goodsId"
          placeholder="请输入商品id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="sku编码" prop="skuCode">
        <el-input
          v-model="queryParams.skuCode"
          placeholder="请输入sku编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

<!--      <el-form-item label="物流单号" prop="logisticsCode">-->
<!--        <el-input-->
<!--          v-model="queryParams.logisticsCode"-->
<!--          placeholder="请输入物流单号"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >手动处理售后</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleShippingLog"
        >ERP售后处理推送记录</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="退货单号" align="center" prop="afterSaleOrderId" />
      <el-table-column label="退货类型" align="center" prop="type" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.type === 10"> 退货</el-tag>
          <el-tag size="small" v-if="scope.row.type === 20"> 换货</el-tag>
          <el-tag size="small" v-if="scope.row.type === 80"> 补发</el-tag>
          <el-tag size="small" v-if="scope.row.type === 99"> 订单拦截</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="源订单号" align="center" prop="orderId" />
       <el-table-column label="店铺" align="center" prop="shopId" >
         <template slot-scope="scope">
           <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
         </template>
       </el-table-column>
       <el-table-column label="订单id" align="center" prop="orderId" />
       <el-table-column label="子订单id" align="center" prop="subOrderId" />
       <el-table-column label="商品" align="center" prop="title" />
       <el-table-column label="sku" align="center" prop="skuInfo" />
       <el-table-column label="SKU编码" align="center" prop="skuCode" />
      <el-table-column label="数量" align="center" prop="count" />
       <el-table-column label="物流公司" align="center" prop="shipCompany" />
      <el-table-column label="物流单号" align="center" prop="shipWaybillCode" />
      <el-table-column label="收货人" align="center" prop="receiverName" />
      <el-table-column label="手机号" align="center" prop="receiverTel" />
      <el-table-column label="收货地址" align="center" prop="receiverAddress" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 1"> 已发出</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2"> 已完成</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
           v-if="scope.row.status === 1"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['api:returned:edit']"
          >确认完成</el-button>
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

    <!-- 添加或修改退换货对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="店铺" prop="shopId">
          <el-select v-model="form.shopId" filterable r placeholder="搜索店铺" >
            <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
              <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">淘宝天猫</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">京东</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">拼多多</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">视频号小店</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="退货单号" prop="afterSaleOrderId">
          <el-input v-model="form.afterSaleOrderId" placeholder="请输入退货单号" />
        </el-form-item>
        <el-form-item label="源订单号" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入源订单号" />
        </el-form-item>
        <el-form-item label="子订单id" prop="subOrderId">
          <el-input v-model="form.subOrderId" placeholder="请输入订单id" />
        </el-form-item>
        <el-form-item label="平台商品id" prop="productId">
          <el-input v-model="form.productId" placeholder="请输入平台商品id" />
        </el-form-item>
        <el-form-item label="平台skuId" prop="skuId">
          <el-input v-model="form.skuId" placeholder="请输入平台skuId" />
        </el-form-item>
        <el-form-item label="Sku编码" prop="skuCode">
          <el-input v-model="form.skuCode" placeholder="请输入Sku编码" />
        </el-form-item>
        <el-form-item label="ERP商品id" prop="erpGoodsId">
          <el-input v-model="form.erpGoodsId" placeholder="请输入ERP商品id" />
        </el-form-item>
        <el-form-item label="ERP商品skuId" prop="erpSkuId">
          <el-input v-model="form.erpSkuId" placeholder="请输入ERP商品skuId" />
        </el-form-item>
        <el-form-item label="商品名称" prop="title">
          <el-input v-model="form.title" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品SKU信息" prop="skuInfo">
          <el-input v-model="form.skuInfo" placeholder="请输入商品SKU信息" />
        </el-form-item>
        <el-form-item label="数量" prop="count">
          <el-input v-model="form.count" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="发货物流公司" prop="shipCompany">
          <el-input v-model="form.shipCompany" placeholder="请输入发货物流公司" />
        </el-form-item>
        <el-form-item label="发货物流单号" prop="shipWaybillCode">
          <el-input v-model="form.shipWaybillCode" placeholder="请输入发货物流单号" />
        </el-form-item>
        <el-form-item label="收货人" prop="receiverName">
          <el-input v-model="form.receiverName" placeholder="请输入收货人" />
        </el-form-item>
        <el-form-item label="收货人手机号" prop="receiverTel">
          <el-input v-model="form.receiverTel" placeholder="请输入收货人手机号" />
        </el-form-item>
        <el-form-item label="收货地址" prop="receiverAddress">
          <el-input v-model="form.receiverAddress" placeholder="请输入收货地址" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
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
import {list, addShipAgain, shipAgainComplete} from "@/api/afterSale/after_sale";
import {listShop} from "@/api/shop/shop";

export default {
  name: "AfterSale",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 表格数据
      dataList: [],
      shopList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        afterSaleOrderId: null,
        shopId: null,
        orderId: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        shopId: [{ required: true, message: "请选择店铺", trigger: "change" }],
        afterSaleOrderId: [{ required: true, message: "不能为空", trigger: "blur" }],
        orderId: [{ required: true, message: "订单号不能为空", trigger: "blur" }],
        erpGoodsId: [{ required: true, message: "不能为空", trigger: "blur" }],
        erpSkuId: [{ required: true, message: "不能为空", trigger: "change" }],
        skuInfo: [{ required: true, message: "不能为空", trigger: "change" }],
        title: [{ required: true, message: "不能为空", trigger: "change" }],
        count: [{ required: true, message: "不能为空", trigger: "change" }],
        shipCompany: [{ required: true, message: "不能为空", trigger: "change" }],
        shipWaybillCode: [{ required: true, message: "不能为空", trigger: "change" }],
        receiverName: [{ required: true, message: "不能为空", trigger: "change" }],
        receiverTel: [{ required: true, message: "不能为空", trigger: "change" }],
        receiverAddress: [{ required: true, message: "不能为空", trigger: "change" }],
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
    /** 查询退换货列表 */
    getList() {
      this.loading = true;
      list(this.queryParams).then(response => {
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {};
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleAdd(){
      this.reset()
      this.open=true
      this.title="手动添加补发信息"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      shipAgainComplete(id).then(response => {
        this.$modal.msgSuccess("确认完成");
        this.getList()
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          addShipAgain(this.form).then(response => {
            this.$modal.msgSuccess("补发成功");
            this.open = false;
            this.getList();
          });

        }
      });
    }
  }
};
</script>
