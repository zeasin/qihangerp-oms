<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="128px"
    >
      <el-form-item label="采购订单编号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入采购订单编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="供应商发货时间" prop="shipTime">
        <el-date-picker
          clearable
          v-model="queryParams.shipTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择运送时间"
        >
        </el-date-picker>
      </el-form-item>

      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleConfirmReceipt"
          v-hasPermi="['purchase:PurchaseOrderShip:edit']"
          >确认收货</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['purchase:PurchaseOrderShip:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="PurchaseOrderShipList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="采购单ID" align="center" prop="id" />
      <el-table-column label="采购订单编号" align="center" prop="orderNo" />
      <el-table-column
        label="采购订单商品规格数"
        align="center"
        prop="orderSpecUnit"
      />
      <el-table-column
        label="采购订单商品数"
        align="center"
        prop="orderGoodsUnit"
      />
      <el-table-column
        label="采购订单总件数"
        align="center"
        prop="orderSpecUnitTotal"
      />
      <el-table-column label="物流公司" align="center" prop="shipCompany" />
      <el-table-column label="物流单号" align="center" prop="shipNo" />
      <el-table-column label="运费" align="center" prop="freight" />
      <el-table-column
        label="发货时间"
        align="center"
        prop="shipTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.shipTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <el-tag type="info" v-if="scope.row.status === 0">待收货</el-tag>
          <el-tag type="success" v-if="scope.row.status === 1">已收货</el-tag>
          <el-tag type="warning" v-if="scope.row.status === 2">已入库</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="说明" align="center" prop="remark" />
      <el-table-column label="退回数量" align="center" prop="backCount" />
      <el-table-column label="入库数量" align="center" prop="stockInCount" />
      <el-table-column
        label="采购订单日期"
        align="center"
        prop="orderDate"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderDate, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>

      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['purchase:PurchaseOrderShip:edit']"
            >采购单详情</el-button
          >
          <el-button
            v-if="scope.row.status === 0"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleConfirmReceipt(scope.row)"
            v-hasPermi="['purchase:PurchaseOrderShip:edit']"
            >确认收货</el-button
          >
          <el-button
            v-if="scope.row.status === 1"
            size="mini"
            type="text"
            icon="el-icon-document-add"
            @click="handleCreateEntry(scope.row)"
            v-hasPermi="['purchase:PurchaseOrderShip:remove']"
            >生成入库单</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改采购订单物流对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="150px">
        <el-form-item label="采购订单编号" prop="orderNo">
          <el-input
            v-model="form.orderNo"
            disabled
            placeholder="请输入采购订单编号"
          />
        </el-form-item>
        <el-form-item label="采购订单日期" prop="orderDate">
          <el-date-picker
            clearable
            disabled
            v-model="form.orderDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择采购订单日期"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="采购订单商品规格数" prop="orderSpecUnit">
          <el-input
            v-model="form.orderSpecUnit"
            disabled
            placeholder="请输入采购订单商品规格数"
          />
        </el-form-item>
        <el-form-item label="采购订单商品数" prop="orderGoodsUnit">
          <el-input
            v-model="form.orderGoodsUnit"
            disabled
            placeholder="请输入采购订单商品数"
          />
        </el-form-item>
        <el-form-item label="采购订单总件数" prop="orderSpecUnitTotal">
          <el-input
            v-model="form.orderSpecUnitTotal"
            disabled
            placeholder="请输入采购订单总件数"
          />
        </el-form-item>
        <el-form-item label="物流公司" prop="shipCompany">
          <el-input
            v-model="form.shipCompany"
            disabled
            placeholder="请输入物流公司"
          />
        </el-form-item>
        <el-form-item label="物流单号" prop="shipNo">
          <el-input
            v-model="form.shipNo"
            disabled
            placeholder="请输入物流单号"
          />
        </el-form-item>
        <el-form-item label="运费" prop="freight">
          <el-input v-model="form.freight" disabled placeholder="请输入运费" />
        </el-form-item>
        <el-form-item label="发货时间" prop="shipTime">
          <el-date-picker
            clearable
            disabled
            v-model="form.shipTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择发货时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="收货日期" prop="receiptTime">
          <el-date-picker
            clearable
            v-model="form.receiptTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择收货日期"
          >
          </el-date-picker>
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
import {
  listPurchaseOrderShip,
  getPurchaseOrderShip,
  delPurchaseOrderShip,
  addPurchaseOrderShip,
  updatePurchaseOrderShip,
} from "@/api/scm/PurchaseOrderShip";

export default {
  name: "PurchaseOrderShip",
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
      // 采购订单物流表格数据
      PurchaseOrderShipList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shipCompany: null,
        shipNo: null,
        freight: null,
        shipTime: null,
        status: null,
        backCount: null,
        stockInCount: null,
        orderDate: null,
        orderNo: null,
        orderSpecUnit: null,
        orderGoodsUnit: null,
        orderSpecUnitTotal: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        receiptTime: [{ required: true, message: "请选择收货日期" }],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询采购订单物流列表 */
    getList() {
      this.loading = true;
      listPurchaseOrderShip(this.queryParams).then((response) => {
        this.PurchaseOrderShipList = response.rows;
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
        shipCompany: null,
        shipNo: null,
        freight: null,
        shipTime: null,
        createBy: null,
        createTime: null,
        status: null,
        remark: null,
        backCount: null,
        stockInCount: null,
        updateBy: null,
        updateTime: null,
        orderDate: null,
        orderNo: null,
        orderSpecUnit: null,
        orderGoodsUnit: null,
        orderSpecUnitTotal: null,
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
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 详情按钮操作 */
    handleDetail(row) {
      this.$router.push({path :"/scm/purchase/order/detail", query: { id: row.id }});
    },
    handleCreateEntry(row){
      // this.$router.push("/scm/purchase/ship/create_stock_in_entry", { id: row.id });
      this.$router.push({path : "/scm/purchase/ship/create_stock_in_entry", query: { id: row.id }})
    },
    /** 修改按钮操作 */
    handleConfirmReceipt(row) {
      this.reset();
      const id = row.id || this.ids;
      getPurchaseOrderShip(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "确认收货";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updatePurchaseOrderShip(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPurchaseOrderShip(this.form).then((response) => {
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
      this.download(
        "purchase/PurchaseOrderShip/export",
        {
          ...this.queryParams,
        },
        `PurchaseOrderShip_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
