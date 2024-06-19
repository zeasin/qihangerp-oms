<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
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

      <el-form-item label="下单日期" prop="orderCreateTime">
        <el-date-picker clearable
          v-model="queryParams.orderCreateTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="订单状态" prop="statusStr">
        <el-input
          v-model="queryParams.statusStr"
          placeholder="请输入订单状态"
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
        >手动推送订单</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange" >
      <el-table-column type="selection" width="55" align="center" :selectable="isRowSelectable" />
      <el-table-column label="订单号" align="center" prop="orderId" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.items" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.thumbImg"></el-image>
              <div style="margin-left:10px">
              <p>{{item.title}}</p>
              <p>{{item.skuAttrs}}&nbsp;</p>
                <p>
                <el-tag size="small">数量： {{item.skuCnt}}</el-tag>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="orderPrice" :formatter="amountFormatter">
        <template slot-scope="scope">
          <span>{{ amountFormatter(null,null,scope.row.orderPrice/100,null) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="订单创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="收件人信息" align="center" prop="userName" >
        <template slot-scope="scope">
          <span>{{scope.row.userName}}</span><br />
          <span> {{scope.row.provinceName}} {{scope.row.cityName}} {{scope.row.countyName}}
            </span>
          <p>
          {{scope.row.detailInfo}}
        </p>
        </template>
      </el-table-column>

      <el-table-column label="订单状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 10 " size="small">待付款</el-tag>
          <el-tag v-if="scope.row.status === 20 " size="small">待发货</el-tag>
          <el-tag v-if="scope.row.status === 30 " size="small">待收货</el-tag>
          <el-tag v-if="scope.row.status === 100 " size="small">完成</el-tag>
          <br/>
          <el-tag style="margin-top: 5px" type="warning" v-if="!scope.row.confirmStatus || scope.row.confirmStatus === 0 " size="small">待确认</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="快递单号" align="center" prop="logisticsCode" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-success"
            :loading="pullLoading"
            @click="handlePullUpdate(scope.row)"
          >更新订单</el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['xhs:order:remove']"
          >详情</el-button>
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

    <!-- 确认订单、订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" inline>
        <el-descriptions title="订单信息">
          <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
          <el-descriptions-item label="订单号">{{form.orderId}}</el-descriptions-item>
          <el-descriptions-item label="店铺">
            <el-tag > {{ shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:'' }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="创建时间">
            {{ parseTime(form.createTime, '{y}-{m}-{d} {h}:{m}:{s}') }}
          </el-descriptions-item>


          <el-descriptions-item label="订单状态">
            <el-tag v-if="form.status === 10 " size="small">待付款</el-tag>
            <el-tag v-if="form.status === 20 " size="small">待发货</el-tag>
            <el-tag v-if="form.status === 30 " size="small">待收货</el-tag>
            <el-tag v-if="form.status === 100 " size="small">完成</el-tag>
            <el-tag v-if="form.status === 250 " size="small">订单自动取消</el-tag>
          </el-descriptions-item>


        </el-descriptions>
        <el-descriptions title="付款信息">

          <el-descriptions-item label="商品总价">{{amountFormatter(null,null,form.productPrice /100,null)}}</el-descriptions-item>
          <el-descriptions-item label="优惠金额">{{amountFormatter(null,null,form.discountedPrice /100,null)}}</el-descriptions-item>

          <el-descriptions-item label="运费">{{amountFormatter(null,null,form.freight / 100,null)}}</el-descriptions-item>
          <el-descriptions-item label="订单金额">{{amountFormatter(null,null,form.orderPrice / 100,null)}}</el-descriptions-item>

        </el-descriptions>


        <el-descriptions title="收货信息">
          <el-descriptions-item label="收件人姓名">{{form.userName}}</el-descriptions-item>
          <el-descriptions-item label="收件人手机号">{{form.telNumber}}</el-descriptions-item>
          <el-descriptions-item label="省市区">{{form.provinceName}}{{form.cityName}}{{form.countyName}}</el-descriptions-item>
          <el-descriptions-item label="详细地址">{{form.detailInfo}}</el-descriptions-item>
        </el-descriptions>
        <el-descriptions title="发货信息">
          <!-- <el-descriptions-item label="发货方式">
            <el-tag v-if="form.shipType === 1"  type="danger">供应商代发</el-tag>
              <el-tag v-if="form.shipType === 0" type="danger">仓库发货</el-tag>
          </el-descriptions-item> -->
          <el-descriptions-item label="物流公司">{{form.expressCompanyCode}}</el-descriptions-item>
          <el-descriptions-item label="物流单号">{{form.expressTrackingNo}}</el-descriptions-item>
          <el-descriptions-item label="发货时间"></el-descriptions-item>
        </el-descriptions>
        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="goodsList"  style="margin-bottom: 10px;">
          <el-table-column label="序号" align="center" type="index" width="50"/>

          <el-table-column label="商品图片" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.thumbImg"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="title" ></el-table-column>
          <el-table-column label="SKU属性" prop="skuAttrs" ></el-table-column>
          <el-table-column label="sku编码" prop="skuCode"></el-table-column>
          <el-table-column label="单价" prop="salePrice"></el-table-column>
          <el-table-column label="数量" prop="skuCnt"></el-table-column>
          <el-table-column label="子订单金额" prop="realPrice"></el-table-column>
        </el-table>



        <el-divider content-position="center">订单商品</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddXhsOrderItem">添加赠品</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteXhsOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="xhsOrderItemList" :row-class-name="rowXhsOrderItemIndex" @selection-change="handleXhsOrderItemSelectionChange" ref="xhsOrderItem" style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350" >
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
          <el-table-column label="商品图片" prop="itemImage" >
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.itemImage"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="SKU编码" prop="itemSpecCode" width="100">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemSpecCode" placeholder="请输入规格" />
            </template>
          </el-table-column>
          <el-table-column label="单价" prop="price">
            <template slot-scope="scope">
              <el-input v-model="scope.row.price" placeholder="请输入单价" />
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.quantity" placeholder="请输入数量"  @input="qtyChange(scope.row)" />
            </template>
          </el-table-column>
          <el-table-column label="总金额" prop="itemAmount">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemAmount" placeholder="请输入总金额" />
            </template>
          </el-table-column>
        </el-table>
        <el-form-item label="收件人姓名" prop="userName" v-if="isAudit">
          <el-input v-model="form.userName" placeholder="请输入收件人姓名" style="width:250px" />
        </el-form-item>
        <el-form-item label="收件人电话" prop="telNumber" v-if="isAudit">
          <el-input v-model="form.telNumber" placeholder="请输入收件人电话" style="width:250px" />
        </el-form-item>

        <el-form-item label="详细地址" prop="detailInfo" v-if="isAudit">
          <el-input v-model="form.detailInfo" placeholder="请输入收件地址" style="width:250px" />
        </el-form-item>

      </el-form>

    </el-dialog>

  </div>
</template>

<script>

import { listShop } from "@/api/shop/shop";
import {listOrder,getOrder,pushOms,pullOrder,pullOrderDetail} from "@/api/wei/order";
import {pcaTextArr} from "element-china-area-data";

export default {
  name: "OrderWei",
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
      isAudit:false,
      detailOpen:false,
      detailTitle:'',
      goodsList:[],
      pcaTextArr,
      // 表单参数
      form: {
      },
      rules: {
        userName: [{ required: true, message: "收件人姓名不能为空", trigger: "blur" }],
        telNumber: [{ required: true, message: "收件人电话不能为空", trigger: "blur" }],
        detailInfo: [{ required: true, message: "收件人详情不能为空", trigger: "blur" }],
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
    // this.getList();
  },
  methods: {
    amountFormatter(row, column, cellValue, index) {
      return '￥' + parseFloat(cellValue).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    },
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
    isRowSelectable(row, index) {
      return !row.confirmStatus || row.confirmStatus === 0 ;
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handlePull() {
      if(this.queryParams.shopId){
        this.pullLoading = true
        pullOrder({shopId:this.queryParams.shopId}).then(response => {
          console.log('拉取订单接口返回=====',response)
            this.$modal.msgSuccess(JSON.stringify(response));
            this.pullLoading = false
            this.getList()
        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    handlePullUpdate(row) {
      // 接口拉取订单并更新
      this.pullLoading = true
      pullOrderDetail({shopId:row.shopId,orderId:row.orderId}).then(response => {
        console.log('拉取订单详情返回接口返回=====',response)
        this.$modal.msgSuccess(JSON.stringify(response));
        this.pullLoading = false
      })
    },
    handleDetail(row) {
      this.reset();
      const id = row.id
      getOrder(id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.items;
        this.detailOpen = true;
        this.detailTitle = "订单详情";
        this.isAudit = false
      });
    },
    handlePushOms(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否批量重新推送订单？').then(function() {
        return pushOms({ids:ids});
      }).then(() => {
        // this.getList();
        this.$modal.msgSuccess("推送成功");
      }).catch(() => {});
    },


  }
};
</script>
