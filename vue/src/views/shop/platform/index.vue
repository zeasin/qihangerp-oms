<template>
  <div class="app-container">


    <el-row :gutter="10" class="mb8">

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shopList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="ID" align="center" prop="id" />
      <el-table-column label="平台" align="center" prop="name" />
       <el-table-column label="AppKey" align="center" prop="appKey" />
       <el-table-column label="AppSecret" align="center" prop="appSecret" />
       <el-table-column label="回调URL" align="center" prop="redirectUrl" />
      <el-table-column label="接口请求URL" align="center" prop="serverUrl" />
<!--      <el-table-column label="描述" align="center" prop="remark" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['shop:shop:edit']"
          >修改</el-button>

<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-location"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['shop:shop:edit']"-->
<!--          >省市区地址库</el-button>-->
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

    <!-- 添加或修改店铺对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="平台名" prop="name">
          <el-input v-model="form.name" placeholder="请输入平台名" />
        </el-form-item>
        <el-form-item label="AppKey" prop="appKey">
          <el-input v-model="form.appKey" placeholder="请输入AppKey" />
        </el-form-item>
        <el-form-item label="AppSecret" prop="appSecret">
          <el-input v-model="form.appSecret" placeholder="请输入AppSecret" />
        </el-form-item>
        <el-form-item label="回调URL" prop="redirectUrl">
          <el-input v-model="form.redirectUrl" placeholder="请输入回调URL" />
        </el-form-item>
        <el-form-item label="接口请求URL" prop="serverUrl">
          <el-input v-model="form.serverUrl" placeholder="请输入接口请求URL" />
        </el-form-item>

<!--        <el-form-item label="描述" prop="remark">-->
<!--          <el-input type="textarea" v-model="form.remark" placeholder="请输入描述" />-->
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
import {listPlatform, updatePlatform, getPlatform} from "@/api/shop/shop";

export default {
  name: "Shop",
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
      // 店铺表格数据
      shopList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      apiOpen: false,
      // 查询参数
      queryParams: {},
      // 表单参数
      form: {
        type:null
      },
      // 表单校验
      rules: {
        name: [{ required: true, message: "不能为空", trigger: "blur" }],
        code: [{ required: true, message: "不能为空", trigger: "blur" }],
        appKey: [{ required: true, message: "不能为空", trigger: "blur" }],
        appSecret: [{ required: true, message: "不能为空", trigger: "blur" }],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询店铺列表 */
    getList() {
      this.loading = true;
      listPlatform().then(response => {
        this.shopList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.apiOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        appkey: null,
        appSercet: null,
        remark: null,
        serverUrl: null,
        redirectUrl: null,
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
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPlatform(id).then(response => {
        this.form = response.data;
        this.$nextTick(()=>{
          this.form.platform = response.data.platform+'';
        })

        this.open = true;
        this.title = "修改";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePlatform(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.apiOpen = false
              this.getList();
            });
          }
        }
      });
    }
  }
};
</script>
