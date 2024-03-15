<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺" prop="shopId">
        <!-- <el-input
          v-model="queryParams.shopId"
          placeholder="请输入店铺ID"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
        <el-select v-model="queryParams.shopId" filterable  placeholder="搜索店铺" >
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘宝天猫</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 13">快手小店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他</span>
          </el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="供应商" prop="supplierId">
        <el-select
          v-model="queryParams.supplierId"
          filterable
          placeholder="请输入供应商名称">
          <el-option
            v-for="item in supplierList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="订单编号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
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
      <el-form-item label="商品ID" prop="goodsId">
        <el-input
          v-model="queryParams.goodsId"
          placeholder="请输入erp系统商品id"
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

      <el-form-item label="物流单号" prop="shipNo">
        <el-input
          v-model="queryParams.shipNo"
          placeholder="请输入物流单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="发货时间" prop="shipTime">
        <el-date-picker clearable
          v-model="queryParams.shipTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择发货时间">
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
          type="danger"
          plain
          icon="el-icon-document-checked"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >批量付款确认</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['scm:agentShipping:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="agentShippingList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单编号" align="center" prop="orderNum" />
      <!-- <el-table-column label="主键ID" align="center" prop="id" /> -->
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId)?shopList.find(x=>x.id === scope.row.shopId).name:''  }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="店铺平台" align="center" prop="shopType" >
         <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.shopType === 4">淘宝</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 5">拼多多</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 6">抖店</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 7">小红书</el-tag>
         </template>
      </el-table-column> -->
      <el-table-column label="供应商" align="center" prop="supplierId" >
        <template slot-scope="scope">
        <span>{{ supplierList.find(x=>x.id === scope.row.supplierId)?supplierList.find(x=>x.id === scope.row.supplierId).name:''  }}</span>
      </template>
      </el-table-column>
      <!-- <el-table-column label="订单编号" align="center" prop="orderNum" /> -->
      <!-- <el-table-column label="子订单编号" align="center" prop="orderItemId" /> -->
      <el-table-column label="订单日期" align="center" prop="orderDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row :gutter="20">
            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="scope.row.goodsImg"></el-image>
              <div style="margin-left:10px">
              <p>{{scope.row.goodsTitle}}</p>
              <p>{{scope.row.goodsSpec}}&nbsp;
                <el-tag size="small">x {{scope.row.quantity}}</el-tag>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <!-- <el-table-column label="erp系统商品id" align="center" prop="goodsId" />
      <el-table-column label="erp系统商品规格id" align="center" prop="specId" />
      <el-table-column label="商品标题" align="center" prop="goodsTitle" />
      <el-table-column label="商品图片" align="center" prop="goodsImg" />
      <el-table-column label="商品编码" align="center" prop="goodsNum" />
      <el-table-column label="商品规格" align="center" prop="goodsSpec" />
      <el-table-column label="商品规格编码" align="center" prop="specNum" /> -->
      <el-table-column label="商品单价" align="center" prop="goodsPrice" />
      <el-table-column label="运费" align="center" prop="shipCost" />
      <!-- <el-table-column label="商品数量" align="center" prop="quantity" /> -->
      <el-table-column label="备注" align="center" prop="remark" />
      <!-- <el-table-column label="物流公司" align="center" prop="shipCompany" /> -->
      <el-table-column label="物流单号" align="center" prop="shipNo" />

      <el-table-column label="发货时间" align="center" prop="shipTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.shipTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 0">待发货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 1">已发货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已结算</el-tag>
         </template>
      </el-table-column>
      <!-- <el-table-column label="子订单金额" align="center" prop="itemAmount" /> -->
      <el-table-column label="操作" align="center" >
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.status === 0"
            size="mini"
            type="primary"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['scm:agentShipping:edit']"
          >供应商发货</el-button>
          <el-button
            v-if="scope.row.status === 1"
            size="mini"
            type="text"
            icon="el-icon-document-checked"
            @click="handleDelete(scope.row)"
            v-hasPermi="['scm:agentShipping:remove']"
          >付款确认</el-button>
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

    <!-- 添加或修改供应商代发货对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="店铺">
          <el-input placeholder="请输入店铺" :value=" shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:''  " disabled/>
        </el-form-item>
        <el-form-item label="供应商" prop="supplierName">
<!--          <el-input v-model="form.supplierId" placeholder="请输入供应商ID" />-->
          <el-input placeholder="请输入供应商" ref="supplierName" :value=" supplierList.find(x=>x.id === form.supplierId)?supplierList.find(x=>x.id === form.supplierId).name:''  " disabled/>
        </el-form-item>
        <el-form-item label="订单编号" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入订单编号" disabled/>
        </el-form-item>

        <el-form-item label="订单日期" prop="orderDate">
          <el-date-picker clearable
            v-model="form.orderDate"
                          disabled
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择订单日期">
          </el-date-picker>
        </el-form-item>
<!--        <el-form-item label="erp系统商品id" prop="goodsId">-->
<!--          <el-input v-model="form.goodsId" placeholder="请输入erp系统商品id" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="erp系统商品规格id" prop="specId">-->
<!--          <el-input v-model="form.specId" placeholder="请输入erp系统商品规格id" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="商品标题" prop="goodsTitle">-->
<!--          <el-input v-model="form.goodsTitle" placeholder="请输入商品标题" />-->
<!--        </el-form-item>-->
        <el-form-item label="商品图片" prop="goodsImg">
          <el-row :gutter="20">
            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="form.goodsImg"></el-image>
              <div style="margin-left:10px">
                <p>{{form.goodsTitle}}</p>
                <p>{{form.goodsSpec}}&nbsp;({{form.specNum}}) <el-tag size="small">x {{form.quantity}}</el-tag>
                </p>
              </div>
            </div>
          </el-row>
<!--          <el-image  style="width: 70px; height: 70px;" :src="form.goodsImg"></el-image>-->
        </el-form-item>
<!--        <el-form-item label="商品编码" prop="goodsNum">-->
<!--          <el-input v-model="form.goodsNum" placeholder="请输入商品编码" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="商品规格" prop="goodsSpec">-->
<!--          <el-input v-model="form.goodsSpec" placeholder="请输入商品规格" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="商品规格编码" prop="specNum">-->
<!--          <el-input v-model="form.specNum" placeholder="请输入商品规格编码" />-->
<!--        </el-form-item>-->
        <el-form-item label="商品单价" prop="goodsPrice">
          <el-input v-model.number="form.goodsPrice" type="number" placeholder="请输入商品单价" />
        </el-form-item>
<!--        <el-form-item label="商品数量" prop="quantity">-->
<!--          <el-input v-model="form.quantity" placeholder="请输入商品数量" />-->
<!--        </el-form-item>-->

        <el-form-item label="物流公司" prop="shipCompany">
<!--          <el-input v-model="form.shipCompany" placeholder="请输入物流公司" />-->
          <el-select v-model="form.shipCompany" filterable r placeholder="选择快递公司" >
            <el-option v-for="item in logisticsList" :key="item.id" :label="item.name" :value="item.name">
              <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px" >{{item.number}}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="物流单号" prop="shipNo">
          <el-input v-model="form.shipNo" placeholder="请输入物流单号" />
        </el-form-item>
        <el-form-item label="运费" prop="shipCost">
          <el-input v-model="form.shipCost" placeholder="请输入运费" />
        </el-form-item>
        <el-form-item label="发货时间" prop="shipTime">
          <el-date-picker clearable
            v-model="form.shipTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择发货时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入备注" />
        </el-form-item>
<!--        <el-form-item label="子订单金额" prop="itemAmount">-->
<!--          <el-input v-model="form.itemAmount" placeholder="请输入子订单金额" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listAgentShipping, getAgentShipping, delAgentShipping, addAgentShipping, updateAgentShipping } from "@/api/scm/agentShipping";
import { listSupplier} from "@/api/scm/supplier";
import { listShop } from "@/api/shop/shop";
import {listLogistics} from "@/api/api/logistics";
export default {
  name: "AgentShipping",
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
      // 供应商代发货表格数据
      agentShippingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopId: null,
        shopType: null,
        supplierId: null,
        orderNum: null,
        orderItemId: null,
        orderDate: null,
        goodsId: null,
        specId: null,
        goodsTitle: null,
        goodsImg: null,
        goodsNum: null,
        goodsSpec: null,
        specNum: null,
        goodsPrice: null,
        quantity: null,
        shipCompany: null,
        shipNo: null,
        shipCost: null,
        shipTime: null,
        status: null,
        itemAmount: null,
      },
      shopList: [],
      logisticsList:[],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        goodsPrice: [{ required: true, message: '不能为空' }],
        shipCompany: [{ required: true, message: '不能为空' }],
        shipNo: [{ required: true, message: '不能为空' }],
        shipCost: [{ required: true, message: '不能为空' }],
        shipTime: [{ required: true, message: '不能为空' }],
      },
      supplierLoading:false,
      supplierList:[]
    };
  },
  created() {

    this.getList();
    listShop({}).then(response => {
        this.shopList = response.rows;
      });
    listSupplier({}).then(response => {
      this.supplierList = response.rows;
      });
    listLogistics({}).then(resp=>{
      this.logisticsList = resp.rows
    })
  },
  methods: {
    searchSupplier(query){
      this.supplierLoading = true;
      const qw = {
        name:query
      }
      listSupplier(qw).then(response => {
        this.supplierList = response.rows;
        this.supplierLoading = false;
      });
    },
    /** 查询供应商代发货列表 */
    getList() {
      this.loading = true;
      listAgentShipping(this.queryParams).then(response => {
        this.agentShippingList = response.rows;
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
        shopId: null,
        shopType: null,
        supplierId: null,
        orderNum: null,
        orderItemId: null,
        orderDate: null,
        goodsId: null,
        specId: null,
        goodsTitle: null,
        goodsImg: null,
        goodsNum: null,
        goodsSpec: null,
        specNum: null,
        goodsPrice: null,
        quantity: null,
        remark: null,
        shipCompany: null,
        shipNo: null,
        shipCost: null,
        shipTime: null,
        status: null,
        itemAmount: null,
        createTime: null,
        createBy: null,
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
      this.reset();
      this.open = true;
      this.title = "添加供应商代发货";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAgentShipping(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改供应商代发货";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
            updateAgentShipping(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认编号为"' + ids + '"的订单批量付款呢？').then(function() {
        return delAgentShipping(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('scm/agentShipping/export', {
        ...this.queryParams
      }, `agentShipping_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
