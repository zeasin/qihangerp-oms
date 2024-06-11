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
       <el-form-item label="平台" prop="platform">
        <el-select v-model="queryParams.platform" placeholder="请选择平台" clearable>
         <el-option
            v-for="item in typeList"
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
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['shop:shop:add']"
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
<!--          v-hasPermi="['shop:shop:edit']"-->
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
<!--          v-hasPermi="['shop:shop:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="warning"-->
<!--          plain-->
<!--          icon="el-icon-download"-->
<!--          size="mini"-->
<!--          @click="handleExport"-->
<!--          v-hasPermi="['shop:shop:export']"-->
<!--        >导出</el-button>-->
<!--      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shopList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="店铺ID" align="center" prop="id" />
      <el-table-column label="店铺名" align="center" prop="name" />
      <!-- <el-table-column label="店铺别名" align="center" prop="nickName" /> -->
      <!-- <el-table-column label="标识" align="center" prop="ename" /> -->
      <!-- <el-table-column label="店铺主体" align="center" prop="company" /> -->
      <el-table-column label="平台" align="center" prop="platform" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.platform === 1">1688</el-tag>
          <el-tag v-if="scope.row.platform === 2">视频号小店</el-tag>
          <el-tag v-if="scope.row.platform === 3">京东</el-tag>
          <el-tag v-if="scope.row.platform === 4">淘系店铺</el-tag>
          <el-tag v-if="scope.row.platform === 5">拼多多</el-tag>
          <el-tag v-if="scope.row.platform === 6">抖店</el-tag>
          <el-tag v-if="scope.row.platform === 7">小红书</el-tag>
          <el-tag v-if="scope.row.platform === 8">快手小店</el-tag>
          <el-tag v-if="scope.row.platform === 99">其他</el-tag>
        </template>
      </el-table-column>
      <!-- <el-table-column label="店铺url" align="center" prop="url" /> -->
      <!-- <el-table-column label="排序" align="center" prop="orderNum" /> -->
      <!-- <el-table-column label="是否删除0否1是" align="center" prop="isDelete" /> -->
      <!-- <el-table-column label="是否显示(0：是1否）" align="center" prop="isShow" /> -->
      <!-- <el-table-column label="更新时间" align="center" prop="modifyOn" /> -->
      <el-table-column label="描述" align="center" prop="remark" />
      <!-- <el-table-column label="第三方平台店铺id，淘宝天猫开放平台使用" align="center" prop="sellerUserId" /> -->
      <!-- <el-table-column label="卖家userId" align="center" prop="sellerUserIdStr" /> -->
       <el-table-column label="AccessToken" align="center" prop="accessToken" />
      <!-- <el-table-column label="Appkey暂时抖音用" align="center" prop="appkey" /> -->
      <!-- <el-table-column label="Appsercet暂时抖音用" align="center" prop="appSercet" /> -->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row>
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
          </el-row>
          <el-button
            v-if="scope.row.platform !== 99"
            type="success"
            plain
            icon="el-icon-refresh"
            size="mini"
            @click="handleUpdateToken(scope.row)"
          >更新AccessToken</el-button>


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
      <el-form ref="form" :model="form" :rules="rules" label-width="128px">
        <el-form-item label="店铺名" prop="name">
          <el-input v-model="form.name" placeholder="请输入店铺名" />
        </el-form-item>
        <el-form-item label="平台" prop="platform">
          <el-select v-model="form.platform" placeholder="请选择店铺平台">
           <el-option
              v-for="item in typeList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="店铺别名" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入店铺别名" />
        </el-form-item>
        <el-form-item label="平台店铺ID" prop="sellerShopId">
          <el-input v-model="form.sellerShopId" placeholder="请输入平台ShopId" />
        </el-form-item>
        <el-form-item label="视频号appKey" prop="appKey" v-if="form.platform === 2">
          <el-input v-model="form.appKey" placeholder="请输入视频号appKey" />
        </el-form-item>
        <el-form-item label="视频号appSercet" prop="appSercet" v-if="form.platform === 2">
          <el-input v-model="form.appSercet" placeholder="请输入视频号appSercet" />
        </el-form-item>
        <el-form-item label="AccessToken" prop="accessToken" >
          <el-input v-model="form.accessToken" type="textarea" placeholder="请输入accessToken" />
        </el-form-item>

        <el-form-item label="描述" prop="remark">
          <el-input type="textarea" v-model="form.remark" placeholder="请输入描述" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <el-dialog :title="title" :visible.sync="authOpen" width="500px" append-to-body>
      <el-form ref="tokenForm" :model="tokenForm"  :rules="rules" label-width="80px">
        <el-descriptions >
          <el-descriptions-item label="授权URL："> {{ tokenForm.url }}</el-descriptions-item>
        </el-descriptions>
        <div slot="footer" class="dialog-footer">
          请手动复制上面的URL到浏览器中访问
        </div>
        <el-form-item label="code" prop="code">
          <el-input type="textarea" v-model="tokenForm.code" placeholder="请把授权后的code复制到这里" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="getTokenSubmit">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
      <!--      <div slot="footer" class="dialog-footer">-->
      <!--        请手动复制上面的URL到浏览器中访问-->
      <!--      </div>-->
    </el-dialog>
  </div>
</template>

<script>
import {listShop, getShop, delShop, addShop, updateShop, listPlatform} from "@/api/shop/shop";
import {getJdOAuthUrl, getJdToken} from "@/api/jd/shop";
import {getTaoOAuthUrl, getTaoToken} from "@/api/tao/shop";
import {float} from "quill/ui/icons";
import {getPddOAuthUrl,getPddToken} from "@/api/pdd/shop";
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
      typeList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      apiOpen: false,
      authOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        platform: null
      },
      // 表单参数
      form: {
        platform:null
      },
      // 获取token表单
      tokenForm:{
        shopId: null,
        shopType: null
      },
      // 表单校验
      rules: {
        name: [
          { required: true, message: "店铺名不能为空", trigger: "blur" }
        ],
        platform: [{ required: true, message: "请选择平台", trigger: "change" }],
        sellerShopId: [{ required: true, message: "不能为空", trigger: "change" }],
        code: [{ required: true, message: "不能为空", trigger: "change" }],

      }
    };
  },
  created() {
    listPlatform().then(res=>{
      this.typeList = res.rows;
      if(this.$route.query.platform){
        this.queryParams.platform = parseInt(this.$route.query.platform)
      }
      this.getList();
    })


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
      this.authOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        nickName: null,
        ename: null,
        company: null,
        type: null,
        url: null,
        orderNum: null,
        isDelete: null,
        isShow: null,
        modifyOn: null,
        remark: null,
        sellerUserId: null,
        sellerUserIdStr: null,
        sessionKey: null,
        appkey: null,
        appSercet: null
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
    handleUpdateToken(row){
      console.log("获取token",row)
      if(row.platform === 2){
        this.$modal.msgSuccess("视频号小店后台会自动获取token，无需手动授权！");
      }
      if(row.platform === 3){
        getJdOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====jd ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.platform = row.platform
        })
      }else if(row.platform === 4){
        getTaoOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====tao ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.platform = row.platform
        })
      }else if(row.platform ===5){
        getPddOAuthUrl({shopId:row.id}).then(response => {
          console.log("获取token=====pdd ",response)
          this.authOpen = true;
          this.title = "更新店铺授权";
          this.tokenForm.url = response.data
          this.tokenForm.shopId = row.id
          this.tokenForm.platform = row.platform
        })
      }else if(row.platform === 6){
        this.$modal.msgSuccess("抖店后台会自动获取token，无需手动授权！");
      }else if(row.platform === 7){
        this.$modal.msgError("还未实现小红书接入！敬请期待！");
      }else if(row.platform === 8){
        this.$modal.msgError("还未实现快手小店接入！敬请期待！");
      }

    },
    getTokenSubmit(){
      this.$refs["tokenForm"].validate(valid => {
        if (valid) {
          console.log("=====更新token=====",this.tokenForm)
          if(this.tokenForm.platform === 3){
            getJdToken(this.tokenForm).then(response => {
              this.authOpen = false
              this.$modal.msgSuccess("授权成功");

            });
          }else if(this.tokenForm.platform === 4){
            getTaoToken(this.tokenForm).then(response => {
              this.authOpen = false
              this.$modal.msgSuccess("授权成功");

            });
          }
        }
      })
    },
  }
};
</script>
