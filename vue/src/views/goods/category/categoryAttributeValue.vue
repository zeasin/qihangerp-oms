<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="属性" prop="categoryAttributeTitle">
        <el-input
          v-model="queryParams.categoryAttributeTitle"
         readonly
        />
      </el-form-item>
<!--      <el-form-item label="属性值文本" prop="value">-->
<!--        <el-input-->
<!--          v-model="queryParams.value"-->
<!--          placeholder="请输入属性值文本"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="生成SKU的编码" prop="skuCode">-->
<!--        <el-input-->
<!--          v-model="queryParams.skuCode"-->
<!--          placeholder="请输入生成SKU的编码"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="排序" prop="orderNum">-->
<!--        <el-input-->
<!--          v-model="queryParams.orderNum"-->
<!--          placeholder="请输入排序"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="是否删除" prop="isDelete">-->
<!--        <el-input-->
<!--          v-model="queryParams.isDelete"-->
<!--          placeholder="请输入是否删除"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['goods:categoryAttributeValue:add']"
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
<!--          v-hasPermi="['goods:categoryAttributeValue:edit']"-->
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
<!--          v-hasPermi="['goods:categoryAttributeValue:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['goods:categoryAttributeValue:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="categoryAttributeValueList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="属性值id" align="center" prop="id" />
      <el-table-column label="属性id" align="center" prop="categoryAttributeId" />
      <el-table-column label="属性值文本" align="center" prop="value" />
      <el-table-column label="生成SKU的编码" align="center" prop="skuCode" />
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="是否删除" align="center" prop="isDelete" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isDelete === 1" style="margin-bottom: 6px;">是</el-tag>
          <el-tag v-if="scope.row.isDelete === 0" style="margin-bottom: 6px;">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['goods:categoryAttributeValue:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['goods:categoryAttributeValue:remove']"
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

    <!-- 添加或修改商品分类属性值对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="128px">
<!--        <el-form-item label="属性id" prop="categoryAttributeId">-->
<!--          <el-input v-model="form.categoryAttributeId" placeholder="请输入属性id" />-->
<!--        </el-form-item>-->
        <el-form-item label="属性值文本" prop="value">
          <el-input v-model="form.value" placeholder="请输入属性值文本" />
        </el-form-item>
        <el-form-item label="生成SKU的编码" prop="skuCode">
          <el-input v-model="form.skuCode" placeholder="请输入生成SKU的编码" />
        </el-form-item>
        <el-form-item label="排序" prop="orderNum">
          <el-input v-model="form.orderNum"  placeholder="请输入排序" />
        </el-form-item>
<!--        <el-form-item label="是否删除" prop="isDelete">-->
<!--          <el-input v-model="form.isDelete" placeholder="请输入是否删除" />-->
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
import { listCategoryAttributeValue, getCategoryAttributeValue, delCategoryAttributeValue, addCategoryAttributeValue, updateCategoryAttributeValue } from "@/api/goods/categoryAttributeValue";

export default {
  name: "CategoryAttributeValue",
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
      // 商品分类属性值表格数据
      categoryAttributeValueList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryAttributeId: null,
        value: null,
        skuCode: null,
        orderNum: null,
        isDelete: null
      },
      // 表单参数
      form: {
        orderNum:0
      },
      // 表单校验
      rules: {
        value: [{ required: true, message: "不能为空", trigger: "blur" }]
      }
    };
  },
  created() {
    if(this.$route.query.categoryAttributeId){
      this.queryParams.categoryAttributeId = this.$route.query.categoryAttributeId
      this.queryParams.categoryAttributeTitle = this.$route.query.categoryAttributeTitle
    }
    this.getList();
  },
  methods: {
    /** 查询商品分类属性值列表 */
    getList() {
      this.loading = true;
      listCategoryAttributeValue(this.queryParams).then(response => {
        this.categoryAttributeValueList = response.rows;
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
        categoryAttributeId: null,
        value: null,
        skuCode: null,
        orderNum: null,
        isDelete: null
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
      this.title = "添加商品分类属性值";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCategoryAttributeValue(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改商品分类属性值";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCategoryAttributeValue(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
             if(this.$route.query.categoryAttributeId) {
               this.form.categoryAttributeId = this.$route.query.categoryAttributeId
               this.form.isDelete = 0
               addCategoryAttributeValue(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除商品分类属性值编号为"' + ids + '"的数据项？').then(function() {
        return delCategoryAttributeValue(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('goods/categoryAttributeValue/export', {
        ...this.queryParams
      }, `categoryAttributeValue_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
