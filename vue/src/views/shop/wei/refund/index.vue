<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" placeholder="请选择店铺" clearable @change="handleQuery">
          <el-option
            v-for="item in shopList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="退款单号" prop="refundId">
        <el-input
          v-model="queryParams.refundId"
          placeholder="请输入退款单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单号" prop="tid">
        <el-input
          v-model="queryParams.tid"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

<!--      <el-form-item label="申请时间" prop="created">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.created"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="请选择退款申请时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->

<!--      <el-form-item label="物流单号" prop="logisticsCode">-->
<!--        <el-input-->
<!--          v-model="queryParams.logisticsCode"-->
<!--          placeholder="请输入物流单号"-->
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
          :loading="pullLoading"
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
        >API拉取新退款</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-refresh"
          size="mini"
          :disabled="multiple"
          @click="handlePushOms"
        >手动推送售后</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="taoRefundList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="${comment}" align="center" prop="id" /> -->
      <el-table-column label="退款单号" align="center" prop="afterSaleOrderId" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="type" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.type === 'REFUND'"> 退款</el-tag>
          <el-tag size="small" v-if="scope.row.type === 'RETURN'"> 退货退款</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="订单号" align="center" prop="orderId" />
      <el-table-column label="退货数量" align="center" prop="count" />
       <el-table-column label="商品skuId" align="center" prop="skuId" />

      <el-table-column label="退款金额" align="center" prop="refundAmount" >
        <template slot-scope="scope">
          <span>{{ scope.row.refundAmount/100 }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="退款原因" align="center" prop="reasonText" />
<!--       <el-table-column label="说明" align="center" prop="details" />-->
      <el-table-column label="退货物流" align="center" prop="returnWaybillId" />
       <el-table-column label="状态" align="center" prop="status" >
         <template slot-scope="scope">
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_RETURN_SUCCESS'"> 退货退款完成</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_REFUND_SUCCESS'"> 退款完成</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'USER_CANCELD'"> 用户取消申请</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_PROCESSING'"> 商家受理中</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_REJECT_REFUND'">商家拒绝退款</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_REJECT_RETURN'">商家拒绝退货退款</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'USER_WAIT_RETURN'">待买家退货</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'RETURN_CLOSED'">退货退款关闭</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_WAIT_RECEIPT'">待商家收货</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_OVERDUE_REFUND'">商家逾期未退款</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'PLATFORM_REFUNDING'">平台退款中</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'PLATFORM_REFUND_FAIL'">平台退款失败</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'USER_WAIT_CONFIRM'">待用户确认</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_REFUND_RETRY_FAIL'">商家打款失败，客服关闭售后</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'MERCHANT_FAIL'">售后关闭</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'USER_WAIT_CONFIRM_UPDATE'">待用户处理商家协商</el-tag>
           <el-tag size="small" v-if="scope.row.status === 'USER_WAIT_HANDLE_MERCHANT_AFTER_SALE'">待用户处理商家代发起的售后申请</el-tag>
           <br/>
           <el-tag size="small" style="margin-top: 5px" v-if="scope.row.type === 'RETURN' && scope.row.confirmStatus === 9">已签收</el-tag>
         </template>
       </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">

            <el-button
              v-if="scope.row.type === 'RETURN' && !scope.row.confirmStatus"
              size="mini"
              type="text"
              icon="el-icon-document-checked"
              @click="handleReturnedConfirm(scope.row) "
            >退货签收</el-button>
            <el-button
              v-if="scope.row.type === 'REFUND' && !scope.row.confirmStatus"
              size="mini"
              type="text"
              icon="el-icon-connection"
              @click="handleOrderIntercept(scope.row) "
            >订单拦截</el-button>

          <el-row>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-refresh"
            @click="handleConfirm(scope.row)"
            v-hasPermi="['tao:taoRefund:edit']"
          >更新</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDelete(scope.row)"
          >详情</el-button>
          </el-row>
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

    <!-- 添加或修改淘宝退款订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="退款ID" prop="refundId">
          <el-input v-model="form.refundId" placeholder="请输入退款id" disabled/>
        </el-form-item>
        <el-form-item label="订单单号" prop="tid">
          <el-input v-model="form.tid" placeholder="请输入淘宝交易单号" disabled/>
        </el-form-item>
        <el-form-item label="退还金额" prop="refundFee">
          <el-input v-model="form.refundFee" placeholder="请输入退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分" disabled/>
        </el-form-item>
        <el-form-item label="sku编号" prop="specNumber">
          <el-input v-model="form.specNumber" placeholder="请输入sku编号" />
        </el-form-item>
        <el-form-item label="退货数量" prop="num">
          <el-input v-model="form.num" placeholder="请输入退货数量" disabled/>
        </el-form-item>
        <el-form-item label="物流公司" prop="logisticsCompany">
          <el-input v-model="form.logisticsCompany" placeholder="请输入物流公司" />
        </el-form-item>
        <el-form-item label="物流单号" prop="logisticsCode">
          <el-input v-model="form.logisticsCode" placeholder="请输入物流单号" />
        </el-form-item>
        <el-form-item label="发货时间" prop="sendTime">
          <el-date-picker clearable
            v-model="form.sendTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择发货时间">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
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
import { listShop } from "@/api/shop/shop";
import {MessageBox} from "element-ui";
import {isRelogin} from "@/utils/request";
import {listShopRefund, orderIntercept, pullRefund, returnedConfirm} from "@/api/wei/refund";
import {pushOms} from "@/api/tao/taoRefund";
export default {
  name: "RefundWei",
  data() {
    return {
      // 遮罩层
      loading: true,
      pullLoading: false,
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
      // 淘宝退款订单表格数据
      taoRefundList: [],
      shopList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        refundId: null,
        afterSalesType: null,
        tid: null,
        oid: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        num: [
          { required: true, message: "退货数量不能为空", trigger: "blur" }
        ],
        logisticsCompany: [
          { required: true, message: "不能为空", trigger: "change" }
        ],
        logisticsCode: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
        sendTime: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listShop({platform: 2}).then(response => {
      this.shopList = response.rows;
      if (this.shopList && this.shopList.length > 0) {
        this.queryParams.shopId = this.shopList[0].id
      }
      this.getList();
    });
  },
  methods: {
    /** 查询淘宝退款订单列表 */
    getList() {
      this.loading = true;
      listShopRefund(this.queryParams).then(response => {
        this.taoRefundList = response.rows;
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
        refundId: null
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
      this.ids = selection.map(item => item.afterSaleOrderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handlePushOms(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否手动推送到OMS？').then(function() {
        return pushOms({ids:ids});
      }).then(() => {
        // this.getList();
        this.$modal.msgSuccess("推送成功");
      }).catch(() => {});
    },
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullRefund({shopId:this.queryParams.shopId,updType:0}).then(response => {
          console.log('拉取退款接口返回=====',response)
          if(response.code === 1401) {
            MessageBox.confirm('Token已过期，需要重新授权', '系统提示', { confirmButtonText: '重新授权', cancelButtonText: '取消', type: 'warning' }).then(() => {
              isRelogin.show = false;
              // store.dispatch('LogOut').then(() => {
              location.href = response.data.tokenRequestUrl+'?shopId='+this.queryParams.shopId
              // })
            }).catch(() => {
              isRelogin.show = false;
            });

            // return Promise.reject('无效的会话，或者会话已过期，请重新登录。')
          }else{
            this.getList()
            this.$modal.msgSuccess(JSON.stringify(response));
            this.pullLoading = false
          }

        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    handleReturnedConfirm(row){
      returnedConfirm(row.id).then(response => {
        this.$modal.msgSuccess("签收完成");
        this.getList()
      });
    },
    handleOrderIntercept(row){
      orderIntercept(row.id).then(response => {
        this.$modal.msgSuccess("拦截成功");
        this.getList()
      });
    },
    submitForm(){

    }
  }

};
</script>
