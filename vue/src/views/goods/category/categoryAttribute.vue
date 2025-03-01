<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类" prop="categoryName">
        <el-input
          v-model="queryParams.categoryName"
          placeholder=""
          readonly
        />
      </el-form-item>
<!--      <el-form-item label="'属性名'" prop="title">-->
<!--        <el-input-->
<!--          v-model="queryParams.title"-->
<!--          placeholder="请输入'属性名'"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="固定值color颜色size尺码style款式" prop="code">-->
<!--        <el-input-->
<!--          v-model="queryParams.code"-->
<!--          placeholder="请输入固定值color颜色size尺码style款式"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
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
          v-hasPermi="['goods:categoryAttribute:add']"
        >新增</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="success"-->
<!--          plain-->
<!--          icon="el-icon-edit"-->
<!--          size="mini"-->
<!--          :disabled="single"-->
<!--          @click="handleUpdate"-->
<!--          v-hasPermi="['goods:categoryAttribute:edit']"-->
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
<!--          v-hasPermi="['goods:categoryAttribute:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="categoryAttributeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="分类" align="center" prop="categoryId" >
        <template slot-scope="scope">
          {{queryParams.categoryName}}
        </template>
      </el-table-column>
      <el-table-column label="类型：0属性1规格" align="center" prop="type" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.type === 1" style="margin-bottom: 6px;">规格</el-tag>
          <el-tag v-if="scope.row.type === 0" style="margin-bottom: 6px;">属性</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="属性名" align="center" prop="title" />
<!--      <el-table-column label="固定值color颜色size尺码style款式" align="center" prop="code" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAttrValue(scope.row)"
            v-hasPermi="['goods:categoryAttribute:edit']"
          >属性值管理</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['goods:categoryAttribute:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['goods:categoryAttribute:remove']"
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

    <!-- 添加或修改商品分类属性对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
<!--        <el-form-item label="分类" prop="categoryId">-->
<!--          <el-input v-model="form.categoryId" placeholder="请输入分类id" />-->
<!--        </el-form-item>-->
        <el-form-item label="属性名" prop="title">
          <el-input v-model="form.title" placeholder="请输入属性名" />
        </el-form-item>
        <el-form-item label="类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择类型">
            <el-option value="0" label="属性"></el-option>
            <el-option value="1" label="规格"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="属性值类型" prop="code">
          <el-select v-model="form.code" placeholder="属性值类型">
            <el-option value="color" label="颜色"></el-option>
            <el-option value="size" label="尺码"></el-option>
            <el-option value="style" label="款式"></el-option>
          </el-select>
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
import { listCategoryAttribute, getCategoryAttribute, delCategoryAttribute, addCategoryAttribute, updateCategoryAttribute } from "@/api/goods/categoryAttribute";

export default {
  name: "CategoryAttribute",
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
      // 商品分类属性表格数据
      categoryAttributeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        categoryName: null,
        type: null,
        title: null,
        code: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: "分类id不能为空", trigger: "blur" }
        ],
        title: [{ required: true, message: "不能为空", trigger: "change" }],
        type: [
          { required: true, message: "类型：0属性1规格不能为空", trigger: "change" }
        ],
        code: [{ required: true, message: "不能为空", trigger: "change" }],
      }
    };
  },
  created() {
    if(this.$route.query.categoryId){
      this.queryParams.categoryId = this.$route.query.categoryId
      this.queryParams.categoryName = this.$route.query.categoryName
    }
    this.getList();
  },
  methods: {
    /** 查询商品分类属性列表 */
    getList() {
      this.loading = true;
      listCategoryAttribute(this.queryParams).then(response => {
        this.categoryAttributeList = response.rows;
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
        categoryId: null,
        type: null,
        title: null,
        code: null
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
    handleAttrValue(row){
      this.$router.push({path:'/goods/goods_category/attribute_value',query:{categoryAttributeId:row.id,categoryAttributeTitle:row.title}});
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加商品分类属性";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCategoryAttribute(id).then(response => {
        this.form = response.data;
        this.form.type = response.data.type+''
        this.open = true;
        this.title = "修改商品分类属性";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCategoryAttribute(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            if(this.$route.query.categoryId) {
              this.form.categoryId = this.$route.query.categoryId
              addCategoryAttribute(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除商品分类属性编号为"' + ids + '"的数据项？').then(function() {
        return delCategoryAttribute(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>
