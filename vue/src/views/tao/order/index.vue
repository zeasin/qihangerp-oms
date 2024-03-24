<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="tid">
        <el-input
          v-model="queryParams.tid"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
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

<!--      <el-form-item label="下单日期" prop="orderCreateTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.orderCreateTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="请选择订单创建时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="订单状态" prop="statusStr">-->
<!--        <el-input-->
<!--          v-model="queryParams.statusStr"-->
<!--          placeholder="请输入订单状态"-->
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
        >API拉取订单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-refresh"
          size="mini"
          :disabled="multiple"
          @click="handlePushOms"
        >手动将选中订单推送到OMS</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单号" align="center" prop="tid" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.items" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.picPath"></el-image>
              <div style="margin-left:10px">
              <p>{{item.title}}</p>
              <p>{{item.skuPropertiesName}}&nbsp;
                <el-tag size="small">x {{item.num}}</el-tag>
                </p>
                <p v-if="scope.row.refundStatus === 0">
                  <el-button type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="总金额" align="center" prop="payment" />
      <el-table-column label="订单创建时间" align="center" prop="orderCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.created, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="买家留言" align="center" prop="buyerMessage" />
      <el-table-column label="卖家备注" align="center" prop="sellerMemo" />
      <el-table-column label="订单状态" align="center" prop="status" />
      <el-table-column label="快递单号" align="center" prop="logisticsCode" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="success"
            icon="el-icon-success"
            @click="handlePullUpdate(scope.row)"
          >更新订单</el-button>
          <div>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['tao:order:remove']"
          >详情</el-button>
          </div>
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

    <!-- 订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body>

      <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>
        <el-descriptions title="订单信息">
            <el-descriptions-item label="订单号">{{form.id}}</el-descriptions-item>
            <el-descriptions-item label="来源">
              <el-tag size="small" v-if="form.orderSource ===1 ">淘宝</el-tag>
              <el-tag size="small" v-if="form.orderSource ===0 ">天猫</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="店铺">
              <span v-if="form.shopId==6">梦小妮牛仔裤</span>
            </el-descriptions-item>
            <el-descriptions-item label="下单日期">
              {{ parseTime(form.orderCreateTime, '{yyyy}-{m}-{dd}')}}
              <!-- <el-date-picker
              disabled
                v-model="form.orderCreateTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择订单创建时间">
              </el-date-picker> -->
            </el-descriptions-item>
            <el-descriptions-item label="标签">
              <el-tag size="small" v-if="form.tag ==='1' ">实售</el-tag>
              <el-tag size="small" v-if="form.tag ==='2' ">淘宝客</el-tag>
              <el-tag size="small" v-if="form.tag ==='3' ">刷单</el-tag>
              <el-tag size="small" v-if="form.tag ==='4' ">返现</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="卖家备忘信息">
              {{form.sellerMemo}}
            </el-descriptions-item>
            <el-descriptions-item label="买家留言">
              {{form.buyerFeedback}}
            </el-descriptions-item>
            <el-descriptions-item label="备注">
              {{form.remark}}
            </el-descriptions-item>
            <el-descriptions-item label="关闭原因">{{form.closeReason}}</el-descriptions-item>
            <el-descriptions-item label="订单状态">{{form.statusStr}}</el-descriptions-item>

        </el-descriptions>
        <el-descriptions title="付款信息">
            <el-descriptions-item label="应付总额">{{form.totalAmount}}</el-descriptions-item>
            <el-descriptions-item label="优惠金额">{{form.discountAmount}}</el-descriptions-item>
            <el-descriptions-item label="运费">{{form.shippingFee}}</el-descriptions-item>
            <el-descriptions-item label="实际支付金额">{{form.payAmount}}</el-descriptions-item>
        </el-descriptions>


         <el-descriptions title="收货信息">
          <el-descriptions-item label="收件人姓名">{{form.receiver}}</el-descriptions-item>
          <el-descriptions-item label="收件人手机号">{{form.phone}}</el-descriptions-item>
          <el-descriptions-item label="省市区">{{form.province}}{{form.city}}{{form.town}}</el-descriptions-item>
          <el-descriptions-item label="详细地址">{{form.address}}</el-descriptions-item>
      </el-descriptions>

        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="goodsList"  style="margin-bottom: 10px;">
          <!-- <el-table-column type="selection" width="50" align="center" /> -->
          <el-table-column label="序号" align="center" type="index" width="50"/>

          <el-table-column label="商品图片" prop="productImgUrl" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.productImgUrl"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="goodsTitle" ></el-table-column>
          <el-table-column label="SKU" prop="skuInfo" width="150"></el-table-column>
          <el-table-column label="sku编码" prop="specNumber"></el-table-column>
          <el-table-column label="单价" prop="price"></el-table-column>
          <el-table-column label="数量" prop="quantity"></el-table-column>
          <el-table-column label="商品金额" prop="itemAmount"></el-table-column>
        </el-table>

        <el-row :gutter="10" class="mb8" v-if="isAudit">
          <el-col :span="1.5">
            <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAddTaoOrderItem">添加赠品</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" plain icon="el-icon-delete" size="mini" @click="handleDeleteTaoOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table v-if="isAudit" :data="taoOrderItemList" :row-class-name="rowTaoOrderItemIndex" @selection-change="handleTaoOrderItemSelectionChange" ref="taoOrderItem"  style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350"  >
            <template slot-scope="scope">
              <el-select v-model="scope.row.erpGoodsSpecId" filterable remote reserve-keyword placeholder="搜索商品" style="width: 330px;"
                :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                  :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"
                  :value="item.id">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="商品图片" prop="productImgUrl" >
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.productImgUrl"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="sku编码" prop="specNumber" width="100">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNumber" placeholder="请输入单品货号，对应系统sku编码" disabled/>
            </template>
          </el-table-column>

          <el-table-column label="单价" prop="price">
            <template slot-scope="scope">
              <el-input v-model="scope.row.price" placeholder="请输入单价" disabled/>
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity">
            <template slot-scope="scope">
              <el-input v-model="scope.row.quantity" placeholder="请输入数量"  @input="qtyChange(scope.row)" :disabled="isAudit" />
            </template>
          </el-table-column>
          <el-table-column label="总金额" prop="itemAmount">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemAmount" placeholder="请输入明细总金额" disabled/>
            </template>
          </el-table-column>

        </el-table>
         <el-form-item label="发货方式" prop="shipType" v-if="isAudit">
          <!-- <el-input v-model="form.orderSource" placeholder="请输入订单来源0天猫1淘宝" /> -->
          <el-select v-model="form.shipType" placeholder="发货类型0仓库发货1供应商代发" style="width:250px">
           <el-option label="供应商代发" value="1"></el-option>
           <el-option label="仓库发货" value="0"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer" v-if="isAudit">
        <el-button type="primary" @click="submitConfirmForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listOrder, pullOrder,getOrder,pushOms } from "@/api/tao/order";
import { listShop } from "@/api/shop/shop";
import { searchSku } from "@/api/goods/goods";
import {MessageBox} from "element-ui";
import {isRelogin} from "../../../utils/request";

export default {
  name: "OrderTao",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      pullLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      multiple: true,
      // 总条数
      total: 0,
      // 淘宝订单表格数据
      orderList: [],
      shopList:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopId: null,
        tid: null,
        status: null
      },
      // 表单参数
      form: {
      },
      rules: {
      }
    };
  },
  created() {
    listShop({type:1}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  methods: {
    /** 查询淘宝订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.queryParams).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.detailOpen = false;
      this.saleAfterOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        shopId: null
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
      this.ids = selection.map(item => item.tid)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullOrder({shopId:this.queryParams.shopId,updType:0}).then(response => {
          console.log('拉取淘宝订单接口返回=====',response)
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
            this.$modal.msgSuccess(JSON.stringify(response));
            this.pullLoading = false
          }

        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    handlePullUpdate(row) {
      // 接口拉取订单并更新
    },
    handleDetail(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.taoOrderItemList;
        this.detailOpen = true;
        this.detailTitle = "订单详情";
      });
      this.isAudit = false
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {

        }
      });
    },
    handlePushOms(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否手动推送到系统？').then(function() {
        return pushOms({ids:ids});
      }).then(() => {
        // this.getList();
        this.$modal.msgSuccess("推送成功");
      }).catch(() => {});
    },
  }
};
</script>
