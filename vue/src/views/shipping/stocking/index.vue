<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" filterable  placeholder="搜索店铺" >
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 1">1688</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 2">视频号小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 3">京东</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 4">淘宝天猫</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 5">拼多多</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 6">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 7">小红书</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 8">快手</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.platform === 99">其他渠道</span>
          </el-option>
          </el-select>
      </el-form-item>
<!--      <el-form-item label="商品ID" prop="goodsId">-->
<!--        <el-input-->
<!--          v-model="queryParams.goodsId"-->
<!--          placeholder="请输入erp系统商品id"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="商品编码" prop="goodsNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.goodsNum"-->
<!--          placeholder="请输入商品编码"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="规格ID" prop="specId">-->
<!--        <el-input-->
<!--          v-model="queryParams.specId"-->
<!--          placeholder="请输入erp系统商品规格id"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="规格编码" prop="specNum">
        <el-input
          v-model="queryParams.specNum"
          placeholder="请输入商品规格编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备货状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择">
        <el-option
          v-for="item in statusList"
          :key="item.value"
          :label="item.label"
          :value="item.value">
        </el-option>
        </el-select>
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
          v-hasPermi="['wms:shipping:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shippingList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" v-if="queryParams.status==='0'" align="center" />
       <el-table-column label="订单号" prop="orderNum" align="left" width="180" >
        <template slot-scope="scope">
          <p>{{scope.row.orderNum}}</p>
          <el-tag  effect="plain">{{shopList.find(x=>x.id === scope.row.shopId).name}}</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="子订单编号" align="center" prop="orderItemId" /> -->
<!--      <el-table-column label="订单日期" align="center" prop="orderDate" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="商品图片" >
        <template slot-scope="scope">
              <el-image  style="width: 70px; height: 70px;" :src="scope.row.goodsImg"></el-image>
        </template>
      </el-table-column>
      <el-table-column label="商品标题" align="center" prop="goodsTitle" />
      <el-table-column label="规格" align="center" prop="goodsSpec" />
      <el-table-column label="规格编码" align="center" prop="specNum" />
      <el-table-column label="erp商品id" align="center" prop="goodsId" />
      <el-table-column label="erp商品SkuId" align="center" prop="specId" />
      <el-table-column label="商品Sku编码" align="center" prop="specNum" />
       <el-table-column label="商品数量" align="center" prop="quantity" >
         <template slot-scope="scope">
         <el-tag size="small">{{scope.row.quantity}}</el-tag>
         </template>
       </el-table-column>
<!--      <el-table-column label="仓库库存" align="center" prop="inventory" />-->
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 0">待备货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 1">备货中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已出库</el-tag>
          <el-tag size="small" v-if="scope.row.status === 3">已发货</el-tag>
        </template>
      </el-table-column>
            <el-table-column label="操作" align="center" >
              <template slot-scope="scope">
                <el-button
                  v-if="!scope.row.specId||scope.row.specId === 0"
                  size="mini"
                  type="primary"
                  icon="el-icon-edit"
                  @click="handleUpdateLink(scope.row)"
                >修改商品关联</el-button>
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



    <!-- 修改skuid对话框 -->
    <el-dialog title="修改SkuId" :visible.sync="skuIdUpdateOpen" width="500px" append-to-body>
      <el-form ref="form2" :model="form2" :rules="rules2" label-width="120px" inline>
<!--        <el-form-item label="ERP商品ID" prop="erpGoodsId" >-->
<!--          <el-input v-model="form2.erpGoodsId" disabled placeholder="请输入ERP商品ID" />-->
<!--        </el-form-item>-->
        <el-form-item label="ERP商品SkuId" prop="erpGoodsSpecId" >
          <el-input type="number" v-model="form2.erpGoodsSpecId" placeholder="请输入ERP商品SkuId" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitSkuIdUpdateForm">分配供应商发货</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {listShipStockUp } from "@/api/shipping/stockUp";
import { listShop } from "@/api/shop/shop";
import {listSupplier} from "@/api/scm/supplier";
export default {
  name: "ShipStockUp",
  computed: {
    supplier() {
      return supplier
    }
  },
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
      // 仓库订单发货表格数据
      shippingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      supplierShipOpen: false,
      skuIdUpdateOpen: false,
      isGen:true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        shopId: null,
        goodsId: null,
        specId: null,
        goodsNum: null,
        goodsSpec: null,
        specNum: null,
        status: null,
      },
      // 表单参数
      form: {
        orderItemIds:[]
      },
      form1: {
        orderItemIds:[]
      },
      form2: {
        orderItemId:null
      },
      shopList: [],
      skuList:[],
      supplierList:[],
      statusList: [
        {
          value: '0',
          label: '待备货'
        }, {
          value: '1',
          label: '备货中'
        }, {
          value: '2',
          label: '已出库'
        }
      ],
      // 表单校验
      rules: {
        stockOutNum: [{ required: true, message: "单号不能为空", trigger: "blur" }],
        createTime: [{ required: true, message: "生成时间不能为空", trigger: "blur" }],
        goodsId: [{ required: true, message: "erp系统商品id不能为空", trigger: "blur" }],
        specId: [{ required: true, message: "erp系统商品规格id不能为空", trigger: "blur" }],
        quantity: [{ required: true, message: "商品数量不能为空", trigger: "blur" }],
      },
      rules1: {
        supplierId: [{ required: true, message: "请选择供应商", trigger: "blur" }],
      },
      rules2: {
        erpGoodsSpecId: [{ required: true, message: "请选择填写ERP商品SkuId", trigger: "blur" }],
      }
    };
  },
  mounted() {

  },
  created() {
    listShop({}).then(response => {
        this.shopList = response.rows;
      });
    if(this.$route.query.status){
      this.queryParams.status = this.$route.query.status
    }else {
      this.queryParams.status = '0'
    }
    this.getList();
  },
  methods: {
    rowItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 查询仓库订单发货列表 */
    getList() {
      this.loading = true;
      listShipStockUp(this.queryParams).then(response => {
        this.shippingList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.skuList = []
      this.open = false;
      this.supplierShipOpen = false;
      this.skuIdUpdateOpen = false;
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
    /** 导出按钮操作 */
    handleExport() {
      this.download('wms/shipping/export', {
        ...this.queryParams
      }, `shipping_${new Date().getTime()}.xlsx`)
    },
    handleUpdateLink(row){
      console.log("修改商品关联")
      this.skuIdUpdateOpen = true
      this.form2.orderItemId = row.id
      // this.$modal.msgError("修改商品关联");
    },
    submitSkuIdUpdateForm(){
      this.$refs["form2"].validate(valid => {
        if (valid) {
          orderItemSpecIdUpdate(this.form2).then(response => {
            this.$modal.msgSuccess("SkuId修改成功");
            this.skuIdUpdateOpen = false;
            this.getList();
          });

        }
      });
    }
  }
};
</script>
