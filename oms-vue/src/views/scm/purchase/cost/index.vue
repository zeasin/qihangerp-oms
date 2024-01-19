<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">
      
      <el-form-item label="采购订单编号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入采购订单编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      
      <el-form-item label="确认时间" prop="confirmTime">
        <el-date-picker clearable
          v-model="queryParams.confirmTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择确认时间">
        </el-date-picker>
      </el-form-item>
      
      <el-form-item label="支付时间" prop="payTime">
        <el-date-picker clearable
          v-model="queryParams.payTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择支付时间">
        </el-date-picker>
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
          v-hasPermi="['purchase:PurchaseOrderCost:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="PurchaseOrderCostList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="采购单ID" align="center" prop="id" />
      <el-table-column label="采购单金额" align="center" prop="orderAmount" />
      <el-table-column label="采购订单日期" align="center" prop="orderDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="采购订单编号" align="center" prop="orderNo" />
      <el-table-column label="采购订单商品规格数" align="center" prop="orderSpecUnit" />
      <el-table-column label="采购订单商品数" align="center" prop="orderGoodsUnit" />
      <el-table-column label="采购订单总件数" align="center" prop="orderSpecUnitTotal" />
      <el-table-column label="实际金额" align="center" prop="actualAmount" />
      <el-table-column label="运费" align="center" prop="freight" />
      <el-table-column label="确认人" align="center" prop="confirmUser" />
      <el-table-column label="确认时间" align="center" prop="confirmTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.confirmTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="已支付金额" align="center" prop="payAmount" />
      <el-table-column label="支付时间" align="center" prop="payTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="支付次数" align="center" prop="payCount" />
      <el-table-column label="说明" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['purchase:PurchaseOrderCost:edit']"
          >付款</el-button>

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

    <!-- 添加或修改采购订单费用对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="采购单金额" prop="orderAmount">
          <el-input v-model="form.orderAmount" placeholder="请输入采购单金额" />
        </el-form-item>
        <el-form-item label="采购订单日期" prop="orderDate">
          <el-date-picker clearable
            v-model="form.orderDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择采购订单日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="采购订单编号" prop="orderNo">
          <el-input v-model="form.orderNo" placeholder="请输入采购订单编号" />
        </el-form-item>
        <el-form-item label="采购订单商品规格数" prop="orderSpecUnit">
          <el-input v-model="form.orderSpecUnit" placeholder="请输入采购订单商品规格数" />
        </el-form-item>
        <el-form-item label="采购订单商品数" prop="orderGoodsUnit">
          <el-input v-model="form.orderGoodsUnit" placeholder="请输入采购订单商品数" />
        </el-form-item>
        <el-form-item label="采购订单总件数" prop="orderSpecUnitTotal">
          <el-input v-model="form.orderSpecUnitTotal" placeholder="请输入采购订单总件数" />
        </el-form-item>
        <el-form-item label="实际金额" prop="actualAmount">
          <el-input v-model="form.actualAmount" placeholder="请输入实际金额" />
        </el-form-item>
        <el-form-item label="运费" prop="freight">
          <el-input v-model="form.freight" placeholder="请输入运费" />
        </el-form-item>
        <el-form-item label="确认人" prop="confirmUser">
          <el-input v-model="form.confirmUser" placeholder="请输入确认人" />
        </el-form-item>
        <el-form-item label="确认时间" prop="confirmTime">
          <el-date-picker clearable
            v-model="form.confirmTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择确认时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="已支付金额" prop="payAmount">
          <el-input v-model="form.payAmount" placeholder="请输入已支付金额" />
        </el-form-item>
        <el-form-item label="支付时间" prop="payTime">
          <el-date-picker clearable
            v-model="form.payTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择支付时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="支付次数" prop="payCount">
          <el-input v-model="form.payCount" placeholder="请输入支付次数" />
        </el-form-item>
        <el-form-item label="说明" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入说明" />
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
import { listPurchaseOrderCost, getPurchaseOrderCost, delPurchaseOrderCost, addPurchaseOrderCost, updatePurchaseOrderCost } from "@/api/scm/purchaseOrderCost";

export default {
  name: "PurchaseOrderCost",
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
      // 采购订单费用表格数据
      PurchaseOrderCostList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderAmount: null,
        orderDate: null,
        orderNo: null,
        orderSpecUnit: null,
        orderGoodsUnit: null,
        orderSpecUnitTotal: null,
        actualAmount: null,
        freight: null,
        confirmUser: null,
        confirmTime: null,
        payAmount: null,
        payTime: null,
        payCount: null,
        status: null,
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
    /** 查询采购订单费用列表 */
    getList() {
      this.loading = true;
      listPurchaseOrderCost(this.queryParams).then(response => {
        this.PurchaseOrderCostList = response.rows;
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
        orderAmount: null,
        orderDate: null,
        orderNo: null,
        orderSpecUnit: null,
        orderGoodsUnit: null,
        orderSpecUnitTotal: null,
        actualAmount: null,
        freight: null,
        confirmUser: null,
        confirmTime: null,
        createBy: null,
        payAmount: null,
        payTime: null,
        payCount: null,
        remark: null,
        status: null,
        updateBy: null,
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
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPurchaseOrderCost(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改采购订单费用";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePurchaseOrderCost(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPurchaseOrderCost(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('purchase/PurchaseOrderCost/export', {
        ...this.queryParams
      }, `PurchaseOrderCost_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
