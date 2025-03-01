<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入店铺名"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['shop:shop:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['shop:shop:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['shop:shop:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shopList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="店铺ID" align="center" prop="id" />
      <el-table-column label="店铺名" align="center" prop="name" />
      <el-table-column label="店铺备注" align="center" prop="remark" />

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['shop:shop:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['shop:shop:remove']"
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

    <!-- 添加或修改店铺对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="店铺名" prop="name">
          <el-input v-model="form.name" placeholder="请输入店铺名" />
        </el-form-item>
<!--        <el-form-item label="店铺平台" prop="remark">-->
<!--          <el-input v-model="form.remark" placeholder="请输入店铺平台" />-->
<!--        </el-form-item>-->

        <el-form-item label="店铺备注" prop="remark">
          <el-input type="textarea" v-model="form.remark" placeholder="请输入描述" />
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
import { listShop, getShop, delShop, addShop, updateShop } from "@/api/offline/shop";

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
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null
      },
      // 表单参数
      form: {
      },
      // 获取token表单
      tokenForm:{
        shopId: null,
        shopType: null
      },
      // 表单校验
      rules: {
        name: [{ required: true, message: "店铺名不能为空", trigger: "blur" }],
        platform: [{ required: true, message: "请选择平台", trigger: "change" }],
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
      listShop(this.queryParams).then(response => {
        this.shopList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.apiOpen = false;
      this.authOpen = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
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
      this.title = "添加店铺";
    },
    handleUpdateToken(row){
     console.log("获取token",row)
      if(row.type === 2 || row.type === 5){
        getJdOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====jd ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.shopType = row.type
        })
      }else if(row.type ===1){
        getTaoOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====tao ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.shopType = row.type
        })
      }else if(row.type ===4){
        getOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====pdd ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.shopType = row.type
        })
      }

    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getShop(id).then(response => {
        this.form = response.data;
        this.$nextTick(()=>{
          this.form.type = response.data.type+'';
        })

        this.open = true;
        this.title = "修改店铺";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateShop(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.apiOpen = false
              this.getList();
            });
          } else {
            addShop(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    getTokenSubmit(){
      this.$refs["tokenForm"].validate(valid => {
        if (valid) {
          console.log("=====更新token=====",this.tokenForm)
          if(this.tokenForm.shopType === 2 || this.tokenForm.shopType === 5){
            getJdToken(this.tokenForm).then(response => {
              this.authOpen = false
              this.$modal.msgSuccess("授权成功");

            });
          }else if(this.tokenForm.shopType === 4){
            getPddToken(this.tokenForm).then(response => {
              this.authOpen = false
              this.$modal.msgSuccess("授权成功");

            });
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除店铺编号为"' + ids + '"的数据项？').then(function() {
        return delShop(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleGoodsList(row){
      console.log('=======商品list=====',row)
      if(row.type === 1){
        this.$router.push({path:'/shop/goods/tao_goods_list',query:{shopId:row.id}})
      }else if(row.type === 2){
        this.$router.push({path:'/shop/goods/jd_goods_list',query:{shopId:row.id}})
      }else if(row.type === 3){
        this.$router.push({path:'/shop/goods/dou_goods_list',query:{shopId:row.id}})
      }else if(row.type === 4){
        this.$router.push({path:'/shop/goods/pdd_goods_list',query:{shopId:row.id}})
      }
    },
    handleLogistics(row) {
      if(row.type === 1){
        this.$router.push({path:"/shop/logistics_companies",query:{id:row.type}})
      }else  if(row.type === 2){
        this.$router.push({path:"/shop/logistics_companies",query:{id:row.type,shopId:row.id}})
      } else  if(row.type === 3){
        this.$router.push({path:"/shop/logistics_companies",query:{id:row.type,shopId:row.id}})
      } else  if(row.type === 4){
        this.$router.push({path:"/shop/logistics_companies",query:{id:row.type,shopId:row.id}})
      }
    }
  }
};
</script>
