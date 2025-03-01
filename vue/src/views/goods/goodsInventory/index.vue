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
      <el-form-item label="商品编码" prop="goodsNum">
        <el-input
          v-model="queryParams.goodsNum"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Sku Id" prop="specId">
        <el-input
          v-model="queryParams.skuId"
          placeholder="请输入商品SkuId"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Sku编码" prop="skuCode">
        <el-input
          v-model="queryParams.skuCode"
          placeholder="请输入Sku编码"
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
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['api:goodsInventory:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goodsInventoryList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
<!--      <el-table-column label="主键ID" align="center" prop="id" />-->
      <el-table-column label="商品ID" align="center" prop="goodsId" />
      <el-table-column label="商品编码" align="center" prop="goodsNum" />
      <el-table-column label="SkuId" align="center" prop="skuId" />
      <el-table-column label="Sku编码" align="center" prop="skuCode" />
      <el-table-column label="当前库存" align="center" prop="quantity" />
      <el-table-column label="锁定库存" align="center" prop="lockedQty" />
      <el-table-column label="状态" align="center" prop="isDelete" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.isDelete==0">生效中</el-tag>
          <el-tag size="small" v-if="scope.row.isDelete==1">已删除</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>

      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime) }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['api:goodsInventory:edit']"
          >库存详情</el-button>
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

    <!-- 添加或修改商品库存对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-table :data="erpGoodsInventoryDetailList" :row-class-name="rowErpGoodsInventoryDetailIndex" ref="erpGoodsInventoryDetail">
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="入库时间" prop="createTime" width="180"></el-table-column>
          <el-table-column label="入库数量" prop="inQty" width="80">
          </el-table-column>
          <el-table-column label="入库仓位id" prop="inLocation" width="100"></el-table-column>
          <el-table-column label="入库前数量" prop="originQty" width="100">
          </el-table-column>
          <el-table-column label="当前库存" prop="currentQty" width="100">
          </el-table-column>
          <el-table-column label="备注" prop="remark" width="150">
          </el-table-column>
          <el-table-column label="操作人" prop="createBy" width="150">
          </el-table-column>
        </el-table>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { listGoodsInventory, getGoodsInventory } from "@/api/goods/goodsInventory";

export default {
  name: "GoodsInventory",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedErpGoodsInventoryDetail: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 商品库存表格数据
      goodsInventoryList: [],
      // 商品库存明细表格数据
      erpGoodsInventoryDetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        goodsId: null,
        goodsNumber: null,
        specId: null,
        specNumber: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        goodsId: [
          { required: true, message: "商品id不能为空", trigger: "blur" }
        ],
        specId: [
          { required: true, message: "商品规格id不能为空", trigger: "blur" }
        ],
        specNumber: [
          { required: true, message: "规格编码不能为空", trigger: "blur" }
        ],
        currentQty: [
          { required: true, message: "当前库存不能为空", trigger: "blur" }
        ],
        lockedQty: [
          { required: true, message: "锁定库存不能为空", trigger: "blur" }
        ],
        isDelete: [
          { required: true, message: "0正常  1删除不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "更新时间不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询商品库存列表 */
    getList() {
      this.loading = true;
      listGoodsInventory(this.queryParams).then(response => {
        this.goodsInventoryList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        goodsId: null,
        goodsNumber: null,
        specId: null,
        specNumber: null,
        currentQty: null,
        lockedQty: null,
        isDelete: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        updateBy: null
      };
      this.erpGoodsInventoryDetailList = [];
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
      getGoodsInventory(id).then(response => {
        this.form = response.data;
        this.erpGoodsInventoryDetailList = response.data;
        this.open = true;
        this.title = "商品库存详情";
      });
    },
	/** 商品库存明细序号 */
    rowErpGoodsInventoryDetailIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },

    /** 导出按钮操作 */
    handleExport() {
      this.download('api/goodsInventory/export', {
        ...this.queryParams
      }, `goodsInventory_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
