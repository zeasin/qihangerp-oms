<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单id" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单编号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入订单编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="购货金额" prop="amount">
        <el-input
          v-model="queryParams.amount"
          placeholder="请输入购货金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单日期" prop="orderDate">
        <el-date-picker clearable
          v-model="queryParams.orderDate"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="商品ID" prop="goodsId">
        <el-input
          v-model="queryParams.goodsId"
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
      <el-form-item label="商品规格id" prop="specId">
        <el-input
          v-model="queryParams.specId"
          placeholder="请输入商品规格id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品规格编码" prop="specNum">
        <el-input
          v-model="queryParams.specNum"
          placeholder="请输入商品规格编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="单价" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入单价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="折扣额" prop="disAmount">
        <el-input
          v-model="queryParams.disAmount"
          placeholder="请输入折扣额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="折扣率" prop="disRate">
        <el-input
          v-model="queryParams.disRate"
          placeholder="请输入折扣率"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="数量(采购单据)" prop="quantity">
        <el-input
          v-model="queryParams.quantity"
          placeholder="请输入数量(采购单据)"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="已入库数量" prop="inQty">
        <el-input
          v-model="queryParams.inQty"
          placeholder="请输入已入库数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库的仓库id" prop="locationId">
        <el-input
          v-model="queryParams.locationId"
          placeholder="请输入入库的仓库id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="1删除 0正常" prop="isDelete">
        <el-input
          v-model="queryParams.isDelete"
          placeholder="请输入1删除 0正常"
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
          v-hasPermi="['purchase:purchaseOrderItem:add']"
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
          v-hasPermi="['purchase:purchaseOrderItem:edit']"
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
          v-hasPermi="['purchase:purchaseOrderItem:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['purchase:purchaseOrderItem:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="purchaseOrderItemList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="${comment}" align="center" prop="id" />
      <el-table-column label="订单id" align="center" prop="orderId" />
      <el-table-column label="订单编号" align="center" prop="orderNo" />
      <el-table-column label="150501采购 150502退货" align="center" prop="transType" />
      <el-table-column label="购货金额" align="center" prop="amount" />
      <el-table-column label="订单日期" align="center" prop="orderDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="商品ID" align="center" prop="goodsId" />
      <el-table-column label="商品编码" align="center" prop="goodsNum" />
      <el-table-column label="商品规格id" align="center" prop="specId" />
      <el-table-column label="商品规格编码" align="center" prop="specNum" />
      <el-table-column label="单价" align="center" prop="price" />
      <el-table-column label="折扣额" align="center" prop="disAmount" />
      <el-table-column label="折扣率" align="center" prop="disRate" />
      <el-table-column label="数量(采购单据)" align="center" prop="quantity" />
      <el-table-column label="已入库数量" align="center" prop="inQty" />
      <el-table-column label="入库的仓库id" align="center" prop="locationId" />
      <el-table-column label="1删除 0正常" align="center" prop="isDelete" />
      <el-table-column label="状态" align="center" prop="status" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['purchase:purchaseOrderItem:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['purchase:purchaseOrderItem:remove']"
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

    <!-- 添加或修改采购订单明细对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单id" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入订单id" />
        </el-form-item>
        <el-form-item label="订单编号" prop="orderNo">
          <el-input v-model="form.orderNo" placeholder="请输入订单编号" />
        </el-form-item>
        <el-form-item label="购货金额" prop="amount">
          <el-input v-model="form.amount" placeholder="请输入购货金额" />
        </el-form-item>
        <el-form-item label="订单日期" prop="orderDate">
          <el-date-picker clearable
            v-model="form.orderDate"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择订单日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
        <el-form-item label="商品ID" prop="goodsId">
          <el-input v-model="form.goodsId" placeholder="请输入商品ID" />
        </el-form-item>
        <el-form-item label="商品编码" prop="goodsNum">
          <el-input v-model="form.goodsNum" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="商品规格id" prop="specId">
          <el-input v-model="form.specId" placeholder="请输入商品规格id" />
        </el-form-item>
        <el-form-item label="商品规格编码" prop="specNum">
          <el-input v-model="form.specNum" placeholder="请输入商品规格编码" />
        </el-form-item>
        <el-form-item label="单价" prop="price">
          <el-input v-model="form.price" placeholder="请输入单价" />
        </el-form-item>
        <el-form-item label="折扣额" prop="disAmount">
          <el-input v-model="form.disAmount" placeholder="请输入折扣额" />
        </el-form-item>
        <el-form-item label="折扣率" prop="disRate">
          <el-input v-model="form.disRate" placeholder="请输入折扣率" />
        </el-form-item>
        <el-form-item label="数量(采购单据)" prop="quantity">
          <el-input v-model="form.quantity" placeholder="请输入数量(采购单据)" />
        </el-form-item>
        <el-form-item label="已入库数量" prop="inQty">
          <el-input v-model="form.inQty" placeholder="请输入已入库数量" />
        </el-form-item>
        <el-form-item label="入库的仓库id" prop="locationId">
          <el-input v-model="form.locationId" placeholder="请输入入库的仓库id" />
        </el-form-item>
        <el-form-item label="1删除 0正常" prop="isDelete">
          <el-input v-model="form.isDelete" placeholder="请输入1删除 0正常" />
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
import { listPurchaseOrderItem, getPurchaseOrderItem, delPurchaseOrderItem, addPurchaseOrderItem, updatePurchaseOrderItem } from "@/api/purchase/purchaseOrderItem";

export default {
  name: "PurchaseOrderItem",
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
      // 采购订单明细表格数据
      purchaseOrderItemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        orderNo: null,
        transType: null,
        amount: null,
        orderDate: null,
        goodsId: null,
        goodsNum: null,
        specId: null,
        specNum: null,
        price: null,
        disAmount: null,
        disRate: null,
        quantity: null,
        inQty: null,
        locationId: null,
        isDelete: null,
        status: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        quantity: [
          { required: true, message: "数量(采购单据)不能为空", trigger: "blur" }
        ],
        inQty: [
          { required: true, message: "已入库数量不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询采购订单明细列表 */
    getList() {
      this.loading = true;
      listPurchaseOrderItem(this.queryParams).then(response => {
        this.purchaseOrderItemList = response.rows;
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
        orderId: null,
        orderNo: null,
        transType: null,
        amount: null,
        orderDate: null,
        remark: null,
        goodsId: null,
        goodsNum: null,
        specId: null,
        specNum: null,
        price: null,
        disAmount: null,
        disRate: null,
        quantity: null,
        inQty: null,
        locationId: null,
        isDelete: null,
        status: null
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
      this.title = "添加采购订单明细";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPurchaseOrderItem(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改采购订单明细";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePurchaseOrderItem(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPurchaseOrderItem(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除采购订单明细编号为"' + ids + '"的数据项？').then(function() {
        return delPurchaseOrderItem(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('purchase/purchaseOrderItem/export', {
        ...this.queryParams
      }, `purchaseOrderItem_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
