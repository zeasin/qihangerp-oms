<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="平台商品ID" prop="numIid">
        <el-input
          v-model="queryParams.numIid"
          placeholder="请输入平台商品ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="平台SkuId" prop="skuId">
        <el-input
          v-model="queryParams.skuId"
          placeholder="请输入平台SkuId"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商家sku编码" prop="outerId">
        <el-input
          v-model="queryParams.outerId"
          placeholder="请输入商家sku编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ERP skuId" prop="erpGoodsSkuId">
        <el-input
          v-model="queryParams.erpGoodsSkuId"
          placeholder="请输入ERP skuId"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
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
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          :loading="pullLoading"
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
        >API拉取商品数据</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" >
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="平台skuId" align="center" prop="skuId" />
      <el-table-column label="平台商品ID" align="center" prop="numIid" />
      <el-table-column label="商家编码" align="center" prop="outerId" />
      <el-table-column label="标题" align="center" prop="title" />
      <el-table-column label="主图" width="100">
          <template slot-scope="scope">
              <el-image  style="width: 70px; height: 70px;" :src="scope.row.picUrl"></el-image>
          </template>
      </el-table-column>
      <el-table-column label="规格" align="center" prop="propertiesName" />
      <el-table-column label="ERP商品sku Id" align="center" prop="erpGoodsSkuId" />
<!--      <el-table-column label="快递单号" align="center" prop="logisticsCode" />-->

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-share"
            @click="handleLink(scope.row)"
          >关联ERP</el-button>
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

    <!-- 关联ERP -->
    <el-dialog title="关联ERP商品SKU" :visible.sync="detailOpen" width="560px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="120px" inline>
        <el-form-item label="ERP商品SkuId" prop="erpGoodsSkuId">
          <el-input v-model.number="form.erpGoodsSkuId" placeholder="请输入ERP商品SkuId" style="width:250px" />
<!--            <el-select v-model="form.erpGoodsSkuId" filterable remote reserve-keyword placeholder="搜索（sku编码、skuId）" style="width: 350px;"-->
<!--                       :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">-->
<!--              <el-option v-for="item in skuList" :key="item.id"-->
<!--                         :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"-->
<!--                         :value="item.id">-->
<!--              </el-option>-->
<!--            </el-select>-->
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
import { listShop } from "@/api/shop/shop";
import { searchSku } from "@/api/goods/goods";
import {MessageBox} from "element-ui";
import {getGoodsSku, linkErpGoodsSkuId, listGoodsSku, pullGoodsList} from "@/api/tao/goods";

export default {
  name: "GoodsTao",
  data() {
    return {
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 遮罩层
      loading: true,
      pullLoading: false,
      goodsList:[],
      shopList:[],
      skuList:[],
      // 是否显示弹出层
      detailOpen:false,
      skuListLoading:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopId: null,
        numIid: null,
        skuId: null,
        outerId: null,
        erpGoodsSkuId: null
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
    listShop({platform: 4}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
    // this.getList();
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
      console.log('====222222==',this.queryParams)
      listGoodsSku(this.queryParams).then(response => {
        this.goodsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.detailOpen = false;
      this.saleAfterOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        erpGoodsSkuId: null
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
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullGoodsList({shopId:this.queryParams.shopId}).then(response => {
          console.log('拉取淘宝商品接口返回=====',response)
          if(response.code === 1401) {
              MessageBox.confirm('Token已过期，需要重新授权！请前往店铺列表重新获取授权！', '系统提示', { confirmButtonText: '前往授权', cancelButtonText: '取消', type: 'warning' }).then(() => {
                // isRelogin.show = false;
                this.$router.push({path:"/shop/shop_list",query:{platform:4}})
                // store.dispatch('LogOut').then(() => {
                // location.href = response.data.tokenRequestUrl+'?shopId='+this.queryParams.shopId
                // })
              }).catch(() => {
                isRelogin.show = false;
              });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          }else{
            this.$modal.msgSuccess(JSON.stringify(response));
            this.getList()
          }


          this.pullLoading = false
        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          linkErpGoodsSkuId(this.form).then(response => {
            this.$modal.msgSuccess("关联成功");
            this.detailOpen = false;
            this.getList();
          });
        }
      });
    },
    handleLink(row) {
      this.reset();
      const id = row.id || this.ids
      getGoodsSku(id).then(response => {
        console.log('=====00000000============',response)
        this.form = response.data;
        this.detailOpen = true;
      });
    },
    // 搜索SKU
    searchSku(query) {
      this.shopLoading = true;
      const qw = {
        keyword: query
      }
      searchSku(qw).then(res => {
        this.skuList = res.rows;
        this.skuListLoading = false;
      })
    },
  }
};
</script>
