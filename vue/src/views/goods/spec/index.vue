<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="120px">
      <el-form-item label="ERP商品ID" prop="goodsId">
        <el-input
          v-model="queryParams.erpGoodsId"
          placeholder="请输入ERP商品ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="ERP商品SKUID" prop="goodsId">
        <el-input
          v-model="queryParams.erpSkuId"
          placeholder="请输入ERP商品SKUID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="SKU编码" prop="skuNum">
        <el-input
          v-model="queryParams.skuNum"
          placeholder="请输入SKU编码"
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
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['goods:goods:add']"
          >添加商品SKU</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            @click="handleImport"
            v-hasPermi="['goods:goods:edit']"
          >导入商品SKU</el-button>
        </el-col>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsSpecList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ERP Sku ID" align="center" prop="erpSkuId" />
      <el-table-column label="ERP商品ID" align="center" prop="erpGoodsId" />
      <el-table-column label="Sku名" align="center" prop="skuName" />
      <el-table-column label="Sku编码" align="center" prop="skuNum" />
<!--      <el-table-column label="颜色" align="center" prop="colorValue" />-->
      <el-table-column label="颜色图片" align="center" prop="colorImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.colorImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="尺码" align="center" prop="sizeValue" />
      <el-table-column label="款式" align="center" prop="styleValue" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status===1">上架中</el-tag>
          <el-tag size="small" v-if="scope.row.status===2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['api:goodsSpec:edit']"
          >修改</el-button>

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
        <el-form-item label="SKU名" prop="skuName">
          <el-input v-model="form.skuName" placeholder="请输入SKU名" />
        </el-form-item>
        <el-form-item label="SKU编码" prop="skuNum">
          <el-input v-model="form.skuNum" placeholder="请输入SKU编码" />
        </el-form-item>
        <el-form-item label="颜色" prop="colorValue">
          <el-input v-model="form.colorValue" placeholder="请输入颜色值" />
        </el-form-item>
        <el-form-item label="图片" prop="colorImage">
          <image-upload v-model="form.colorImage" :limit="1" />
        </el-form-item>
        <el-form-item label="尺码" prop="sizeValue">
          <el-input v-model="form.sizeValue" placeholder="请输入尺码值" />
        </el-form-item>
        <el-form-item label="款式" prop="styleValue">
          <el-input v-model="form.styleValue" placeholder="请输入款式值" />
        </el-form-item>
        <el-form-item label="ERP商品ID" prop="erpGoodsId">
          <el-input type="number" v-model.number="form.erpGoodsId" placeholder="请输入ERP商品ID" />
        </el-form-item>
        <el-form-item label="ERP商品SkuID" prop="erpSkuId">
          <el-input type="number" v-model.number="form.erpSkuId" placeholder="请输入ERP商品SkuID" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 导入ERP商品sku -->
    <el-dialog title="导入商品SKU" :visible.sync="importOpen" width="400px" append-to-body>
      <el-upload
        class="upload-demo"
        :headers="headers"
        drag
        action="/dev-api/api/oms-api/goods/goods_sku_import"
        accept="xlsx"
        multiple >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
    </el-dialog>
  </div>
</template>

<script>
import {listGoodsSpec, getGoodsSpec, updateGoodsSpec, addGoodsSpec} from "@/api/goods/goodsSpec";
import {getToken} from "@/utils/auth";

export default {
  name: "GoodsSpec",
  data() {
    return {
      importOpen:false,
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
      form: {},
      // 表单校验
      rules: {
        skuName: [{ required: true, message: "SKU编码不能为空", trigger: "blur" }],
        skuNum: [{ required: true, message: "SKU名称不能为空", trigger: "blur" }],
        erpGoodsId: [{ required: true, message: "SerpGoodsId不能为空", trigger: "blur" }],
        erpSkuId: [{ required: true, message: "erpSkuId不能为空", trigger: "blur" }],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询商品规格库存管理列表 */
    getList() {
      this.loading = true;
      listGoodsSpec(this.queryParams).then(response => {
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

    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGoodsSpec(id).then(response => {
        this.form = response.data;
        this.form.disable = response.data.disable+''
        this.open = true;
        this.title = "修改商品规格库存管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGoodsSpec(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }else{
            addGoodsSpec(this.form).then(response => {
              this.$modal.msgSuccess("添加成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleAdd(){
      this.open = true
    },
    handleImport(){
      this.importOpen = true
    }
  }
};
</script>
