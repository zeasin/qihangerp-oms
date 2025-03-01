<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="86px">
      <el-form-item label="供应商名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入供应商名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商编码" prop="number">
        <el-input
          v-model="queryParams.number"
          placeholder="请输入供应商编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="联系人" prop="linkman">
        <el-input
          v-model="queryParams.linkman"
          placeholder="请输入联系人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="状态" prop="disable">-->
<!--        <el-input-->
<!--          v-model="queryParams.disable"-->
<!--          placeholder="请输入0启用   1禁用"-->
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
          v-hasPermi="['scm:supplier:add']"
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
          v-hasPermi="['scm:supplier:edit']"
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
          v-hasPermi="['scm:supplier:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['scm:supplier:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="supplierList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="主键" align="center" prop="id" />-->
      <el-table-column label="供应商名称" align="center" prop="name" />
      <el-table-column label="供应商编码" align="center" prop="number" />
<!--      <el-table-column label="税率" align="center" prop="taxRate" />-->
<!--      <el-table-column label="期初应付款" align="center" prop="amount" />-->
<!--      <el-table-column label="期初预付款" align="center" prop="periodMoney" />-->
<!--      <el-table-column label="初期往来余额" align="center" prop="difMoney" />-->
<!--      <el-table-column label="余额日期" align="center" prop="beginDate" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.beginDate, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <el-table-column label="联系人" align="center" prop="linkman" />
      <el-table-column label="联系方式" align="center" prop="contact" />

      <el-table-column label="职位" align="center" prop="place" />
      <el-table-column label="备注" align="center" prop="remark" />
<!--      <el-table-column label="省" align="center" prop="province" />-->
<!--      <el-table-column label="市" align="center" prop="city" />-->
<!--      <el-table-column label="区县" align="center" prop="county" />-->
<!--      <el-table-column label="拼音" align="center" prop="pinYin" />-->
<!--      <el-table-column label="分管采购员" align="center" prop="purchaserName" />-->
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createtime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['scm:supplier:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['scm:supplier:remove']"
          >删除</el-button>
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

    <!-- 添加或修改供应商管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="88px">
        <el-form-item label="供应商名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入供应商名称" />
        </el-form-item>
        <el-form-item label="供应商编码" prop="number">
          <el-input v-model="form.number" placeholder="请输入供应商编码" />
        </el-form-item>
<!--        <el-form-item label="税率" prop="taxRate">-->
<!--          <el-input v-model="form.taxRate" placeholder="请输入税率" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="期初应付款" prop="amount">-->
<!--          <el-input v-model="form.amount" placeholder="请输入期初应付款" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="期初预付款" prop="periodMoney">-->
<!--          <el-input v-model="form.periodMoney" placeholder="请输入期初预付款" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="初期往来余额" prop="difMoney">-->
<!--          <el-input v-model="form.difMoney" placeholder="请输入初期往来余额" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="余额日期" prop="beginDate">-->
<!--          <el-date-picker clearable-->
<!--            v-model="form.beginDate"-->
<!--            type="date"-->
<!--            value-format="yyyy-MM-dd"-->
<!--            placeholder="请选择余额日期">-->
<!--          </el-date-picker>-->
<!--        </el-form-item>-->


        <el-form-item label="联系人" prop="linkMan">
          <el-input v-model="form.linkman" placeholder="请输入联系人" />
        </el-form-item>
        <el-form-item label="联系方式" prop="contact">
          <el-input v-model="form.contact" placeholder="请输入联系方式" />
        </el-form-item>
        <el-form-item label="职位" prop="place">
          <el-input v-model="form.place" placeholder="请输入职位" />
        </el-form-item>
<!--        <el-form-item label="省" prop="province">-->
<!--          <el-input v-model="form.province" placeholder="请输入省" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="市" prop="city">-->
<!--          <el-input v-model="form.city" placeholder="请输入市" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="区县" prop="county">-->
<!--          <el-input v-model="form.county" placeholder="请输入区县" />-->
<!--        </el-form-item>-->
        <el-form-item label="详细地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入详细地址" />
        </el-form-item>
        <el-form-item label="拼音" prop="pinYin">
          <el-input v-model="form.pinYin" placeholder="请输入拼音" />
        </el-form-item>
        <el-form-item label="分管采购员" prop="purchaserName">
          <el-input v-model="form.purchaserName" placeholder="请输入分管采购员" />
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
import { listSupplier, getSupplier, delSupplier, addSupplier, updateSupplier } from "@/api/goods/supplier";

export default {
  name: "Supplier",
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
      // 供应商管理表格数据
      supplierList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        number: null,
        taxRate: null,
        amount: null,
        periodMoney: null,
        difMoney: null,
        beginDate: null,
        place: null,
        linkMan: null,
        contact: null,
        province: null,
        city: null,
        county: null,
        address: null,
        pinYin: null,
        disable: null,
        isDelete: null,
        purchaserName: null,
        createTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询供应商管理列表 */
    getList() {
      this.loading = true;
      listSupplier(this.queryParams).then(response => {
        this.supplierList = response.rows;
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
        name: null,
        number: null,
        taxRate: null,
        amount: null,
        periodMoney: null,
        difMoney: null,
        beginDate: null,
        remark: null,
        place: null,
        linkMan: null,
        contact: null,
        province: null,
        city: null,
        county: null,
        address: null,
        pinYin: null,
        disable: null,
        isDelete: null,
        purchaserName: null,
        createTime: null
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
      this.title = "添加供应商管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSupplier(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改供应商管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSupplier(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSupplier(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除供应商管理编号为"' + ids + '"的数据项？').then(function() {
        return delSupplier(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('scm/supplier/export', {
        ...this.queryParams
      }, `supplier_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
