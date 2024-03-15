<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="供应商id" prop="supplierId">
<!--        <el-input-->
<!--          v-model="queryParams.supplierId"-->
<!--          placeholder="请输入供应商id"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->

          <el-select
            v-model="queryParams.supplierId"
            filterable
            placeholder="请选择供应商">
            <el-option
              v-for="item in supplierList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
      </el-form-item>

      <el-form-item label="应付日期" prop="date">
        <el-date-picker clearable
          v-model="queryParams.date"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择应付日期">
        </el-date-picker>
      </el-form-item>
<!--      <el-form-item label="发票号码" prop="invoiceNo">-->
<!--        <el-input-->
<!--          v-model="queryParams.invoiceNo"-->
<!--          placeholder="请输入发票号码"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="采购单号" prop="purchaseOrderNo">
        <el-input
          v-model="queryParams.purchaseOrderNo"
          placeholder="请输入采购单号"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['fms:payablePurchase:add']"
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
          v-hasPermi="['fms:payablePurchase:edit']"
        >修改</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['fms:payablePurchase:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['fms:payablePurchase:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="payablePurchaseList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="日期" align="center" prop="date" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="ID" align="center" prop="id" />-->
<!--      <el-table-column label="供应商id" align="center" prop="supplierId" />-->

      <el-table-column label="应付金额" align="center" prop="amount"  :formatter="formatAmount"/>
      <el-table-column label="采购单号" align="center" prop="purchaseOrderNo" />
      <el-table-column label="供应商名称" align="center" prop="supplierName" />
      <el-table-column label="发票号码" align="center" prop="invoiceNo" />

      <el-table-column label="采购说明" align="center" prop="purchaseDesc" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag type="info" v-if="scope.row.status === 0">已生成</el-tag>
          <el-tag type="success" v-if="scope.row.status === 1">已结算</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['fms:payablePurchase:edit']"
          >修改</el-button>
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['fms:payablePurchase:remove']"-->
<!--          >删除</el-button>-->
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

    <!-- 添加或修改财务管理-应付款-采购货款对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="供应商id" prop="supplierId">
          <el-input v-model="form.supplierId" placeholder="请输入供应商id" />
        </el-form-item>
        <el-form-item label="供应商名称" prop="supplierName">
          <el-input v-model="form.supplierName" placeholder="请输入供应商名称" />
        </el-form-item>
        <el-form-item label="应付金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入应付金额" />
        </el-form-item>
        <el-form-item label="应付日期" prop="date">
          <el-date-picker clearable
            v-model="form.date"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择应付日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发票号码" prop="invoiceNo">
          <el-input v-model="form.invoiceNo" placeholder="请输入发票号码" />
        </el-form-item>
        <el-form-item label="采购单号" prop="purchaseOrderNo">
          <el-input v-model="form.purchaseOrderNo" placeholder="请输入采购单号" />
        </el-form-item>
        <el-form-item label="采购说明" prop="purchaseDesc">
          <el-input v-model="form.purchaseDesc" type="textarea" placeholder="请输入内容" />
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
import { listPayablePurchase, getPayablePurchase, delPayablePurchase, addPayablePurchase, updatePayablePurchase } from "@/api/fms/payablePurchase";
import {listSupplier} from "@/api/scm/supplier";

export default {
  name: "PayablePurchase",
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
      // 财务管理-应付款-采购货款表格数据
      payablePurchaseList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        supplierId: null,
        supplierName: null,
        amount: null,
        date: null,
        invoiceNo: null,
        purchaseOrderNo: null,
        purchaseDesc: null,
        status: null,
      },
      supplierList:[],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        supplierId: [
          { required: true, message: "供应商id不能为空", trigger: "blur" }
        ],
        supplierName: [
          { required: true, message: "供应商名称不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "应付金额不能为空", trigger: "blur" }
        ],
        date: [
          { required: true, message: "应付日期不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    listSupplier({}).then(response => {
      this.supplierList = response.rows;
      // this.supplierLoading = false;
    });
    this.getList();
  },
  methods: {
    formatAmount(row, column) {
      return '￥' + (row.amount).toFixed(2); // 假设金额是以分为单位保存的
    },
    /** 查询财务管理-应付款-采购货款列表 */
    getList() {
      this.loading = true;
      listPayablePurchase(this.queryParams).then(response => {
        this.payablePurchaseList = response.rows;
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
        supplierId: null,
        supplierName: null,
        amount: null,
        date: null,
        invoiceNo: null,
        purchaseOrderNo: null,
        purchaseDesc: null,
        remark: null,
        status: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        updateBy: null
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
      this.title = "添加财务管理-应付款-采购货款";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPayablePurchase(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改财务管理-应付款-采购货款";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePayablePurchase(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPayablePurchase(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    // /** 删除按钮操作 */
    // handleDelete(row) {
    //   const ids = row.id || this.ids;
    //   this.$modal.confirm('是否确认删除财务管理-应付款-采购货款编号为"' + ids + '"的数据项？').then(function() {
    //     return delPayablePurchase(ids);
    //   }).then(() => {
    //     this.getList();
    //     this.$modal.msgSuccess("删除成功");
    //   }).catch(() => {});
    // },
    /** 导出按钮操作 */
    handleExport() {
      this.download('fms/payablePurchase/export', {
        ...this.queryParams
      }, `payablePurchase_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
