<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderSn">
        <el-input
          v-model="queryParams.orderSn"
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
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="售后原因" prop="afterSaleReason">
        <el-input
          v-model="queryParams.afterSaleReason"
          placeholder="请输入售后原因"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      
      <el-form-item label="拼多多商品id" prop="goodsId">
        <el-input
          v-model="queryParams.goodsId"
          placeholder="请输入拼多多商品id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      
      <el-form-item label="商品编码" prop="goodsNumber">
        <el-input
          v-model="queryParams.goodsNumber"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
     
      <el-form-item label="快递单号" prop="trackingNumber">
        <el-input
          v-model="queryParams.trackingNumber"
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
      <!-- <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['pdd:pddRefund:add']"
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
          v-hasPermi="['pdd:pddRefund:edit']"
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
          v-hasPermi="['pdd:pddRefund:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['pdd:pddRefund:export']"
        >导出</el-button>
      </el-col> -->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="pddRefundList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <el-table-column label="售后编号" align="center" prop="id" />
      <el-table-column label="订单编号" align="center" prop="orderSn" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span v-if="scope.row.shopId==5">梦小妮潮流女装</span>
        </template>
      </el-table-column>
      <el-table-column label="售后类型" align="center" prop="afterSalesType" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.afterSalesType === 2"> 仅退款</el-tag>
          <el-tag size="small" v-if="scope.row.afterSalesType === 3"> 退货退款</el-tag>
          <el-tag size="small" v-if="scope.row.afterSalesType === 4"> 换货</el-tag>
          <el-tag size="small" v-if="scope.row.afterSalesType === 5"> 缺货补寄</el-tag>
          <el-tag size="small" v-if="scope.row.afterSalesType === 9"> 拦截退货</el-tag>
          </template>
        </el-table-column>
      <!-- <el-table-column label="售后状态" align="center" prop="afterSalesStatus" /> -->
      <!-- 1：全部 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款， 待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒 绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处 理，退款失败 13：买家逾期，超过有效期 14 : 换货补寄待商家处理 15:换货补寄待用户处理 16:换货补寄成功 17:换货补寄失败 18:换货补寄待用户确认完成 31：商家同意拒收退款，待用户拒收;32: 待商家补寄发货 -->
      <el-table-column label="售后原因" align="center" prop="afterSaleReason" />
      <!-- <el-table-column label="订单成团时间" align="center" prop="confirmTime" /> -->
      <el-table-column label="创建时间" align="center" prop="createdTime" >
        <template slot-scope="scope">
          {{dateToString(scope.row.createdTime)}}
        </template>
        </el-table-column>
      <!-- <el-table-column label="订单折扣金额" align="center" prop="discountAmount" /> -->
      <el-table-column label="订单金额" align="center" prop="orderAmount" />
      <el-table-column label="退款金额" align="center" prop="refundAmount" />
      <el-table-column label="商品图片" align="center" prop="goodsImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.goodsImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <!-- <el-table-column label="拼多多商品id" align="center" prop="goodsId" /> -->
      <!-- <el-table-column label="拼多多商品skuid" align="center" prop="skuId" /> -->
      <el-table-column label="商品名称" align="center" prop="goodsName" />
      <!-- <el-table-column label="商品编码" align="center" prop="goodsNumber" /> -->
      <!-- <el-table-column label="商品编码" align="center" prop="skuNumber" /> -->
      <el-table-column label="商品规格" align="center" prop="skuInfo" />
      <el-table-column label="数量" align="center" prop="quantity" />
      <!-- <el-table-column label="商品价格，单位：元" align="center" prop="goodsPrice" /> -->
      <!-- <el-table-column label="更新时间" align="center" prop="updatedTime" /> -->
      <el-table-column label="快递单号" align="center" prop="trackingNumber" />
      <!-- <el-table-column label="快递公司" align="center" prop="trackingCompany" /> -->
      <el-table-column label="审核状态" align="center" prop="auditStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.auditStatus === 0"> 未处理</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 2"> 已签收</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 9"> 供应商已退款</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="订单发货状态" align="center" prop="shippingStatus" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.shippingStatus === 0"> 未发货</el-tag>
          <el-tag size="small" v-if="scope.row.shippingStatus === 1"> 已发货</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="0-未勾选 1-消费者选择的收货状态为未收到货 2-消费者选择的收货状态为已收到货" align="center" prop="userShippingStatus" /> -->
      <!-- <el-table-column label="审核时间" align="center" prop="auditTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
      <el-table-column label="备注" align="center" prop="describe" />
      <el-table-column label="退货说明" align="center" prop="remark" />
      
      <!-- <el-table-column label="erp退货单号" align="center" prop="erpOrderReturnNum" /> -->
      <!-- <el-table-column label="erp退货单id" align="center" prop="erpOrderReturnId" /> -->
      <el-table-column label="标记" align="center" prop="sign" />
      <!-- <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
           <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['pdd:pddRefund:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['pdd:pddRefund:remove']"
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

    <!-- 添加或修改拼多多订单退款对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单编号" prop="orderSn">
          <el-input v-model="form.orderSn" placeholder="请输入订单编号" />
        </el-form-item>
        <el-form-item label="内部店铺ID" prop="shopId">
          <el-input v-model="form.shopId" placeholder="请输入内部店铺ID" />
        </el-form-item>
        <el-form-item label="售后原因" prop="afterSaleReason">
          <el-input v-model="form.afterSaleReason" placeholder="请输入售后原因" />
        </el-form-item>
        <el-form-item label="订单成团时间" prop="confirmTime">
          <el-input v-model="form.confirmTime" placeholder="请输入订单成团时间" />
        </el-form-item>
        <el-form-item label="时间" prop="createdTime">
          <el-input v-model="form.createdTime" placeholder="请输入时间" />
        </el-form-item>
        <el-form-item label="订单折扣金额" prop="discountAmount">
          <el-input v-model="form.discountAmount" placeholder="请输入订单折扣金额" />
        </el-form-item>
        <el-form-item label="订单金额" prop="orderAmount">
          <el-input v-model="form.orderAmount" placeholder="请输入订单金额" />
        </el-form-item>
        <el-form-item label="退款金额" prop="refundAmount">
          <el-input v-model="form.refundAmount" placeholder="请输入退款金额" />
        </el-form-item>
        <el-form-item label="商品图片" prop="goodsImage">
          <image-upload v-model="form.goodsImage"/>
        </el-form-item>
        <el-form-item label="拼多多商品id" prop="goodsId">
          <el-input v-model="form.goodsId" placeholder="请输入拼多多商品id" />
        </el-form-item>
        <el-form-item label="拼多多商品skuid" prop="skuId">
          <el-input v-model="form.skuId" placeholder="请输入拼多多商品skuid" />
        </el-form-item>
        <el-form-item label="商品名称" prop="goodsName">
          <el-input v-model="form.goodsName" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品编码" prop="goodsNumber">
          <el-input v-model="form.goodsNumber" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="商品编码" prop="skuNumber">
          <el-input v-model="form.skuNumber" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="商品规格" prop="skuInfo">
          <el-input v-model="form.skuInfo" placeholder="请输入商品规格" />
        </el-form-item>
        <el-form-item label="数量" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入数量" />
        </el-form-item>
        <el-form-item label="商品价格，单位：元" prop="goodsPrice">
          <el-input v-model="form.goodsPrice" placeholder="请输入商品价格，单位：元" />
        </el-form-item>
        <el-form-item label="更新时间" prop="updatedTime">
          <el-input v-model="form.updatedTime" placeholder="请输入更新时间" />
        </el-form-item>
        <el-form-item label="快递单号" prop="trackingNumber">
          <el-input v-model="form.trackingNumber" placeholder="请输入快递单号" />
        </el-form-item>
        <el-form-item label="快递公司" prop="trackingCompany">
          <el-input v-model="form.trackingCompany" placeholder="请输入快递公司" />
        </el-form-item>
        <el-form-item label="审核时间" prop="auditTime">
          <el-date-picker clearable
            v-model="form.auditTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择审核时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="describe">
          <el-input v-model="form.describe" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="退货说明" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入退货说明" />
        </el-form-item>
        <el-form-item label="erp退货单号" prop="erpOrderReturnNum">
          <el-input v-model="form.erpOrderReturnNum" placeholder="请输入erp退货单号" />
        </el-form-item>
        <el-form-item label="erp退货单id" prop="erpOrderReturnId">
          <el-input v-model="form.erpOrderReturnId" placeholder="请输入erp退货单id" />
        </el-form-item>
        <el-form-item label="标记" prop="sign">
          <el-input v-model="form.sign" placeholder="请输入标记" />
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
import { listPddRefund, getPddRefund, delPddRefund, addPddRefund, updatePddRefund } from "@/api/pdd/pddRefund";
import { listShop } from "@/api/shop/shop";
export default {
  name: "PddRefund",
  data() {
    return {
      shopList:[],
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
      // 拼多多订单退款表格数据
      pddRefundList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderSn: null,
        shopId: null,
        afterSalesType: null,
        afterSalesStatus: null,
        afterSaleReason: null,
        confirmTime: null,
        createdTime: null,
        discountAmount: null,
        orderAmount: null,
        refundAmount: null,
        goodsImage: null,
        goodsId: null,
        skuId: null,
        goodsName: null,
        goodsNumber: null,
        skuNumber: null,
        skuInfo: null,
        quantity: null,
        goodsPrice: null,
        updatedTime: null,
        trackingNumber: null,
        trackingCompany: null,
        auditStatus: null,
        auditTime: null,
        describe: null,
        shippingStatus: null,
        userShippingStatus: null,
        erpOrderReturnNum: null,
        erpOrderReturnId: null,
        sign: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        orderSn: [
          { required: true, message: "订单编号不能为空", trigger: "blur" }
        ],
        shopId: [
          { required: true, message: "内部店铺ID不能为空", trigger: "blur" }
        ],
        afterSalesType: [
          { required: true, message: "必填，售后类型2：仅退款 3：退货退款 4：换货 5：缺货补寄 9:拦截退货不能为空", trigger: "change" }
        ],
        afterSalesStatus: [
          { required: true, message: "必填，售后状态 1：全部 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款， 待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒 绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处 理，退款失败 13：买家逾期，超过有效期 14 : 换货补寄待商家处理 15:换货补寄待用户处理 16:换货补寄成功 17:换货补寄失败 18:换货补寄待用户确认完成 31：商家同意拒收退款，待用户拒收;32: 待商家补寄发货不能为空", trigger: "change" }
        ],
        afterSaleReason: [
          { required: true, message: "售后原因不能为空", trigger: "blur" }
        ],
        confirmTime: [
          { required: true, message: "订单成团时间不能为空", trigger: "blur" }
        ],
        createdTime: [
          { required: true, message: "时间不能为空", trigger: "blur" }
        ],
        discountAmount: [
          { required: true, message: "订单折扣金额不能为空", trigger: "blur" }
        ],
        orderAmount: [
          { required: true, message: "订单金额不能为空", trigger: "blur" }
        ],
        refundAmount: [
          { required: true, message: "退款金额不能为空", trigger: "blur" }
        ],
        quantity: [
          { required: true, message: "数量不能为空", trigger: "blur" }
        ],
        goodsPrice: [
          { required: true, message: "商品价格，单位：元不能为空", trigger: "blur" }
        ],
        auditStatus: [
          { required: true, message: "审核状态2已签收9供应商已退款不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    listShop({type:5}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  methods: {
    dateToString(timespan){
            var date = new Date(timespan * 1000);
            return date.toLocaleString();
        },
    /** 查询拼多多订单退款列表 */
    getList() {
      this.loading = true;
      listPddRefund(this.queryParams).then(response => {
        this.pddRefundList = response.rows;
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
        orderSn: null,
        shopId: null,
        afterSalesType: null,
        afterSalesStatus: null,
        afterSaleReason: null,
        confirmTime: null,
        createdTime: null,
        discountAmount: null,
        orderAmount: null,
        refundAmount: null,
        goodsImage: null,
        goodsId: null,
        skuId: null,
        goodsName: null,
        goodsNumber: null,
        skuNumber: null,
        skuInfo: null,
        quantity: null,
        goodsPrice: null,
        updatedTime: null,
        trackingNumber: null,
        trackingCompany: null,
        auditStatus: null,
        auditTime: null,
        describe: null,
        remark: null,
        shippingStatus: null,
        userShippingStatus: null,
        erpOrderReturnNum: null,
        erpOrderReturnId: null,
        sign: null
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
      this.title = "添加拼多多订单退款";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPddRefund(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改拼多多订单退款";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePddRefund(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPddRefund(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除拼多多订单退款编号为"' + ids + '"的数据项？').then(function() {
        return delPddRefund(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('pdd/pddRefund/export', {
        ...this.queryParams
      }, `pddRefund_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
