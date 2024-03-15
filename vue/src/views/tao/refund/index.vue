<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="退款单号" prop="refundId">
        <el-input
          v-model="queryParams.refundId"
          placeholder="请输入退款单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单号" prop="tid">
        <el-input
          v-model="queryParams.tid"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
     
      <el-form-item label="申请时间" prop="created">
        <!-- <el-input
          v-model="queryParams.created"
          placeholder="请输入退款申请时间。"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
        <el-date-picker clearable
          v-model="queryParams.created"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择退款申请时间">
        </el-date-picker>
      </el-form-item>
      

      <!-- <el-form-item label="退款原因" prop="reason">
        <el-input
          v-model="queryParams.reason"
          placeholder="请输入退款原因"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
     
      <el-form-item label="物流单号" prop="logisticsCode">
        <el-input
          v-model="queryParams.logisticsCode"
          placeholder="请输入物流单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
     
      <el-form-item label="店铺" prop="shopId">
        <!-- <el-input
          v-model="queryParams.shopId"
          placeholder="请输入店铺"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
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
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['tao:taoRefund:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['tao:taoRefund:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['tao:taoRefund:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tao:taoRefund:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="taoRefundList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="id" /> -->
      <el-table-column label="退款单号" align="center" prop="refundId" />
      <el-table-column label="类型" align="center" prop="afterSalesType" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.afterSalesType === 1"> 退货</el-tag>
          <el-tag size="small" v-if="scope.row.afterSalesType === 3"> 换货</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="订单号" align="center" prop="tid" />
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="scope.row.productImgUrl"></el-image>
              <div style="margin-left:10px">
              <p>{{scope.row.goodsTitle}}</p>
              <p>{{scope.row.skuInfo}}</p>
              </div>
            </div>
          </template>
      </el-table-column>
      <el-table-column label="退货数量" align="center" prop="num" />
      <!-- <el-table-column label="子订单号。如果是单笔交易oid会等于tid" align="center" prop="oid" /> -->
      <!-- <el-table-column label="买家昵称" align="center" prop="buyerNick" /> -->
      <!-- <el-table-column label="交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分" align="center" prop="totalFee" /> -->
      <!-- <el-table-column label="支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分" align="center" prop="payment" /> -->
      <el-table-column label="退款金额" align="center" prop="refundFee" />
      <!-- <el-table-column label="退款申请时间。" align="center" prop="created" /> -->
      <!-- <el-table-column label="更新时间。" align="center" prop="modified" /> -->
      <!-- <el-table-column label="退款对应的订单交易状态。" align="center" prop="orderStatus" /> -->
      <!-- <el-table-column label="退款状态" align="center" prop="status" /> -->
      <!-- <el-table-column label="货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)" align="center" prop="goodStatus" /> -->
      
      <!-- <el-table-column label="买家是否需要退货。可选值:true(是),false(否)" align="center" prop="hasGoodReturn" /> -->
      <el-table-column label="退款原因" align="center" prop="reason" />
      <!-- <el-table-column label="退款说明" align="center" prop="desc" /> -->
      <!-- <el-table-column label="物流公司" align="center" prop="logisticsCompany" /> -->
      <el-table-column label="退货物流" align="center" prop="logisticsCode" />
      <!-- <el-table-column label="发货时间" align="center" prop="sendTime" /> -->
      <el-table-column label="处理状态" align="center" prop="auditStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.auditStatus === 0"> 未处理</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 2"> 已签收</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 9"> 供应商已退款</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="处理时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收货时间" align="center" prop="receivedTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.receivedTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="${comment}" align="center" prop="address" /> -->
      <el-table-column label="备注" align="center" prop="remark" />
      <!-- <el-table-column label="创建时间" align="center" prop="createOn" /> -->
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span v-if="scope.row.shopId==6">梦小妮牛仔裤</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="${comment}" align="center" prop="erpGoodsId" /> -->
      <!-- <el-table-column label="${comment}" align="center" prop="erpGoodsSpecId" /> -->
      <!-- <el-table-column label="sku编号" align="center" prop="specNumber" /> -->
      <!-- <el-table-column label="退款阶段，可选值：onsale/aftersale" align="center" prop="refundPhase" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
          v-if="scope.row.auditStatus === 0 && scope.row.afterSalesType === 1 "
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleConfirm(scope.row)"
            v-hasPermi="['tao:taoRefund:edit']"
          >退货确认</el-button>
          <!-- <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['tao:taoRefund:remove']"
          >删除</el-button> -->
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

    <!-- 添加或修改淘宝退款订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="退款ID" prop="refundId">
          <el-input v-model="form.refundId" placeholder="请输入退款id" disabled/>
        </el-form-item>
        <el-form-item label="订单单号" prop="tid">
          <el-input v-model="form.tid" placeholder="请输入淘宝交易单号" disabled/>
        </el-form-item>
        <el-form-item label="退还金额" prop="refundFee">
          <el-input v-model="form.refundFee" placeholder="请输入退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分" disabled/>
        </el-form-item>
        <el-form-item label="sku编号" prop="specNumber">
          <el-input v-model="form.specNumber" placeholder="请输入sku编号" />
        </el-form-item>
        <el-form-item label="退货数量" prop="num">
          <el-input v-model="form.num" placeholder="请输入退货数量" disabled/>
        </el-form-item>
        <el-form-item label="物流公司" prop="logisticsCompany">
          <el-input v-model="form.logisticsCompany" placeholder="请输入物流公司" />
        </el-form-item>
        <el-form-item label="物流单号" prop="logisticsCode">
          <el-input v-model="form.logisticsCode" placeholder="请输入物流单号" />
        </el-form-item>
        <el-form-item label="发货时间" prop="sendTime">
          <el-date-picker clearable
            v-model="form.sendTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择发货时间">
          </el-date-picker>
        </el-form-item>
       
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listTaoRefund, getTaoRefund, delTaoRefund, addTaoRefund, updateTaoRefund } from "@/api/tao/taoRefund";
import { listShop } from "@/api/shop/shop";
export default {
  name: "TaoRefund",
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
      // 淘宝退款订单表格数据
      taoRefundList: [],
      shopList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        refundId: null,
        afterSalesType: null,
        tid: null,
        oid: null,
        buyerNick: null,
        totalFee: null,
        payment: null,
        refundFee: null,
        created: null,
        modified: null,
        orderStatus: null,
        status: null,
        goodStatus: null,
        num: null,
        hasGoodReturn: null,
        reason: null,
        desc: null,
        logisticsCompany: null,
        logisticsCode: null,
        sendTime: null,
        auditStatus: null,
        auditTime: null,
        receivedTime: null,
        address: null,
        createOn: null,
        shopId: null,
        erpGoodsId: null,
        erpGoodsSpecId: null,
        specNumber: null,
        refundPhase: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        num: [
          { required: true, message: "退货数量不能为空", trigger: "blur" }
        ],
        logisticsCompany: [
          { required: true, message: "不能为空", trigger: "change" }
        ],
        logisticsCode: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
        sendTime: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listShop({type:4}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  methods: {
    /** 查询淘宝退款订单列表 */
    getList() {
      this.loading = true;
      listTaoRefund(this.queryParams).then(response => {
        this.taoRefundList = response.rows;
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
      this.form = {
        id: null,
        refundId: null,
        afterSalesType: null,
        tid: null,
        oid: null,
        buyerNick: null,
        totalFee: null,
        payment: null,
        refundFee: null,
        created: null,
        modified: null,
        orderStatus: null,
        status: null,
        goodStatus: null,
        num: null,
        hasGoodReturn: null,
        reason: null,
        desc: null,
        logisticsCompany: null,
        logisticsCode: null,
        sendTime: null,
        auditStatus: null,
        auditTime: null,
        receivedTime: null,
        address: null,
        remark: null,
        createOn: null,
        shopId: null,
        erpGoodsId: null,
        erpGoodsSpecId: null,
        specNumber: null,
        refundPhase: null
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加淘宝退款订单";
    },
    /** 修改按钮操作 */
    handleConfirm(row) {
      this.reset();
      const id = row.id || this.ids
      getTaoRefund(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改淘宝退款订单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
            updateTaoRefund(this.form).then(response => {
              this.$modal.msgSuccess("确认成功");
              this.open = false;
              this.getList();
            });
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tao/taoRefund/export', {
        ...this.queryParams
      }, `taoRefund_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
