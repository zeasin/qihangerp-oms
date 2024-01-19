<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="供应商" prop="contactId">
        <el-select
          v-model="queryParams.contactId"
          filterable
          placeholder="请选择供应商">
          <el-option
            v-for="item in supplierList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
        <!-- <el-input
          v-model="queryParams.contactId"
          placeholder="请输入供应商id"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
      </el-form-item>
      <el-form-item label="订单编号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入订单编号"
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
          v-hasPermi="['purchase:purchaseOrder:add']"
        >创建采购订单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['purchase:purchaseOrder:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="purchaseOrderList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="供应商" align="center" prop="contactId" >
        <template slot-scope="scope">
          <span>{{ supplierList.find(x=>x.id === scope.row.contactId)?supplierList.find(x=>x.id === scope.row.contactId).name :'' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="单号" align="center" prop="orderNo" />
      <el-table-column label="下单日期" align="center" prop="orderDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="总金额" align="center" prop="orderAmount" />
      <el-table-column label="审核人" align="center" prop="auditUser" />
      <el-table-column label="审核时间" align="center" prop="auditTime" >
        <template slot-scope="scope">
          {{ dateToString(scope.row.auditTime) }}
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag type="info" v-if="scope.row.status === 0">待审核</el-tag>
          <el-tag type="success" v-if="scope.row.status === 1">已审核</el-tag>
          <el-tag type="warning" v-if="scope.row.status === 101">已确认待供应商发货</el-tag>
          <el-tag v-if="scope.row.status === 102">供应商已发货</el-tag>
          <el-tag type="primary" v-if="scope.row.status === 2">已收货</el-tag>
          <el-tag type="primary" v-if="scope.row.status === 3">已入库</el-tag>
        </template>
      </el-table-column>


      <el-table-column label="供应商发货时间" align="center" prop="supplierDeliveryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.supplierDeliveryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收货时间" align="center" prop="receivedTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.receivedTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="入库时间" align="center" prop="stockInTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.stockInTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-col :span="24">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-view"
              @click="handleDetail(scope.row)"
            >详情</el-button>
          </el-col>
          <el-col :span="24">
            <el-button
              v-if="scope.row.status === 0"
              size="mini"
              type="text"
              icon="el-icon-circle-check"
              @click="handleUpdateStatus(scope.row,'audit')"
              v-hasPermi="['purchase:purchaseOrder:edit']"
            >审核</el-button>
          </el-col>
            <el-col :span="24">
            <el-button
            v-if="scope.row.status === 1"
              size="mini"
              type="text"
              icon="el-icon-finished"
              @click="handleUpdateStatus(scope.row,'confirm')"
              v-hasPermi="['purchase:purchaseOrder:edit']"
            >采购确认</el-button>
          </el-col>
        <el-col :span="24">
          <el-button
          v-if="scope.row.status === 101"
            size="mini"
            type="text"
            icon="el-icon-finished"
            @click="handleUpdateStatus(scope.row,'SupplierShip')"
            v-hasPermi="['purchase:purchaseOrder:edit']"
          >供应商发货</el-button>
        </el-col>
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

    <!-- 添加或修改采购订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="138px">

        <el-form-item label="订单编号" prop="orderNo">
          <el-input v-model="form.orderNo" disabled placeholder="请输入订单编号" />
        </el-form-item>
        <el-form-item label="订单日期" prop="orderDate">
          <el-date-picker clearable
            v-model="form.orderDate"
            type="date"
            disabled
            value-format="yyyy-MM-dd"
            placeholder="请选择订单日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="订单创建时间" prop="orderTime">
          <el-input v-model="form.orderTime" disabled placeholder="请输入订单创建时间" />
        </el-form-item>
        <el-form-item label="订单总金额" prop="orderAmount">
          <el-input v-model="form.orderAmount" disabled placeholder="请输入订单总金额" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" :disabled=" form.optionType !== 'audit' " />
        </el-form-item>
        <el-form-item label="采购单审核人" prop="auditUser">
          <el-input v-model="form.auditUser" placeholder="请输入采购单审核人" :disabled=" form.optionType !== 'audit' " />
        </el-form-item>
        <el-form-item label="审核时间" prop="auditTime" v-if="form.optionType !== 'audit'">
          <el-input v-model="form.auditTime" placeholder="请输入审核时间" :disabled=" form.optionType !== 'audit' " />
        </el-form-item>

        <el-form-item label="供应商发货时间" prop="supplierDeliveryTime" v-if="form.optionType === 'SupplierShip'">
          <el-date-picker clearable
            v-model="form.supplierDeliveryTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择供应商发货时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="物流公司"  v-if="form.optionType === 'SupplierShip'">
<!--          <el-input v-model="form.shipCompany" placeholder="请输入物流公司" />-->
          <el-select v-model="form.shipCompany" filterable r placeholder="选择快递公司" >
            <el-option v-for="item in logisticsList" :key="item.id" :label="item.name" :value="item.name">
              <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px" >{{item.number}}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="物流单号" v-if="form.optionType === 'SupplierShip'">
          <el-input v-model="form.shipNo" placeholder="请输入物流公司" />
        </el-form-item>
        <el-form-item label="物流费用" v-if="form.optionType === 'SupplierShip'">
          <el-input type="number" v-model.number="form.shipCost" placeholder="请输入物流费用" />
        </el-form-item>
        <el-form-item label="采购金额(不含运费)" v-if="form.optionType === 'confirm'">
          <el-input type="number" v-model.number="form.totalAmount" placeholder="请输入采购金额(不含运费)" />
        </el-form-item>
        <el-form-item label="采购单确认人" v-if="form.optionType === 'confirm'">
          <el-input v-model="form.confirmUser" placeholder="请输入采购单确认人" />
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
import { listPurchaseOrder, getPurchaseOrder, delPurchaseOrder, addPurchaseOrder, updatePurchaseOrder } from "@/api/purchase/purchaseOrder";
import { listSupplier} from "@/api/scm/supplier";
import { listLogistics } from "@/api/api/logistics";
export default {
  name: "PurchaseOrder",
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
      // 采购订单表格数据
      purchaseOrderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        contactId: null,
        orderNo: null,
        orderDate: null,
        orderTime: null,
        orderAmount: null,
        status: null,
        auditUser: null,
        auditTime: null
      },
      // 表单参数
      form: {
        id:null,
        orderNo:null,
        optionType:null,
        auditUser:null,
        remark:null,
        orderAmount:null,
        shipCost:null,
        totalAmount:null
      },

      // 表单校验
      rules: {
      },
      supplierLoading:false,
      supplierList:[],
      logisticsList:[],
    };
  },
  created() {
    listSupplier({}).then(response => {
      this.supplierList = response.rows;
      // this.supplierLoading = false;
    });
    listLogistics({}).then(resp=>{
      this.logisticsList = resp.rows
    })
    this.getList();
  },
  methods: {
    amountChange(nv){
      this.form.totalAmount = parseFloat(this.form.orderAmount)+parseFloat(this.form.shipCost)
    },
    dateToString(timespan){
      var date = new Date(timespan * 1000);
      return date.toLocaleString();
    },
    // searchSupplier(query){
    //   this.supplierLoading = true;
    //   const qw = {
    //     name:query
    //   }
    //   listSupplier(qw).then(response => {
    //     this.supplierList = response.rows;
    //     this.supplierLoading = false;
    //   });
    // },
    /** 查询采购订单列表 */
    getList() {
      this.loading = true;
      listPurchaseOrder(this.queryParams).then(response => {
        this.purchaseOrderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 详情
    handleDetail(row){
      // this.$router.push('/scm/purchase/order/detail',{id:row.id});
      this.$router.push({path :"/scm/purchase/order/detail", query: { id: row.id }});
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
        contactId: null,
        orderNo: null,
        orderDate: null,
        orderTime: null,
        orderAmount: null,
        remark: null,
        status: null,
        auditUser: null,
        auditTime: null,
        supplierConfirmTime: null,
        supplierDeliveryTime: null,
        receivedTime: null,
        stockInTime: null,
        createBy: null,
        createTime: null,
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
    /** 新增按钮操作 */
    handleAdd() {
      this.$router.push('/scm/purchase/order/create');
    },
    handleUpdateStatus(row,optionType){
      this.form.id = row.id
      this.form.orderNo = row.orderNo
      this.form.orderDate = row.orderDate
      var date = new Date(row.orderTime * 1000);
      this.form.orderTime = date.toLocaleString();
      this.form.orderAmount = row.orderAmount
      this.form.remark = row.remark

      this.form.auditUser = row.auditUser
      this.form.auditTime = this.dateToString(row.auditTime)

      this.open = true;

      if ('audit' === optionType){
        this.form.optionType = 'audit'


        this.title = "审核采购订单";
      }else if (optionType === 'SupplierShip'){
        this.form.optionType = 'SupplierShip'

        this.title = "供应商发货";
      }
      else if (optionType === 'confirm'){
        this.form.optionType = 'confirm'
        this.form.totalAmount = row.orderAmount
        this.title = "采购确认";
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if(this.form.optionType === 'audit'){
            if(!this.form.auditUser){
              this.$message.error("请填写审核人")
              return
            }
          }else if(this.form.optionType === 'SupplierShip'){
            if(!this.form.supplierDeliveryTime){
              this.$message.error("请填写供应商发货日期")
              return
            }
            if(!this.form.shipCompany){
              this.$message.error("请填写供应商发货物流公司")
              return
            }
            if(!this.form.shipNo){
              this.$message.error("请填写供应商发货物流单号")
              return
            }
            if(this.form.shipCost === null || this.form.shipCost === undefined){
              this.$message.error("请填写供应商发货物流费用")
              return
            }

          }else if(this.form.optionType === 'confirm'){
            if(!this.form.totalAmount){
              this.$message.error("请填写采购实际金额")
              return
            }
            if(!this.form.confirmUser){
              this.$message.error("请填写采购单确认人")
              return
            }

          }

          updatePurchaseOrder(this.form).then(response => {
            if(this.form.optionType === 'audit'){
              if(response.code===0){
                this.$message.error("审核失败！"+ response.msg)
              }
              else if(response.code === 200) {
                this.$modal.msgSuccess("审核成功");
                this.open = false;
                this.getList();
              }else{
                this.$message.error("失败！"+ response.msg)
              }
            }else if(this.form.optionType === 'SupplierShip'){
              console.log('=====发货结果======',response)
              if(response.code === 200) {
                this.$modal.msgSuccess("发货成功");
                this.open = false;
                this.getList();
              }else{
                this.$message.error("发货失败！"+ response.msg)
              }
            }
            else if(this.form.optionType === 'confirm'){
              console.log('=====确认结果======',response)
              if(response.code === 200) {
                this.$modal.msgSuccess("确认成功");
                this.open = false;
                this.getList();
              }else{
                this.$message.error("确认失败！"+ response.msg)
              }
            }

          });
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('purchase/purchaseOrder/export', {
        ...this.queryParams
      }, `purchaseOrder_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
