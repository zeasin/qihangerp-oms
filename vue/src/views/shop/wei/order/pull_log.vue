<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
         <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="类型" prop="pullType">
        <el-select v-model="queryParams.pullType" placeholder="请选择类型" clearable @change="handleQuery">
          <el-option label="拉取订单" value="ORDER"></el-option>
          <el-option label="拉取退款" value="REFUND"></el-option>
          <el-option label="拉取商品" value="GOODS"></el-option>

        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="lists" >
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="店铺" align="center" prop="shopId" />
      <el-table-column label="平台" align="center" prop="shopType" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.shopType === 1">天猫</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 2">京东</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="pullType" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.pullType === 'GOODS'">拉取商品</el-tag>
          <el-tag size="small" v-if="scope.row.pullType === 'ORDER'">拉取订单</el-tag>
          <el-tag size="small" v-if="scope.row.pullType === 'REFUND'">拉取退款</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="方式" align="center" prop="pullWay" />

      <el-table-column label="参数" align="center" prop="pullParams" />
      <el-table-column label="结果" align="center" prop="pullResult" />
      <el-table-column label="耗时（ms）" align="center" prop="duration" />
      <el-table-column label="时间" align="center" prop="pullTime" />

    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />


  </div>
</template>

<script>
import {listShop} from "@/api/shop/shop";

export default {
  name: "Order",
  data() {
    return {
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 遮罩层
      loading: true,
      lists:[],
      shopList:[],
      skuList:[],
      // 是否显示弹出层
      detailOpen:false,
      skuListLoading:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pullType: 'ORDER'
      },
      // 表单参数
      form: {
        erpGoodsSkuId:null,
        id:null
      },
      rules: {
        id: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
        erpGoodsSkuId: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listShop({}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  mounted() {
    if(this.$route.query.shopId){
        this.queryParams.shopId = this.$route.query.shopId
    }
  },
  methods: {
    /** 查询淘宝订单列表 */
    getList() {
      this.loading = true;
      listShopPullLogs(this.queryParams).then(response => {
        this.lists = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
    }
  }
};
</script>
