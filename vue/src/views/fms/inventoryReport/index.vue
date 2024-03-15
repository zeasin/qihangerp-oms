<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="日期" prop="date">
        <el-date-picker clearable
          v-model="queryParams.date"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="库存总数量" prop="total">
        <el-input
          v-model="queryParams.total"
          placeholder="请输入库存总数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品总数" prop="goodsCount">
        <el-input
          v-model="queryParams.goodsCount"
          placeholder="请输入商品总数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="SKU总数" prop="skuCount">
        <el-input
          v-model="queryParams.skuCount"
          placeholder="请输入SKU总数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总货值" prop="amount">
        <el-input
          v-model="queryParams.amount"
          placeholder="请输入总货值"
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
          v-hasPermi="['fms:inventoryReport:add']"
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
          v-hasPermi="['fms:inventoryReport:edit']"
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
          v-hasPermi="['fms:inventoryReport:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['fms:inventoryReport:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="inventoryReportList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="${comment}" align="center" prop="id" />
      <el-table-column label="日期" align="center" prop="date" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="库存总数量" align="center" prop="total" />
      <el-table-column label="商品总数" align="center" prop="goodsCount" />
      <el-table-column label="SKU总数" align="center" prop="skuCount" />
      <el-table-column label="总货值" align="center" prop="amount" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['fms:inventoryReport:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['fms:inventoryReport:remove']"
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

    <!-- 添加或修改库存存货报对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="日期" prop="date">
          <el-date-picker clearable
            v-model="form.date"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="库存总数量" prop="total">
          <el-input v-model="form.total" placeholder="请输入库存总数量" />
        </el-form-item>
        <el-form-item label="商品总数" prop="goodsCount">
          <el-input v-model="form.goodsCount" placeholder="请输入商品总数" />
        </el-form-item>
        <el-form-item label="SKU总数" prop="skuCount">
          <el-input v-model="form.skuCount" placeholder="请输入SKU总数" />
        </el-form-item>
        <el-form-item label="总货值" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入总货值" />
        </el-form-item>
        <el-divider content-position="center">库存存货报明细信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddFmsInventoryReportDetail">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteFmsInventoryReportDetail">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="fmsInventoryReportDetailList" :row-class-name="rowFmsInventoryReportDetailIndex" @selection-change="handleFmsInventoryReportDetailSelectionChange" ref="fmsInventoryReportDetail">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="日期" prop="date" width="240">
            <template slot-scope="scope">
              <el-date-picker clearable v-model="scope.row.date" type="date" value-format="yyyy-MM-dd" placeholder="请选择日期" />
            </template>
          </el-table-column>
          <el-table-column label="商品id" prop="goodsId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsId" placeholder="请输入商品id" />
            </template>
          </el-table-column>
          <el-table-column label="商品规格ID" prop="specId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specId" placeholder="请输入商品规格ID" />
            </template>
          </el-table-column>
          <el-table-column label="总数量" prop="total" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.total" placeholder="请输入总数量" />
            </template>
          </el-table-column>
          <el-table-column label="总货值" prop="amount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.amount" placeholder="请输入总货值" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listInventoryReport, getInventoryReport, delInventoryReport, addInventoryReport, updateInventoryReport } from "@/api/fms/inventoryReport";

export default {
  name: "InventoryReport",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedFmsInventoryReportDetail: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 库存存货报表格数据
      inventoryReportList: [],
      // 库存存货报明细表格数据
      fmsInventoryReportDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        date: null,
        total: null,
        goodsCount: null,
        skuCount: null,
        amount: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        date: [
          { required: true, message: "日期不能为空", trigger: "blur" }
        ],
        total: [
          { required: true, message: "库存总数量不能为空", trigger: "blur" }
        ],
        goodsCount: [
          { required: true, message: "商品总数不能为空", trigger: "blur" }
        ],
        skuCount: [
          { required: true, message: "SKU总数不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "总货值不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询库存存货报列表 */
    getList() {
      this.loading = true;
      listInventoryReport(this.queryParams).then(response => {
        this.inventoryReportList = response.rows;
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
        date: null,
        total: null,
        goodsCount: null,
        skuCount: null,
        amount: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        updateBy: null
      };
      this.fmsInventoryReportDetailList = [];
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
      this.title = "添加库存存货报";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInventoryReport(id).then(response => {
        this.form = response.data;
        this.fmsInventoryReportDetailList = response.data.fmsInventoryReportDetailList;
        this.open = true;
        this.title = "修改库存存货报";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.fmsInventoryReportDetailList = this.fmsInventoryReportDetailList;
          if (this.form.id != null) {
            updateInventoryReport(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInventoryReport(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除库存存货报编号为"' + ids + '"的数据项？').then(function() {
        return delInventoryReport(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 库存存货报明细序号 */
    rowFmsInventoryReportDetailIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 库存存货报明细添加按钮操作 */
    handleAddFmsInventoryReportDetail() {
      let obj = {};
      obj.date = "";
      obj.goodsId = "";
      obj.specId = "";
      obj.total = "";
      obj.amount = "";
      obj.inventoryDist = "";
      this.fmsInventoryReportDetailList.push(obj);
    },
    /** 库存存货报明细删除按钮操作 */
    handleDeleteFmsInventoryReportDetail() {
      if (this.checkedFmsInventoryReportDetail.length == 0) {
        this.$modal.msgError("请先选择要删除的库存存货报明细数据");
      } else {
        const fmsInventoryReportDetailList = this.fmsInventoryReportDetailList;
        const checkedFmsInventoryReportDetail = this.checkedFmsInventoryReportDetail;
        this.fmsInventoryReportDetailList = fmsInventoryReportDetailList.filter(function(item) {
          return checkedFmsInventoryReportDetail.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleFmsInventoryReportDetailSelectionChange(selection) {
      this.checkedFmsInventoryReportDetail = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('fms/inventoryReport/export', {
        ...this.queryParams
      }, `inventoryReport_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
