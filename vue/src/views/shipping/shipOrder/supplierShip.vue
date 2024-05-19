<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" filterable  placeholder="搜索店铺" >
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">1688</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">视频号小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">京东</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘宝天猫</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 8">快手小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="供应商" prop="supplierId">
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

      <el-form-item label="订单编号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>


      <el-form-item label="规格编码" prop="specNum">
        <el-input
          v-model="queryParams.specNum"
          placeholder="请输入商品规格编码"
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
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-document-checked"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--        >批量付款确认</el-button>-->
<!--      </el-col>-->
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
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="订单编号" align="center" prop="orderNum" />
      <!-- <el-table-column label="主键ID" align="center" prop="id" /> -->
      <el-table-column label="供应商" align="center" prop="supplierId" >
        <template slot-scope="scope">
          <span>{{ supplierList.find(x=>x.id === scope.row.supplierId)?supplierList.find(x=>x.id === scope.row.supplierId).name:''  }}</span>
        </template>
      </el-table-column>
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

<!--      <el-table-column label="子订单编号" align="center" prop="subOrderNum" />-->
<!--      <el-table-column label="下单日期" align="center" prop="orderDate" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->

<!--      <el-table-column label="商品图片" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-image  style="width: 70px; height: 70px;" :src="scope.row.goodsImg"></el-image>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="商品ID" align="center" prop="goodsId" />
      <el-table-column label="SkuId" align="center" prop="specId" />
      <el-table-column label="Sku编码" align="center" prop="specNum" />
      <el-table-column label="数量" align="center" prop="quantity" />

      <el-table-column label="SKU编码" align="center" prop="specNum" />
      <el-table-column label="操作" align="center" >
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.shipStatus !== 3"
            size="mini"
            type="primary"
            icon="el-icon-s-promotion"
            @click="handleShip(scope.row)"
            v-hasPermi="['scm:agentShipping:edit']"
          >发货</el-button>
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
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>

        <el-form-item label="订单编号" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入订单编号" disabled/>
        </el-form-item>

        <el-form-item label="订单日期" prop="orderDate">
          <el-date-picker clearable
            v-model="form.orderTime" disabled
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择订单日期">
          </el-date-picker>
        </el-form-item>
        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="itemList"  style="margin-bottom: 10px;">
          <!-- <el-table-column type="selection" width="50" align="center" /> -->
          <el-table-column label="序号" align="center" type="index" width="50"/>
          <el-table-column label="供应商" prop="supplierId">
            <template slot-scope="scope">
              <span>{{ supplierList.find(x=>x.id === scope.row.supplierId)?supplierList.find(x=>x.id === scope.row.supplierId).name:''  }}</span>
            </template>
          </el-table-column>
          <el-table-column label="商品ID" prop="goodsId"/>
          <el-table-column label="SkuId" prop="specId"/>
          <el-table-column label="Sku编码" prop="specNum"/>
          <el-table-column label="数量" prop="quantity"/>
          <el-table-column label="采购金额" prop="purAmount">
            <template slot-scope="scope">
            <el-input v-model="scope.row.purAmount" placeholder="请输入采购金额" />
            </template>
          </el-table-column>
        </el-table>

        <el-form-item label="物流公司" prop="logisticsCompany">
          <el-select v-model="form.logisticsCompany" filterable r placeholder="选择快递公司" >
            <el-option v-for="item in logisticsList" :key="item.id" :label="item.name" :value="item.name">
              <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px" >{{item.number}}</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="物流单号" prop="logisticsCode">
          <el-input v-model="form.logisticsCode" placeholder="请输入物流单号" />
        </el-form-item>
        <el-form-item label="运费" prop="logisticsFee">
          <el-input type="number" v-model.number="form.logisticsFee" placeholder="请输入运费" />
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
import {getShipOrderItemList, listShipOrder, supplierShipOrder} from "@/api/shipping/shipOrder";
import { listSupplier} from "@/api/scm/supplier";
import { listShop } from "@/api/shop/shop";
import {listLogistics} from "@/api/shipping/logistics";
export default {
  name: "supplierShip",
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
        goodsId: null,
        specId: null,
        shipType: 1,
        shipStatus: 1,
        specNum: null
      },
      shopList: [],
      logisticsList:[],
      // 表单参数
      form: {},
      itemList:[],
      // 表单校验
      rules: {
        logisticsCompany: [{ required: true, message: '不能为空' }],
        logisticsCode: [{ required: true, message: '不能为空' }],
        logisticsFee: [{ required: true, message: '不能为空' }],
        shipTime: [{ required: true, message: '不能为空' }],
      },
      supplierLoading:false,
      supplierList:[]
    };
  },
  created() {
    listShop({}).then(response => {
      this.shopList = response.rows;
    });
    this.getList();
    // listShop({}).then(response => {
    //     this.shopList = response.rows;
    //   });
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
      listShipOrder(this.queryParams).then(response => {
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
      this.form.erpOrderId = null
      this.form.orderNum = null
      this.form.orderTime = null
      this.form.itemList = []

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
    /** 发货按钮操作 */
    handleShip(row) {
      this.reset();
      const id = row.id || this.ids
      getShipOrderItemList(id).then(response => {
        if(response.rows){
          this.itemList = response.rows
          this.form.orderNum = response.rows[0].orderNum;
          this.form.erpOrderId = response.rows[0].erpOrderId;
          this.form.orderTime = response.rows[0].orderTime;
        }

        this.open = true;
        this.title = "发货";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          let hasAmoutNull = false;
          // 判断采购金额是否为空
          console.log("=======",this.itemList)

          this.itemList.forEach(x=>{
            if(!x.purAmount){
              hasAmoutNull = true
              return
            }
          })
          if(hasAmoutNull){
            this.$modal.msgError("请填写采购金额");
          }else{
            this.form.itemList = this.itemList
            supplierShipOrder(this.form).then(response => {
              this.$modal.msgSuccess("发货成功");
              this.open = false;
              this.getList();
            });
          }


        }
      });
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
