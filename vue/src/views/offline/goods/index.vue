<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="商品名称" prop="goodsName">
        <el-input
          v-model="queryParams.goodsName"
          placeholder="商品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="SKU编码" prop="skuCode">
        <el-input
          v-model="queryParams.skuCode"
          placeholder="请输入SKU编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="第三方平台skuId" prop="skuId">
        <el-input
          v-model="queryParams.skuId"
          placeholder="第三方平台skuId"
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
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['goods:goods:add']"
          >手动导入商品SKU</el-button>
        </el-col>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsSpecList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="Sku ID" align="left" prop="id" >
          <template slot-scope="scope">
            {{scope.row.id}} <br/>
            <el-tag>{{ shopList.find(x=>x.id === scope.row.shopId) ? shopList.find(x=>x.id === scope.row.shopId).name : '' }}</el-tag>
          </template>
      </el-table-column>
      <el-table-column label="Sku编码" align="center" prop="skuCode" />
      <el-table-column label="商品名称" align="left" prop="goodsName" />
      <el-table-column label="Sku名称" align="left" prop="skuName" />
      <el-table-column label="图片" align="center" prop="colorImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.colorImage" :width="50" :height="50"/>
        </template>
      </el-table-column>

      <el-table-column label="第三方平台SkuId" align="center" prop="skuId" />
      <el-table-column label="商品库SkuId" align="center" prop="ogoodsSkuId" />
      <el-table-column label="售价" align="center" prop="salePrice" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status===1">上架中</el-tag>
          <el-tag size="small" v-if="scope.row.status===2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['api:goodsSpec:edit']"-->
<!--          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['goods:goods:remove']"
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

    <!-- 添加或修改商品规格库存管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item  label="店铺" prop="shopId">
          <el-select v-model="form.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
            <el-option
              v-for="item in shopList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
<!--        <el-form-item label="商品名" prop="goodsName">-->
<!--          <el-input v-model="form.goodsName" placeholder="请输入商品名" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="SKU名" prop="skuName">-->
<!--          <el-input v-model="form.skuName" placeholder="请输入SKU名" />-->
<!--        </el-form-item>-->
        <el-form-item label="SKU编码" prop="skuCode">
          <el-input v-model="form.skuCode" placeholder="请输入SKU编码" />
        </el-form-item>

<!--        <el-form-item label="图片URL" prop="colorImage">-->
<!--&lt;!&ndash;          <image-upload v-model="form.colorImage" :limit="1" />&ndash;&gt;-->
<!--          <el-input v-model="form.colorImage" placeholder="图片URL" />-->
<!--        </el-form-item>-->
        <el-form-item label="售价" prop="salePrice">
          <el-input type="number" v-model.number="form.salePrice" placeholder="售价" />
        </el-form-item>

<!--        <el-form-item label="规格1" prop="colorValue">-->
<!--          <el-input v-model="form.colorValue" placeholder="请输入规格1" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="规格2" prop="sizeValue">-->
<!--          <el-input v-model="form.sizeValue" placeholder="请输入规格2" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="规格3" prop="styleValue">-->
<!--          <el-input v-model="form.styleValue" placeholder="请输入规格3" />-->
<!--        </el-form-item>-->
        <el-form-item label="第三方平台SkuId" prop="skuId">
          <el-input type="number" v-model.number="form.skuId" placeholder="请输入第三方平台SkuId" />
        </el-form-item>
<!--        <el-form-item label="ERP商品SkuID" prop="outerErpSkuId">-->
<!--          <el-input type="number" v-model.number="form.outerErpSkuId" placeholder="请输入ERP商品SkuID" />-->
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
import {listGoodsSku, getGoodsSku, updateGoodsSku, addGoodsSku, delGoodsSku} from "@/api/offline/goodsSku";
import {getToken} from "@/utils/auth";
import {listShop} from "@/api/shop/shop";

export default {
  name: "GoodsOffline",
  data() {
    return {
      headers: { 'Authorization': 'Bearer ' + getToken() },
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
      // 商品规格库存管理表格数据
      goodsSpecList: [],
      shopList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        erpGoodsId: null,
        erpSkuId: null,
        skuName: null,
        skuNum: null,
      },
      // 表单参数
      form: {
        salePrice:null
      },
      // 表单校验
      rules: {
        shopId: [{ required: true, message: "不能为空", trigger: "blur" }],
        goodsName: [{ required: true, message: "不能为空", trigger: "blur" }],
        skuName: [{ required: true, message: "不能为空", trigger: "blur" }],
        skuCode: [{ required: true, message: "SKU不能为空", trigger: "blur" }],
        salePrice: [{ required: true, message: "不能为空", trigger: "blur" }],

      }
    };
  },
  created() {
    listShop({type: 999}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });

  },
  methods: {
    /** 查询商品规格库存管理列表 */
    getList() {
      this.loading = true;
      listGoodsSku(this.queryParams).then(response => {
        this.goodsSpecList = response.rows;
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
        skuName: null,
        skuNum: null,
        colorValue: null,
        colorImage: null,
        sizeValue: null,
        styleValue: null,
        erpGoodsId: null,
        erpSkuId: null
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
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除商品管理编号为"' + ids + '"的数据项？').then(function() {
        return delGoodsSku(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 修改按钮操作 */
    // handleUpdate(row) {
    //   this.reset();
    //   const id = row.id || this.ids
    //   getGoodsSku(id).then(response => {
    //     this.form = response.data;
    //     this.form.disable = response.data.disable+''
    //     this.open = true;
    //     this.title = "修改商品规格库存管理";
    //   });
    // },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGoodsSku(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }else{
            addGoodsSku(this.form).then(response => {
              this.$modal.msgSuccess("添加成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleAdd(){
      this.reset()
      this.open = true
    },

  }
};
</script>
