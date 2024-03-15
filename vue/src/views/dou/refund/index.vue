<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="售后单号" prop="aftersaleId">
        <el-input
          v-model="queryParams.aftersaleId"
          placeholder="请输入售后单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入抖音订单id"
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
      <el-form-item label="商品ID" prop="productId">
        <el-input
          v-model="queryParams.productId"
          placeholder="请输入商品ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      
      <el-form-item label="商品编码" prop="goodsNum">
        <el-input
          v-model="queryParams.goodsNum"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
     
      <el-form-item label="物流单号" prop="logisticsCode">
        <el-input
          v-model="queryParams.logisticsCode"
          placeholder="请输入物流单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="售后理由" prop="questionDesc">
        <el-input
          v-model="queryParams.questionDesc"
          placeholder="请输入售后理由"
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
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['dou:douRefund:add']"
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
          v-hasPermi="['dou:douRefund:edit']"
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
          v-hasPermi="['dou:douRefund:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['dou:douRefund:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="douRefundList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <!-- <el-table-column label="售后订单id，自增" align="center" prop="id" /> -->
      <el-table-column label="售后ID" align="center" prop="aftersaleId" />
      <el-table-column label="售后类型" align="center" prop="aftersaleType" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.aftersaleType === 1"> 已发货仅退款</el-tag>
          <el-tag size="small" v-if="scope.row.aftersaleType === 0"> 退货退款</el-tag>
          <el-tag size="small" v-if="scope.row.aftersaleType === 2"> 未发货仅退款</el-tag>
          <el-tag size="small" v-if="scope.row.aftersaleType === 3"> 换货</el-tag>
          <el-tag size="small" v-if="scope.row.aftersaleType === 9"> 拦截退货</el-tag>
          </template>
      </el-table-column>
      <el-table-column label="抖音订单id" align="center" prop="orderId" />
      <!-- <el-table-column label="抖音子订单id" align="center" prop="subOrderId" /> -->
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span v-if="scope.row.shopId==22">梦小妮牛仔裤</span>
        </template>
      </el-table-column>
      <el-table-column label="商品图片" align="center" prop="productPic" />
      <el-table-column label="商品id" align="center" prop="productId" />
      <el-table-column label="商品名" align="center" prop="productName" />
      <!-- <el-table-column label="商品编码" align="center" prop="goodsNum" /> -->
      <!-- <el-table-column label="该子订单购买的商品 sku_id" align="center" prop="comboId" /> -->
      <el-table-column label="商品规格" align="center" prop="goodsSpec" />
      <el-table-column label="商品规格编码" align="center" prop="specNum" />
      <el-table-column label="退货数量" align="center" prop="comboNum" />
      <el-table-column label="物流单号" align="center" prop="logisticsCode" />
      <!-- <el-table-column label="物流公司" align="center" prop="logisticsCompany" /> -->
      <!-- <el-table-column label="发货时间" align="center" prop="logisticsTime" /> -->
      <!-- <el-table-column label="收货时间" align="center" prop="receiptTime" /> -->
      <!-- <el-table-column label="订单取消原因" align="center" prop="cancelReason" /> -->
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="订单总金额 " align="center" prop="orderAmount" />
      <el-table-column label="退款金额" align="center" prop="comboAmount" />
      <el-table-column label="售后理由" align="center" prop="questionDesc" />
      <el-table-column label="申请退货时间" align="center" prop="applyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="确认状态" align="center" prop="auditStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.auditStatus === 0"> 未处理</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 2"> 已签收</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 9"> 供应商已退款</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="审核时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="d" align="center" prop="refundStatus" /> -->
      <!-- 枚举为6(待商家同意),7(待买家退货),11(待商家二次同意),12(售后成功),13(换货待买家收货),14(换货成功),27(商家一次拒绝),28(售后失败),29(商家二次拒绝) -->
      <!-- <el-table-column label="erp商品ID" align="center" prop="erpGoodsId" /> -->
      <!-- <el-table-column label="erp商品规格ID" align="center" prop="erpSpecId" /> -->
      <!-- <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['dou:douRefund:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['dou:douRefund:remove']"
          >删除</el-button>
        </template>
      </el-table-column> -->
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改抖店订单退款对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="售后id" prop="aftersaleId">
          <el-input v-model="form.aftersaleId" placeholder="请输入售后id" />
        </el-form-item>
        <el-form-item label="抖音订单id" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入抖音订单id" />
        </el-form-item>
        <el-form-item label="抖音子订单id" prop="subOrderId">
          <el-input v-model="form.subOrderId" placeholder="请输入抖音子订单id" />
        </el-form-item>
        <el-form-item label="订单所属商户id" prop="shopId">
          <el-input v-model="form.shopId" placeholder="请输入订单所属商户id" />
        </el-form-item>
        <el-form-item label="商品图片" prop="productPic">
          <el-input v-model="form.productPic" placeholder="请输入商品图片" />
        </el-form-item>
        <el-form-item label="商品id" prop="productId">
          <el-input v-model="form.productId" placeholder="请输入商品id" />
        </el-form-item>
        <el-form-item label="商品名" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入商品名" />
        </el-form-item>
        <el-form-item label="商品编码" prop="goodsNum">
          <el-input v-model="form.goodsNum" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="该子订单购买的商品 sku_id" prop="comboId">
          <el-input v-model="form.comboId" placeholder="请输入该子订单购买的商品 sku_id" />
        </el-form-item>
        <el-form-item label="商品规格" prop="goodsSpec">
          <el-input v-model="form.goodsSpec" placeholder="请输入商品规格" />
        </el-form-item>
        <el-form-item label="商品规格编码" prop="specNum">
          <el-input v-model="form.specNum" placeholder="请输入商品规格编码" />
        </el-form-item>
        <el-form-item label="退货数量" prop="comboNum">
          <el-input v-model="form.comboNum" placeholder="请输入退货数量" />
        </el-form-item>
        <el-form-item label="物流单号" prop="logisticsCode">
          <el-input v-model="form.logisticsCode" placeholder="请输入物流单号" />
        </el-form-item>
        <el-form-item label="物流公司" prop="logisticsCompany">
          <el-input v-model="form.logisticsCompany" placeholder="请输入物流公司" />
        </el-form-item>
        <el-form-item label="发货时间" prop="logisticsTime">
          <el-input v-model="form.logisticsTime" placeholder="请输入发货时间" />
        </el-form-item>
        <el-form-item label="收货时间" prop="receiptTime">
          <el-input v-model="form.receiptTime" placeholder="请输入收货时间" />
        </el-form-item>
        <el-form-item label="订单取消原因" prop="cancelReason">
          <el-input v-model="form.cancelReason" placeholder="请输入订单取消原因" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="父订单总金额 (单位: 分) 即用户实际支付金额, 不包含运费" prop="orderAmount">
          <el-input v-model="form.orderAmount" placeholder="请输入父订单总金额 (单位: 分) 即用户实际支付金额, 不包含运费" />
        </el-form-item>
        <el-form-item label="金额" prop="comboAmount">
          <el-input v-model="form.comboAmount" placeholder="请输入金额" />
        </el-form-item>
        <el-form-item label="售后理由" prop="questionDesc">
          <el-input v-model="form.questionDesc" placeholder="请输入售后理由" />
        </el-form-item>
        <el-form-item label="申请退货时间" prop="applyTime">
          <el-date-picker clearable
            v-model="form.applyTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择申请退货时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="审核时间" prop="auditTime">
          <el-date-picker clearable
            v-model="form.auditTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择审核时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="erp商品ID" prop="erpGoodsId">
          <el-input v-model="form.erpGoodsId" placeholder="请输入erp商品ID" />
        </el-form-item>
        <el-form-item label="erp商品规格ID" prop="erpSpecId">
          <el-input v-model="form.erpSpecId" placeholder="请输入erp商品规格ID" />
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
import { listDouRefund, getDouRefund, delDouRefund, addDouRefund, updateDouRefund } from "@/api/dou/douRefund";
import { listShop } from "@/api/shop/shop";
export default {
  name: "DouRefund",
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
      // 抖店订单退款表格数据
      douRefundList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        aftersaleId: null,
        aftersaleType: null,
        orderId: null,
        subOrderId: null,
        shopId: null,
        productPic: null,
        productId: null,
        productName: null,
        goodsNum: null,
        comboId: null,
        goodsSpec: null,
        specNum: null,
        comboNum: null,
        logisticsCode: null,
        logisticsCompany: null,
        logisticsTime: null,
        receiptTime: null,
        cancelReason: null,
        orderAmount: null,
        comboAmount: null,
        questionDesc: null,
        applyTime: null,
        auditStatus: null,
        auditTime: null,
        refundStatus: null,
        erpGoodsId: null,
        erpSpecId: null,
      },
      shopList:[],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        aftersaleType: [
          { required: true, message: "售后类型，枚举为0(退货退款),1(已发货仅退款),2(未发货仅退款),3(换货)不能为空", trigger: "change" }
        ],
        orderId: [
          { required: true, message: "抖音订单id不能为空", trigger: "blur" }
        ],
        subOrderId: [
          { required: true, message: "抖音子订单id不能为空", trigger: "blur" }
        ],
        shopId: [
          { required: true, message: "订单所属商户id不能为空", trigger: "blur" }
        ],
        comboNum: [
          { required: true, message: "退货数量不能为空", trigger: "blur" }
        ],
        orderAmount: [
          { required: true, message: "父订单总金额 (单位: 分) 即用户实际支付金额, 不包含运费不能为空", trigger: "blur" }
        ],
        comboAmount: [
          { required: true, message: "金额不能为空", trigger: "blur" }
        ],
        auditStatus: [
          { required: true, message: "确认状态0:未处理2已签收9供应商已退款不能为空", trigger: "change" }
        ],
        refundStatus: [
          { required: true, message: "枚举为6(待商家同意),7(待买家退货),11(待商家二次同意),12(售后成功),13(换货待买家收货),14(换货成功),27(商家一次拒绝),28(售后失败),29(商家二次拒绝)不能为空", trigger: "change" }
        ],
        erpGoodsId: [
          { required: true, message: "erp商品ID不能为空", trigger: "blur" }
        ],
        erpSpecId: [
          { required: true, message: "erp商品规格ID不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    listShop({type:6}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  methods: {
    /** 查询抖店订单退款列表 */
    getList() {
      this.loading = true;
      listDouRefund(this.queryParams).then(response => {
        this.douRefundList = response.rows;
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
        aftersaleId: null,
        aftersaleType: null,
        orderId: null,
        subOrderId: null,
        shopId: null,
        productPic: null,
        productId: null,
        productName: null,
        goodsNum: null,
        comboId: null,
        goodsSpec: null,
        specNum: null,
        comboNum: null,
        logisticsCode: null,
        logisticsCompany: null,
        logisticsTime: null,
        receiptTime: null,
        cancelReason: null,
        remark: null,
        orderAmount: null,
        comboAmount: null,
        questionDesc: null,
        applyTime: null,
        auditStatus: null,
        auditTime: null,
        refundStatus: null,
        erpGoodsId: null,
        erpSpecId: null,
        createTime: null,
        updateTime: null
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
      this.title = "添加抖店订单退款";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDouRefund(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改抖店订单退款";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDouRefund(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDouRefund(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除抖店订单退款编号为"' + ids + '"的数据项？').then(function() {
        return delDouRefund(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('dou/douRefund/export', {
        ...this.queryParams
      }, `douRefund_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
