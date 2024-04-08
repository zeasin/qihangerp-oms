<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="店铺名" prop="name">-->
<!--        <el-input-->
<!--          v-model="queryParams.name"-->
<!--          placeholder="请输入店铺名"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
      <el-form-item label="平台" prop="type">
        <el-select v-model="queryParams.id" placeholder="请选择平台" clearable>
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
          type="danger"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
        >API拉取快递公司数据</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" >
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="id" align="center" prop="logisticsId" />
      <el-table-column label="快递公司" align="center" prop="name" />
       <el-table-column label="编码" align="center" prop="code" />
       <el-table-column label="备注" align="center" prop="remark" />
       <el-table-column label="状态" align="center" prop="status" >
         <template slot-scope="scope">
           <el-tag size="small" v-if="scope.row.status === 0 || !scope.row.status"> 未启用</el-tag>
           <el-tag size="small" v-if="scope.row.status === 1"> 启用</el-tag>
         </template>
       </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            v-if="scope.row.status === 0 || !scope.row.status"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdateStatus(scope.row)"
          >开启</el-button>
          <el-button
            size="mini"
            v-if="scope.row.status === 1"
            type="text"
            icon="el-icon-delete"
            @click="handleUpdateStatus(scope.row)"
          >关闭</el-button>
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

  </div>
</template>

<script>
import {listLogistics, updateStatus} from "@/api/shop/shop";
import {MessageBox} from "element-ui";
import {isRelogin} from "@/utils/request";
import {pullLogisticsTao,pullLogisticsJd} from "@/api/tao/shop_api";

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
      dataList:[],
      typeList: [
        {name:"天猫", id:"1"},
        {name:"京东", id:"2"},
        {name:"抖店", id:"3"},
        {name:"拼多多", id:"4"},
      ],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      apiOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id:null,
        shopId:null
      },
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

  },
  mounted() {
    if(this.$route.query.id){
      this.queryParams.id = this.$route.query.id+""
    }
    if(this.$route.query.shopId){
      this.queryParams.shopId = this.$route.query.shopId+""
    }
    this.getList();
  },
  methods: {
    /** 查询店铺列表 */
    getList() {
      this.loading = true;

      listLogistics(this.queryParams).then(response => {
        this.dataList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
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
    handlePull() {
      console.log('=====拉取快递公司=====',this.$route.query.id)
      if(this.$route.query.id === '1') {
        pullLogisticsTao({}).then(response => {
          console.log('拉取TAO接口返回=====', response)
          if (response.code === 1401) {
            MessageBox.confirm('Token已过期，需要重新授权', '系统提示', {
              confirmButtonText: '重新授权',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              isRelogin.show = false;
              // store.dispatch('LogOut').then(() => {
              location.href = response.data.tokenRequestUrl + '?shopId=' + this.queryParams.shopId
              // })
            }).catch(() => {
              isRelogin.show = false;
            });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          } else
            this.$modal.msgSuccess(JSON.stringify(response));
        })
      } else if(this.$route.query.id === '2'){
        console.log('=====aaaaa=====')
        //jd
        pullLogisticsJd({shopId:this.$route.query.shopId}).then(response => {
          console.log('拉取JD接口返回=====', response)
          if (response.code === 1401) {
            MessageBox.confirm('Token已过期，需要重新授权', '系统提示', {
              confirmButtonText: '重新授权',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              isRelogin.show = false;
              // store.dispatch('LogOut').then(() => {
              location.href = response.data.tokenRequestUrl + '?shopId=' + this.queryParams.shopId
              // })
            }).catch(() => {
              isRelogin.show = false;
            });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          } else
            this.$modal.msgSuccess(JSON.stringify(response));
        })
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    handleUpdateStatus(row){
      updateStatus({id:row.id,status:row.status}).then(response => {
        console.log('更新状态====',response)
        this.getList()
      })
    }
  }
};
</script>
