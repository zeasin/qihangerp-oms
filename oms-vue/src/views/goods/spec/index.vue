<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="商品ID" prop="goodsId">
        <el-input
          v-model="queryParams.goodsId"
          placeholder="请输入商品ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="规格编码" prop="specNum">
        <el-input
          v-model="queryParams.specNum"
          placeholder="请输入规格编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="条形码" prop="barCode">
        <el-input
          v-model="queryParams.barCode"
          placeholder="请输入条形码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

<!--      <el-form-item label="0启用   1禁用" prop="disable">-->
<!--        <el-input-->
<!--          v-model="queryParams.disable"-->
<!--          placeholder="请输入0启用   1禁用"-->
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
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['api:goodsSpec:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsSpecList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="商品ID" align="center" prop="goodsId" />
<!--      <el-table-column label="规格名" align="center" prop="specName" />-->
      <el-table-column label="规格编码" align="center" prop="specNum" />
<!--      <el-table-column label="颜色id" align="center" prop="colorId" />-->
      <el-table-column label="颜色值" align="center" prop="colorValue" />
      <el-table-column label="颜色图片" align="center" prop="colorImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.colorImage" :width="50" :height="50"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="尺码id" align="center" prop="sizeId" />-->
      <el-table-column label="尺码值" align="center" prop="sizeValue" />
<!--      <el-table-column label="款式id" align="center" prop="styleId" />-->
      <el-table-column label="款式值" align="center" prop="styleValue" />
      <el-table-column label="库存条形码" align="center" prop="barCode" />
      <el-table-column label="预计采购价" align="center" prop="purPrice" />
      <el-table-column label="建议批发价" align="center" prop="wholePrice" />
      <el-table-column label="建议零售价" align="center" prop="retailPrice" />
      <el-table-column label="单位成本" align="center" prop="unitCost" />
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status===1">上架中</el-tag>
          <el-tag size="small" v-if="scope.row.status===2">已下架</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="最低库存" align="center" prop="lowQty" />-->
<!--      <el-table-column label="最高库存" align="center" prop="highQty" />-->
<!--      <el-table-column label="0启用   1禁用" align="center" prop="disable" />-->
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
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="商品id" prop="goodsId">-->
<!--          <el-input v-model="form.goodsId" placeholder="请输入商品id" />-->
<!--        </el-form-item>-->
        <el-form-item label="规格名" prop="specName">
          <el-input v-model="form.specName" placeholder="请输入规格名" />
        </el-form-item>
        <el-form-item label="规格编码" prop="specNum">
          <el-input v-model="form.specNum" placeholder="请输入规格编码" />
        </el-form-item>
<!--        <el-form-item label="颜色id" prop="colorId">-->
<!--          <el-input v-model="form.colorId" placeholder="请输入颜色id" />-->
<!--        </el-form-item>-->
        <el-form-item label="颜色" prop="colorValue">
          <el-input v-model="form.colorValue" placeholder="请输入颜色值" />
        </el-form-item>
        <el-form-item label="图片" prop="colorImage">
          <image-upload v-model="form.colorImage" :limit="1" />
        </el-form-item>
<!--        <el-form-item label="尺码id" prop="sizeId">-->
<!--          <el-input v-model="form.sizeId" placeholder="请输入尺码id" />-->
<!--        </el-form-item>-->
        <el-form-item label="尺码" prop="sizeValue">
          <el-input v-model="form.sizeValue" placeholder="请输入尺码值" />
        </el-form-item>
<!--        <el-form-item label="款式id" prop="styleId">-->
<!--          <el-input v-model="form.styleId" placeholder="请输入款式id" />-->
<!--        </el-form-item>-->
        <el-form-item label="款式" prop="styleValue">
          <el-input v-model="form.styleValue" placeholder="请输入款式值" />
        </el-form-item>
        <el-form-item label="库存条形码" prop="barCode">
          <el-input v-model="form.barCode" placeholder="请输入库存条形码" />
        </el-form-item>
        <el-form-item label="预计采购价" prop="purPrice">
          <el-input v-model="form.purPrice" placeholder="请输入预计采购价" />
        </el-form-item>
        <el-form-item label="建议批发价" prop="wholePrice">
          <el-input v-model="form.wholePrice" placeholder="请输入建议批发价" />
        </el-form-item>
        <el-form-item label="建议零售价" prop="retailPrice">
          <el-input v-model="form.retailPrice" placeholder="请输入建议零售价" />
        </el-form-item>
        <el-form-item label="单位成本" prop="unitCost">
          <el-input v-model="form.unitCost" placeholder="请输入单位成本" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入备注" />
        </el-form-item>
<!--        <el-form-item label="最低库存" prop="lowQty">-->
<!--          <el-input v-model="form.lowQty" placeholder="请输入最低库存" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="最高库存" prop="highQty">-->
<!--          <el-input v-model="form.highQty" placeholder="请输入最高库存" />-->
<!--        </el-form-item>-->
        <el-form-item label="启用禁用" prop="disable">
          <el-select v-model="form.disable"  placeholder="启用禁用">
            <el-option label="启用" value="0"></el-option>
            <el-option label="禁用" value="1"></el-option>
          </el-select>
<!--          <el-input v-model="form.disable" placeholder="请输入0启用   1禁用" />-->
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
import { listGoodsSpec, getGoodsSpec, updateGoodsSpec } from "@/api/goods/goodsSpec";

export default {
  name: "GoodsSpec",
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
        goodsId: null,
        specName: null,
        specNum: null,
        colorId: null,
        colorValue: null,
        colorImage: null,
        sizeId: null,
        sizeValue: null,
        styleId: null,
        styleValue: null,
        barCode: null,
        purPrice: null,
        wholePrice: null,
        retailPrice: null,
        unitCost: null,
        status: null,
        lowQty: null,
        highQty: null,
        disable: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        goodsId: [
          { required: true, message: "商品id不能为空", trigger: "blur" }
        ],
        specNum: [
          { required: true, message: "规格编码不能为空", trigger: "blur" }
        ],
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
        specName: null,
        specNum: null,
        colorId: null,
        colorValue: null,
        colorImage: null,
        sizeId: null,
        sizeValue: null,
        styleId: null,
        styleValue: null,
        barCode: null,
        purPrice: null,
        wholePrice: null,
        retailPrice: null,
        unitCost: null,
        remark: null,
        status: null,
        lowQty: null,
        highQty: null,
        disable: null
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
          }
        }
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('api/goodsSpec/export', {
        ...this.queryParams
      }, `goodsSpec_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
