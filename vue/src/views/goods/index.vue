<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="88px">
      <el-form-item label="商品名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入商品名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品编号" prop="number">
        <el-input
          v-model="queryParams.number"
          placeholder="请输入商品编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="商品分类" prop="categoryId">
        <!-- <el-input
          v-model="queryParams.categoryId"
          placeholder="请输入商品分类ID"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
        <treeselect :options="categoryTree" placeholder="请选择上级菜单" v-model="queryParams.categoryId" style="width: 230px;"/>
      </el-form-item>
      <el-form-item label="供应商" prop="supplierId">
        <el-select v-model="queryParams.supplierId" filterable  placeholder="请选择供应商名称">
            <el-option v-for="item in supplierList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="disable">
        <el-select v-model="queryParams.status" filterable  placeholder="状态">
          <el-option label="销售中" value="1"></el-option>
          <el-option label="已下架" value="2"></el-option>
        </el-select>
      </el-form-item>
<!--      <el-form-item label="条码" prop="barCode">-->
<!--        <el-input-->
<!--          v-model="queryParams.barCode"-->
<!--          placeholder="请输入条码"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->

      <!-- <el-form-item label="状态" prop="disable">
        <el-input
          v-model="queryParams.disable"
          placeholder="请输入0启用   1禁用"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->





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
          v-hasPermi="['goods:goods:add']"
        >添加商品</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          @click="handleImport"-->
<!--          v-hasPermi="['goods:goods:edit']"-->
<!--        >推送到线下渠道店铺</el-button>-->
<!--      </el-col>-->
      <!--
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['goods:goods:remove']"
        >删除</el-button>
      </el-col> -->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['goods:goods:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="商品名称" align="left" prop="name" width="300"/>
      <el-table-column label="商品图片" align="center" prop="image" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="商品编号" align="center" prop="goodsNum" />
      <!-- <el-table-column label="单位名称" align="center" prop="unitName" /> -->
      <el-table-column label="商品分类" align="center" prop="categoryId" >
        <template slot-scope="scope">
          <el-tag size="small">{{categoryList.find(x=>x.id === scope.row.categoryId)?categoryList.find(x=>x.id === scope.row.categoryId).name:''}}</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="条码" align="center" prop="barCode" /> -->
      <el-table-column label="SKU明细" align="center" >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleViewSkuList(scope.row)"
          >查看SKU明细</el-button>
        </template>
      </el-table-column>

      <!-- <el-table-column label="衣长/裙长/裤长" align="center" prop="length" />
      <el-table-column label="高度/袖长" align="center" prop="height" />
      <el-table-column label="宽度/胸阔(围)" align="center" prop="width" />
      <el-table-column label="肩阔" align="center" prop="width1" />
      <el-table-column label="腰阔" align="center" prop="width2" />
      <el-table-column label="臀阔" align="center" prop="width3" />
      <el-table-column label="重量" align="center" prop="weight" />
      <el-table-column label="0启用   1禁用" align="center" prop="disable" />
      <el-table-column label="保质期" align="center" prop="period" /> -->
      <el-table-column label="预计采购价格" align="center" prop="purPrice" />
      <el-table-column label="建议批发价" align="center" prop="wholePrice" />
      <el-table-column label="建议零售价" align="center" prop="retailPrice" />
      <!-- <el-table-column label="单位成本" align="center" prop="unitCost" /> -->
      <el-table-column label="供应商" align="center" prop="supplierId" >
        <template slot-scope="scope">
          <el-tag size="small">{{supplierList.find(x=>x.id == scope.row.supplierId)?supplierList.find(x=>x.id == scope.row.supplierId).name:''}}</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="品牌id" align="center" prop="brandId" />
      <el-table-column label="属性1：季节" align="center" prop="attr1" />
      <el-table-column label="属性2：分类" align="center" prop="attr2" />
      <el-table-column label="属性3：风格" align="center" prop="attr3" />
      <el-table-column label="属性4：年份" align="center" prop="attr4" />
      <el-table-column label="属性5：面料" align="center" prop="attr5" />
      <el-table-column label="外链url" align="center" prop="linkUrl" />
      <el-table-column label="最低库存" align="center" prop="lowQty" />
      <el-table-column label="最高库存" align="center" prop="highQty" /> -->
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 1">销售中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['goods:goods:edit']"
          >修改基本资料</el-button>
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
    <!-- 导入ERP商品 -->
    <el-dialog title="导入商品" :visible.sync="importOpen" width="400px" append-to-body>
      <el-upload
        class="upload-demo"
        :headers="headers"
        drag
        action="/dev-api/tao/order/order_import"
        accept="xlsx"
        multiple >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
      </el-upload>
    </el-dialog>

    <el-dialog :title="title" :visible.sync="skuOpen" width="1000px" append-to-body>
      <el-table v-loading="loading" :data="skuList">
        <!-- <el-table-column type="selection" width="55" align="center" /> -->
        <el-table-column label="Sku Id" align="center" prop="id" />
        <el-table-column label="商品名称" align="center" prop="goodsName" />
        <el-table-column label="SKU名称" align="center" prop="skuName" />
        <el-table-column label="SKU编码" align="center" prop="skuCode" />
        <el-table-column label="商品图片" align="center" prop="colorImage" width="100">
          <template slot-scope="scope">
            <image-preview :src="scope.row.colorImage" :width="50" :height="50"/>
          </template>
        </el-table-column>
        <el-table-column label="预计采购价" align="center" prop="purPrice" />
        <el-table-column label="状态" align="center" prop="status" >
          <template slot-scope="scope">
            <el-tag size="small" v-if="scope.row.status === 1">销售中</el-tag>
            <el-tag size="small" v-if="scope.row.status === 2">已下架</el-tag>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="商品名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品图片地址" prop="image">
          <image-upload v-model="form.image"/>
        </el-form-item>
        <el-form-item label="商品编号" prop="number">
          <el-input v-model="form.goodsNum" placeholder="请输入商品编号" />
        </el-form-item>
        <!--        <el-form-item label="单位名称" prop="unitName">-->
        <!--          <el-input v-model="form.unitName" placeholder="请输入单位名称" />-->
        <!--        </el-form-item>-->
        <el-form-item label="商品分类" prop="categoryId">
          <!--          <el-input v-model="form.categoryId" placeholder="请输入商品分类ID" />-->
          <treeselect :options="categoryTree" placeholder="请选择上级菜单" v-model="form.categoryId" style="width: 230px;"/>
        </el-form-item>
        <!--        <el-form-item label="条码" prop="barCode">-->
        <!--          <el-input v-model="form.barCode" placeholder="请输入条码" />-->
        <!--        </el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <!--        <el-form-item label="衣长/裙长/裤长" prop="length">-->
        <!--          <el-input v-model="form.length" placeholder="请输入衣长/裙长/裤长" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="高度/袖长" prop="height">-->
        <!--          <el-input v-model="form.height" placeholder="请输入高度/袖长" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="宽度/胸阔(围)" prop="width">-->
        <!--          <el-input v-model="form.width" placeholder="请输入宽度/胸阔(围)" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="肩阔" prop="width1">-->
        <!--          <el-input v-model="form.width1" placeholder="请输入肩阔" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="腰阔" prop="width2">-->
        <!--          <el-input v-model="form.width2" placeholder="请输入腰阔" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="臀阔" prop="width3">-->
        <!--          <el-input v-model="form.width3" placeholder="请输入臀阔" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="重量" prop="weight">-->
        <!--          <el-input v-model="form.weight" placeholder="请输入重量" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="0启用   1禁用" prop="disable">-->
        <!--          <el-input v-model="form.disable" placeholder="请输入0启用   1禁用" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="保质期" prop="period">-->
        <!--          <el-input v-model="form.period" placeholder="请输入保质期" />-->
        <!--        </el-form-item>-->
        <el-form-item label="预计采购价格" prop="purPrice">
          <el-input v-model="form.purPrice" placeholder="请输入预计采购价格" />
        </el-form-item>
        <el-form-item label="建议批发价" prop="wholePrice">
          <el-input v-model="form.wholePrice" placeholder="请输入建议批发价" />
        </el-form-item>
        <el-form-item label="建议零售价" prop="retailPrice">
          <el-input v-model="form.retailPrice" placeholder="请输入建议零售价" />
        </el-form-item>
        <!--        <el-form-item label="单位成本" prop="unitCost">-->
        <!--          <el-input v-model="form.unitCost" placeholder="请输入单位成本" />-->
        <!--        </el-form-item>-->
        <el-form-item label="供应商" prop="supplierId">
          <!--          <el-input v-model="form.supplierId" placeholder="请输入供应商id" />-->
          <el-select v-model="form.supplierId" filterable  placeholder="请选择供应商名称">
            <el-option v-for="item in supplierList" :key="item.id" :label="item.name" :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select v-model="form.status"   placeholder="状态">
            <el-option label="销售中" :value="1"></el-option>
            <el-option label="已下架" :value="2"></el-option>
          </el-select>
        </el-form-item>
        <!--        <el-form-item label="品牌" prop="brandId">-->
        <!--          <el-input v-model="form.brandId" placeholder="请输入品牌id" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="属性1：季节" prop="attr1">-->
        <!--          <el-input v-model="form.attr1" placeholder="请输入属性1：季节" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="属性2：分类" prop="attr2">-->
        <!--          <el-input v-model="form.attr2" placeholder="请输入属性2：分类" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="属性3：风格" prop="attr3">-->
        <!--          <el-input v-model="form.attr3" placeholder="请输入属性3：风格" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="属性4：年份" prop="attr4">-->
        <!--          <el-input v-model="form.attr4" placeholder="请输入属性4：年份" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="属性5：面料" prop="attr5">-->
        <!--          <el-input v-model="form.attr5" placeholder="请输入属性5：面料" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="外链url" prop="linkUrl">-->
        <!--          <el-input v-model="form.linkUrl" type="textarea" placeholder="请输入内容" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="最低库存" prop="lowQty">-->
        <!--          <el-input v-model="form.lowQty" placeholder="请输入最低库存" />-->
        <!--        </el-form-item>-->
        <!--        <el-form-item label="最高库存" prop="highQty">-->
        <!--          <el-input v-model="form.highQty" placeholder="请输入最高库存" />-->
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
import { listGoods, getGoods, delGoods, addGoods, updateGoods } from "@/api/goods/goods";
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { listCategory } from "@/api/goods/category";
import {getToken} from "@/utils/auth";
import {listSupplier} from "@/api/goods/supplier";
export default {
  name: "Goods",
  components: { Treeselect },
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
      // 商品管理表格数据
      goodsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      skuOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        image: null,
        number: null,
        unitName: null,
        categoryId: null,
        barCode: null,
        status: null,
        disable: null,
        supplierId: null,
        brandId: null,

      },
      // 表单参数
      form: {},
      categoryList: [],
      categoryTree: [],
      supplierList: [],
      skuList: [],
      // 表单校验
      rules: {
        status: [
          { required: true, message: "状态1销售中2已下架不能为空", trigger: "change" }
        ],
        length: [
          { required: true, message: "衣长/裙长/裤长不能为空", trigger: "blur" }
        ],
        height: [
          { required: true, message: "高度/袖长不能为空", trigger: "blur" }
        ],
        width: [
          { required: true, message: "宽度/胸阔(围)不能为空", trigger: "blur" }
        ],
        width1: [
          { required: true, message: "肩阔不能为空", trigger: "blur" }
        ],
        width2: [
          { required: true, message: "腰阔不能为空", trigger: "blur" }
        ],
        width3: [
          { required: true, message: "臀阔不能为空", trigger: "blur" }
        ],
        weight: [
          { required: true, message: "重量不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listCategory(this.queryParams).then(response => {
        this.categoryList = response.rows
        this.categoryTree = this.buildTree(response.rows,0)
        listSupplier({}).then(response => {
          this.supplierList = response.rows;
          // this.supplierLoading = false;
          this.getList();
        });
        // this.getList();
      });


  },
  methods: {
    normalizer(node) {
      return {
        id: node.id,
        label: node.value
      };
    },
    buildTree(list, parentId) {
      let tree = [];
      for (let i = 0; i < list.length; i++) {
        if (list[i].parentId === parentId) {
          let node = {
            id: list[i].id,
            label: list[i].name,
            children: this.buildTree(list, list[i].id)
          };
          tree.push(node);
        }
      }
      return tree;
    },
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listGoods(this.queryParams).then(response => {
        this.goodsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleAdd(){
      this.$router.push('/goods/create');
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.skuOpen = false;
      this.skuList = []
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        image: null,
        number: null,
        unitName: null,
        categoryId: null,
        barCode: null,
        remark: null,
        status: null,
        length: null,
        height: null,
        width: null,
        width1: null,
        width2: null,
        width3: null,
        weight: null,
        disable: null,
        period: null,
        purPrice: null,
        wholePrice: null,
        retailPrice: null,
        unitCost: null,
        supplierId: null,
        brandId: null,
        attr1: null,
        attr2: null,
        attr3: null,
        attr4: null,
        attr5: null,
        linkUrl: null,
        lowQty: null,
        highQty: null,
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
    /** 查看SKU List*/
    handleViewSkuList(row){
      this.skuList = row.skuList
      this.skuOpen = true;

    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getGoods(id).then(response => {
        this.form = response.data;
        this.form.disable = response.data.disable+''
        this.open = true;
        this.title = "修改商品基本信息";
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除商品管理编号为"' + ids + '"的数据项？').then(function() {
        return delGoods(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateGoods(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('goods/goods/export', {
        ...this.queryParams
      }, `goods_${new Date().getTime()}.xlsx`)
    },
    handleImport(){
      this.importOpen = true
    }
  }
};
</script>
