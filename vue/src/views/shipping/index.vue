<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺" prop="name">
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
          <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
            <span style="float: left">{{ item.name }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">淘宝天猫</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">京东</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">抖店</span>
            <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">拼多多</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="订单号" prop="orderNum">
        <el-input
          v-model="queryParams.orderNum"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="快递单号" prop="shipCode">
        <el-input
          v-model="queryParams.shipCode"
          placeholder="请输入快递单号"
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
          icon="el-icon-download"
          size="mini"
          @click="handleShipping"
        >手动发货</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleShippingLog"
        >ERP发货推送记录</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dataList" >
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="订单编号" align="center" prop="orderNum" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="shipType;" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.shipType === 1">订单发货</el-tag>
          <el-tag size="small" v-if="scope.row.shipType === 2">商品补发</el-tag>
          <el-tag size="small" v-if="scope.row.shipType === 3">商品换货</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="快递公司" align="center" prop="shipCompany" />
       <el-table-column label="快递单号" align="center" prop="shipCode" />
       <el-table-column label="备注" align="center" prop="remark" />
       <el-table-column label="发货时间" align="center" prop="createTime" >
         <template slot-scope="scope">
           <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
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
    <!-- 对话框 -->
    <el-dialog title="手动发货" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="店铺" prop="shopId">
          <el-select v-model="form.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
            <el-option
              v-for="item in shopList"
              :key="item.id"
              :label="item.name"
              :value="item.id">
              <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 1">淘宝天猫</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 2">京东</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 3">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">拼多多</span>
            </el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="订单号" prop="orderNum">
          <el-input v-model="form.orderNum" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="快递公司" prop="shipCompany">
          <el-select v-model="form.shipCompany" placeholder="请选择快递公司" clearable @change="handleQuery">
            <el-option
              v-for="item in logisticsList"
              :key="item.id"
              :label="item.name"
              :value="item.code">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="快递单号" prop="shipCode">
          <el-input v-model="form.shipCode" placeholder="请输入快递单号" />
        </el-form-item>
        <el-form-item label="快递费用" prop="shipFee">
          <el-input v-model="form.shipFee" placeholder="请输入快递费用" />
        </el-form-item>
        <el-form-item label="发货人" prop="shipOperator">
          <el-input v-model="form.shipOperator" placeholder="请输入发货人" />
        </el-form-item>
        <el-form-item label="包裹重量" prop="packageWeight">
          <el-input v-model="form.packageWeight" placeholder="请输入包裹重量" />
        </el-form-item>
        <el-form-item label="包裹长度" prop="packageLength">
          <el-input v-model="form.packageLength" placeholder="包裹长度" />
        </el-form-item>
        <el-form-item label="包裹宽度" prop="packageWidth">
          <el-input v-model="form.width" placeholder="请输入包裹宽度" />
        </el-form-item>
        <el-form-item label="包裹高度" prop="packageHeight">
          <el-input v-model="form.height" placeholder="请输入包裹高度" />
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
import {listLogistics, listLogisticsStatus, listShop} from "@/api/shop/shop";
import {MessageBox} from "element-ui";
import {handShip, listShipping} from "@/api/api/shipping";

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
      logisticsList: [],
      shopList: [],
      dataList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      apiOpen: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNum:null,
        shipCode:null,
        shopId:null
      },
      // 表单参数
      form: {
      },
      // 表单校验
      rules: {
        shopId: [{ required: true, message: "不能为空", trigger: "blur" }],
        orderNum: [{ required: true, message: "不能为空", trigger: "blur" }],
        shipCompany: [{ required: true, message: "不能为空", trigger: "blur" }],
        shipCode: [{ required: true, message: "不能为空", trigger: "blur" }],
      }
    };
  },
  created() {
    listShop({}).then(response => {
      this.shopList = response.rows;
    });
    listLogisticsStatus({status:1}).then(response => {
      this.logisticsList = response.rows;
    });
    this.getList();
  },
  mounted() {
  },
  methods: {
    /** 查询店铺列表 */
    getList() {
      this.loading = true;
      listShipping(this.queryParams).then(response => {
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
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {};
      this.resetForm("form");
    },
    handleShipping() {
      this.open = true
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          handShip(this.form).then(response => {
            this.$modal.msgSuccess("发货成功");
            this.open = false;
            this.getList();
          });

        }
      });
    },
  }
};
</script>
