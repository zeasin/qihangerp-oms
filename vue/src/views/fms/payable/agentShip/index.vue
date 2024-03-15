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
      <el-form-item label="店铺id" prop="shopId">
        <el-input
          v-model="queryParams.shopId"
          placeholder="请输入店铺id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商id" prop="supplierId">
        <el-input
          v-model="queryParams.supplierId"
          placeholder="请输入供应商id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商名称" prop="supplierName">
        <el-input
          v-model="queryParams.supplierName"
          placeholder="请输入供应商名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="日期" prop="date">
        <el-date-picker clearable
          v-model="queryParams.date"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="物流公司" prop="shipCompany">
        <el-input
          v-model="queryParams.shipCompany"
          placeholder="请输入物流公司"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物流单号" prop="shipNo">
        <el-input
          v-model="queryParams.shipNo"
          placeholder="请输入物流单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="应付总金额" prop="amount">
        <el-input
          v-model="queryParams.amount"
          placeholder="请输入应付总金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物流费用" prop="shipAmount">
        <el-input
          v-model="queryParams.shipAmount"
          placeholder="请输入物流费用"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品金额" prop="goodsAmount">
        <el-input
          v-model="queryParams.goodsAmount"
          placeholder="请输入商品金额"
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
          v-hasPermi="['fms:agentShip:add']"
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
          v-hasPermi="['fms:agentShip:edit']"
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
          v-hasPermi="['fms:agentShip:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['fms:agentShip:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="agentShipList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="${comment}" align="center" prop="id" />
      <el-table-column label="订单号" align="center" prop="orderNum" />
      <el-table-column label="店铺id" align="center" prop="shopId" />
      <el-table-column label="供应商id" align="center" prop="supplierId" />
      <el-table-column label="供应商名称" align="center" prop="supplierName" />
      <el-table-column label="日期" align="center" prop="date" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="物流公司" align="center" prop="shipCompany" />
      <el-table-column label="物流单号" align="center" prop="shipNo" />
      <el-table-column label="应付总金额" align="center" prop="amount" />
      <el-table-column label="物流费用" align="center" prop="shipAmount" />
      <el-table-column label="商品金额" align="center" prop="goodsAmount" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['fms:agentShip:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['fms:agentShip:remove']"
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

    <!-- 添加或修改财务管理-应付款-代发账单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单号" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="店铺id" prop="shopId">
          <el-input v-model="form.shopId" placeholder="请输入店铺id" />
        </el-form-item>
        <el-form-item label="供应商id" prop="supplierId">
          <el-input v-model="form.supplierId" placeholder="请输入供应商id" />
        </el-form-item>
        <el-form-item label="供应商名称" prop="supplierName">
          <el-input v-model="form.supplierName" placeholder="请输入供应商名称" />
        </el-form-item>
        <el-form-item label="日期" prop="date">
          <el-date-picker clearable
            v-model="form.date"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="物流公司" prop="shipCompany">
          <el-input v-model="form.shipCompany" placeholder="请输入物流公司" />
        </el-form-item>
        <el-form-item label="物流单号" prop="shipNo">
          <el-input v-model="form.shipNo" placeholder="请输入物流单号" />
        </el-form-item>
        <el-form-item label="应付总金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入应付总金额" />
        </el-form-item>
        <el-form-item label="物流费用" prop="shipAmount">
          <el-input v-model="form.shipAmount" placeholder="请输入物流费用" />
        </el-form-item>
        <el-form-item label="商品金额" prop="goodsAmount">
          <el-input v-model="form.goodsAmount" placeholder="请输入商品金额" />
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
import { listAgentShip, getAgentShip, delAgentShip, addAgentShip, updateAgentShip } from "@/api/fms/agentShip";

export default {
  name: "AgentShip",
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
      // 财务管理-应付款-代发账单表格数据
      agentShipList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum: null,
        shopId: null,
        supplierId: null,
        supplierName: null,
        date: null,
        shipCompany: null,
        shipNo: null,
        amount: null,
        shipAmount: null,
        goodsAmount: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        orderNum: [
          { required: true, message: "订单号不能为空", trigger: "blur" }
        ],
        shopId: [
          { required: true, message: "店铺id不能为空", trigger: "blur" }
        ],
        supplierId: [
          { required: true, message: "供应商id不能为空", trigger: "blur" }
        ],
        date: [
          { required: true, message: "日期不能为空", trigger: "blur" }
        ],
        shipCompany: [
          { required: true, message: "物流公司不能为空", trigger: "blur" }
        ],
        shipNo: [
          { required: true, message: "物流单号不能为空", trigger: "blur" }
        ],
        amount: [
          { required: true, message: "应付总金额不能为空", trigger: "blur" }
        ],
        shipAmount: [
          { required: true, message: "物流费用不能为空", trigger: "blur" }
        ],
        goodsAmount: [
          { required: true, message: "商品金额不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "状态不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询财务管理-应付款-代发账单列表 */
    getList() {
      this.loading = true;
      listAgentShip(this.queryParams).then(response => {
        this.agentShipList = response.rows;
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
        orderNum: null,
        shopId: null,
        supplierId: null,
        supplierName: null,
        date: null,
        shipCompany: null,
        shipNo: null,
        amount: null,
        shipAmount: null,
        goodsAmount: null,
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
      this.title = "添加财务管理-应付款-代发账单";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAgentShip(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改财务管理-应付款-代发账单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAgentShip(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAgentShip(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除财务管理-应付款-代发账单编号为"' + ids + '"的数据项？').then(function() {
        return delAgentShip(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('fms/agentShip/export', {
        ...this.queryParams
      }, `agentShip_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
