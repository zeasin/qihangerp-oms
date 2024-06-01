<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="平台" prop="shopType">-->
<!--        <el-input-->
<!--          v-model="queryParams.shopType"-->
<!--          placeholder="请输入平台"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="店铺" prop="shopId">
<!--        <el-input-->
<!--          v-model="queryParams.shopId"-->
<!--          placeholder="请输入店铺"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
        <el-select v-model="form.shopId" filterable r placeholder="搜索店铺" >
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">1688</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">视频号小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">京东</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘系店铺</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 8">快手小店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="商品编码" prop="goodsNum">
        <el-input
          v-model="queryParams.goodsNum"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入商品标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

<!--      <el-form-item label="发布日期" prop="publishTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.publishTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="请选择发布日期">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->

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
          v-hasPermi="['shop:goods:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
          v-hasPermi="['pdd:order:remove']"
        >API拉取店铺商品</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['shop:goods:edit']"-->
<!--        >修改</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['shop:goods:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['shop:goods:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
      <el-table-column label="序号" type="index" />
      <el-table-column label="网店商品ID" align="center" prop="goodsId" />
      <el-table-column label="店铺" align="center" prop="shopId" />
      <el-table-column label="商品编码" align="center" prop="goodsNum" />
      <el-table-column label="商品标题" align="center" prop="title" />
      <el-table-column label="主图" align="center" prop="thumbUrl" >
        <template slot-scope="scope">
          <el-image style="width: 70px; height: 70px" :src="scope.row.thumbUrl"></el-image>
        </template>
      </el-table-column>
      <el-table-column label="累计销量" align="center" prop="totalSales" />
      <el-table-column label="发布日期" align="center" prop="publishTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.publishTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['shop:goods:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['shop:goods:remove']"
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

    <!-- 添加或修改店铺商品对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="平台商品ID" prop="goodsId">
          <el-input v-model="form.goodsId" placeholder="请输入平台商品ID" />
        </el-form-item>
        <el-form-item label="Erp商品ID" prop="erpGoodsId">
          <el-input v-model="form.erpGoodsId" placeholder="请输入Erp商品ID" />
        </el-form-item>
        <el-form-item label="店铺" prop="shopId">
<!--          <el-input v-model="form.shopId" placeholder="请输入${comment}" />-->
          <el-select v-model="form.shopId" filterable r placeholder="搜索店铺" >
            <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
              <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">1688</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">视频号小店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">京东</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘系店铺</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 8">快手小店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他</span>
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="商品编码" prop="goodsNum">
          <el-input v-model="form.goodsNum" placeholder="请输入商品编码" />
        </el-form-item>
        <el-form-item label="商品名称" prop="goodsName">
          <el-input v-model="form.goodsName" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="参考价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入参考价格，返回价格区间，可能为空" />
        </el-form-item>
        <el-form-item label="商品标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入商品标题" />
        </el-form-item>
<!--        <el-form-item label="${comment}" prop="remark">-->
<!--          <el-input v-model="form.remark" placeholder="请输入${comment}" />-->
<!--        </el-form-item>-->
        <el-form-item label="主图URL" prop="thumbUrl">
          <el-input v-model="form.thumbUrl" placeholder="请输入主图" />
        </el-form-item>
<!--        <el-form-item label="商品图片json" prop="imageUrl">-->
<!--          <el-input v-model="form.imageUrl" type="textarea" placeholder="请输入内容" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="${comment}" prop="isMoreSku">-->
<!--          <el-input v-model="form.isMoreSku" placeholder="请输入${comment}" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="${comment}" prop="isOnsale">-->
<!--          <el-input v-model="form.isOnsale" placeholder="请输入${comment}" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="累计销量" prop="totalSales">-->
<!--          <el-input v-model="form.totalSales" placeholder="请输入累计销量" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="发布日期" prop="publishTime">-->
<!--          <el-date-picker clearable-->
<!--            v-model="form.publishTime"-->
<!--            type="date"-->
<!--            value-format="yyyy-MM-dd"-->
<!--            placeholder="请选择发布日期">-->
<!--          </el-date-picker>-->
<!--        </el-form-item>-->
        <el-divider content-position="center">商品SKU信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddSShopGoodsSku">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteSShopGoodsSku">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="sShopGoodsSkuList" :row-class-name="rowSShopGoodsSkuIndex" @selection-change="handleSShopGoodsSkuSelectionChange" ref="sShopGoodsSku">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="平台商品ID" prop="goodsId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsId" placeholder="请输入平台商品ID" />
            </template>
          </el-table-column>
          <el-table-column label="平台SkuId" prop="skuId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skuId" placeholder="请输入平台SkuId" />
            </template>
          </el-table-column>
          <el-table-column label="sku编码" prop="outerId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.outerId" placeholder="请输入sku编码" />
            </template>
          </el-table-column>

          <el-table-column label="建议零售价" prop="retailPrice" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.retailPrice" placeholder="请输入建议零售价" />
            </template>
          </el-table-column>

        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listGoods, getGoods, delGoods, addGoods, updateGoods } from "@/api/shop/goods";
import {listShop} from "@/api/shop/shop";

export default {
  name: "Goods",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedSShopGoodsSku: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 店铺商品表格数据
      goodsList: [],
      // ${subTable.functionName}表格数据
      sShopGoodsSkuList: [],
      shopList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        goodsId: null,
        erpGoodsId: null,
        shopId: null,
        shopType: null,
        goodsNum: null,
        goodsName: null,
        price: null,
        title: null,
        thumbUrl: null,
        imageUrl: null,
        isMoreSku: null,
        isOnsale: null,
        totalSales: null,
        publishTime: null,
        createTime: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        goodsId: [{ required: true, message: "平台商品ID不能为空", trigger: "blur" }],
        shopId: [{ required: true, message: "请选择店铺", trigger: "blur" }],
        goodsNum: [{ required: true, message: "商品编码不能为空", trigger: "change" }],
      }
    };
  },
  created() {
    // console.log('url参数：',this.$route.query.shopType)
    // if(this.$route.query.shopType) {
    //   this.queryParams.shopType = this.$route.query.shopType
      listShop({type:this.queryParams.shopType}).then(response => {
        this.shopList = response.rows;
      });
    // }
    this.getList();
  },
  methods: {
    /** 查询店铺商品列表 */
    getList() {
      this.loading = true;
      listGoods(this.queryParams).then(response => {
        this.goodsList = response.rows;
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
        goodsId: null,
        erpGoodsId: null,
        shopId: null,
        shopType: null,
        goodsNum: null,
        goodsName: null,
        price: null,
        title: null,
        remark: null,
        thumbUrl: null,
        imageUrl: null,
        isMoreSku: null,
        isOnsale: null,
        totalSales: null,
        publishTime: null,
        createTime: null
      };
      this.sShopGoodsSkuList = [];
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
      this.title = "添加店铺商品";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGoods(id).then(response => {
        this.form = response.data;
        this.sShopGoodsSkuList = response.data.sShopGoodsSkuList;
        this.open = true;
        this.title = "修改店铺商品";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.sShopGoodsSkuList = this.sShopGoodsSkuList;
          if (this.form.id != null) {
            updateGoods(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addGoods(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除店铺商品编号为"' + ids + '"的数据项？').then(function() {
        return delGoods(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** ${subTable.functionName}序号 */
    rowSShopGoodsSkuIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** ${subTable.functionName}添加按钮操作 */
    handleAddSShopGoodsSku() {
      let obj = {};
      obj.goodsId = "";
      obj.skuId = "";
      obj.spec = "";
      obj.erpGoodsSpecId = "";
      obj.erpGoodsId = "";
      obj.erpGoodsSpecCode = "";
      obj.skuQuantity = "";
      obj.consignPrice = "";
      obj.outerId = "";
      obj.outerGoodsId = "";
      obj.price = "";
      obj.retailPrice = "";
      obj.amountOnSale = "";
      obj.isSkuOnsale = "";
      obj.cargoNumber = "";
      obj.attributes = "";
      this.sShopGoodsSkuList.push(obj);
    },
    /** ${subTable.functionName}删除按钮操作 */
    handleDeleteSShopGoodsSku() {
      if (this.checkedSShopGoodsSku.length == 0) {
        this.$modal.msgError("请先选择要删除的${subTable.functionName}数据");
      } else {
        const sShopGoodsSkuList = this.sShopGoodsSkuList;
        const checkedSShopGoodsSku = this.checkedSShopGoodsSku;
        this.sShopGoodsSkuList = sShopGoodsSkuList.filter(function(item) {
          return checkedSShopGoodsSku.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleSShopGoodsSkuSelectionChange(selection) {
      this.checkedSShopGoodsSku = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('shop/goods/export', {
        ...this.queryParams
      }, `goods_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
