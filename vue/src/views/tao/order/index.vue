<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单号" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="店铺" prop="shopId">
        <!-- <el-input
          v-model="queryParams.shopId"
          placeholder="请输入店铺"
          clearable
          @keyup.enter.native="handleQuery"
        /> -->
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

      <el-form-item label="快递单号" prop="logisticsCode">
        <el-input
          v-model="queryParams.logisticsCode"
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
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['tao:order:add']"
        >手动添加</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-upload"
          size="mini"

          @click="handleUpdate"
          v-hasPermi="['tao:order:edit']"
        >Execl导入</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
        >API拉取订单</el-button>
      </el-col>
      <!-- <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['tao:order:remove']"
        >删除</el-button>
      </el-col> -->
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['tao:order:export']"
        >导出订单</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单号" align="center" prop="id" />
      <el-table-column label="店铺" align="center" prop="shopId" >
       <template slot-scope="scope">
          <span v-if="scope.row.shopId==6">梦小妮牛仔裤</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.taoOrderItemList" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.productImgUrl"></el-image>
              <div style="margin-left:10px">
              <p>{{item.goodsTitle}}</p>
              <p>{{item.skuInfo}}&nbsp;
                <el-tag size="small">x {{item.quantity}}</el-tag>
                </p>
                <p v-if="scope.row.refundStatus === 0">
                  <el-button type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="总金额" align="center" prop="totalAmount" />
      <el-table-column label="运费" align="center" prop="shippingFee" />
      <!-- <el-table-column label="优惠金额" align="center" prop="discountAmount" /> -->
      <!-- <el-table-column label="实际支付金额" align="center" prop="payAmount" /> -->
      <!-- <el-table-column label="优惠描述" align="center" prop="discountRemark" /> -->
      <el-table-column label="订单创建时间" align="center" prop="orderCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderCreateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="订单修改时间" align="center" prop="orderModifyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderModifyTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
 -->
     <!--  <el-table-column label="发货时间" align="center" prop="deliveredTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliveredTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="完成时间" align="center" prop="completeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.completeTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="卖家备注" align="center" prop="sellerMemo" /> -->
      <el-table-column label="买家留言" align="center" prop="buyerFeedback" />
<!--      <el-table-column label="关闭原因。buyerCancel:买家取消订单，sellerGoodsLack:卖家库存不足，other:其它" align="center" prop="closeReason" />-->

      <!-- <el-table-column label="订单状态" align="center" prop="statusStr" /> -->
      <el-table-column label="订单状态" align="center" prop="status" >
         <template slot-scope="scope">

          <el-tag size="small" v-if="scope.row.status === 1"> 待支付</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2"> 待发货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 3"> 已发货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 4"> 已取消</el-tag>
          <el-tag size="small" v-if="scope.row.status === 5"> 已完成</el-tag>
          <span></span>

          <el-tag size="small" v-if="scope.row.auditStatus === 0" style="margin-top: 5px;"> 待确认</el-tag>
          <!-- <el-tag size="small" v-if="scope.row.auditStatus === 1" style="margin-top: 5px;"> 已确认</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 2" style="margin-top: 5px;"> 已拦截</el-tag> -->

        </template>
      </el-table-column>
      <!-- <el-table-column label="快递公司" align="center" prop="logisticsCompany" /> -->
<!--      <el-table-column label="快递公司编码" align="center" prop="logisticsCompanyCode" />-->
      <el-table-column label="快递单号" align="center" prop="logisticsCode" />
<!--      <el-table-column label="退款单ID" align="center" prop="refundId" />-->
<!--      <el-table-column label="退款金额，单位为元" align="center" prop="refundAmount" />-->
<!--      <el-table-column label="订单的售中退款状态，等待卖家同意：waitselleragree ，待买家修改：waitbuyermodify，等待买家退货：waitbuyersend，等待卖家确认收货：waitsellerreceive，退款成功：refundsuccess，退款失败：refundclose" align="center" prop="refundStatus" />-->
<!--      <el-table-column label="订单审核状态" align="center" prop="auditStatus" />-->
<!--      <el-table-column label="订单审核时间" align="center" prop="auditTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.auditTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="发货状态" align="center" prop="sendStatus" />-->
<!--      <el-table-column label="仓库发货时间" align="center" prop="sendTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.sendTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <!-- <el-table-column label="标签(1：实售2：淘宝客3：刷单4：返现)" align="center" prop="tag" /> -->
      <el-table-column label="备注" align="center" prop="remark" />
      <!-- <el-table-column label="是否评价" align="center" prop="isComment" /> -->
      <!-- <el-table-column label="是否合并发货(0:否1:是)" align="center" prop="isMerge" /> -->
<!--      <el-table-column label="订单创建时间" align="center" prop="createTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="创建人" align="center" prop="createBy" />-->
<!--      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="更新人" align="center" prop="updateBy" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
          v-if="scope.row.auditStatus === 0"
            size="mini"
            type="success"
            icon="el-icon-success"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['tao:order:edit']"
          >确认订单</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['tao:order:remove']"
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

    <!-- 添加或修改淘宝订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1100px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="180px" inline>
        <el-form-item label="淘宝订单ID" prop="id">
          <el-input v-model.number="form.id" placeholder="请输入淘宝订单ID" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
        <el-form-item label="店铺" prop="shopId">
          <!-- <el-input v-model="form.shopId" placeholder="请输入订单所属商户id" /> -->
          <el-select v-model="form.shopId" placeholder="请选择店铺" style="width:250px" :disabled="isAudit">
           <el-option style="width:250px"
              v-for="item in shopList"
              :key="item.id"
              :label="item.name"
              :value="item.id" >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单来源" prop="orderSource">
          <!-- <el-input v-model="form.orderSource" placeholder="请输入订单来源0天猫1淘宝" /> -->
          <el-select v-model="form.orderSource" placeholder="订单来源0天猫1淘宝" style="width:250px" :disabled="isAudit">
           <el-option label="淘宝" value="1"></el-option>
           <el-option label="天猫" value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="订单创建时间" prop="orderCreateTime">
          <el-date-picker clearable style="width:250px"
            v-model="form.orderCreateTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择订单创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="收件人姓名" prop="receiver">
          <el-input v-model="form.receiver" placeholder="请输入收件人姓名" style="width:250px"/>
        </el-form-item>
        <el-form-item label="收件人电话" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入收件人电话" style="width:250px"/>
        </el-form-item>
        <el-form-item label="省市区" prop="provinces">
          <el-cascader style="width:250px"
            size="large"
            :options="pcaTextArr"
            v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <el-form-item label="详细地址" prop="postAddr">
          <el-input v-model="form.address" placeholder="请输入详细地址" style="width:250px" />
        </el-form-item>
        <el-form-item label="卖家备忘信息" prop="sellerMemo">
          <el-input type="textarea" v-model="form.sellerMemo" placeholder="请输入卖家备忘信息" style="width:250px" />
        </el-form-item>
        <el-form-item label="买家留言" prop="buyerFeedback">
          <el-input type="textarea" v-model="form.buyerFeedback" placeholder="买家留言，不超过500字" style="width:250px"/>
        </el-form-item>

        <!-- <el-form-item label="订单状态" prop="statusStr">
          <el-input v-model="form.statusStr" placeholder="请输入订单状态" />
        </el-form-item> -->

        <el-form-item label="标签" prop="tag">
          <el-input v-model="form.tag" placeholder="请输入标签(1：实售2：淘宝客3：刷单4：返现)" style="width:250px" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" style="width:250px" />
        </el-form-item>

        <el-divider content-position="center">订单商品</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddTaoOrderItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteTaoOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="taoOrderItemList" :row-class-name="rowTaoOrderItemIndex" @selection-change="handleTaoOrderItemSelectionChange" ref="taoOrderItem" style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350" v-if="!isAudit" >
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
        <el-form-item label="商品总金额" prop="totalAmount">
          <el-input v-model="form.totalAmount" placeholder="请输入商品总金额" style="width:250px"/>
        </el-form-item>
        <el-form-item label="运费" prop="shippingFee">
          <el-input v-model="form.shippingFee" placeholder="请输入运费" style="width:250px"/>
        </el-form-item>
        <el-form-item label="优惠金额" prop="discountAmount">
          <el-input v-model="form.discountAmount" placeholder="请输入优惠金额" style="width:250px"/>
        </el-form-item>
        <!-- <el-form-item label="实际支付金额" prop="payAmount">
          <el-input v-model="form.payAmount" placeholder="请输入实际支付金额" style="width:250px"/>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

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

    <!-- 售后对话框 -->
    <el-dialog title="添加售后" :visible.sync="saleAfterOpen" width="500px" append-to-body :close-on-click-modal="false">
      <el-form ref="refundForm" :model="saleAfterForm" :rules="saleAfterRules" label-width="80px" inline>
        <el-form-item label="订单ID" prop="tid">
          <el-input v-model.number="saleAfterForm.tid" placeholder="订单ID" style="width:250px" disabled />
        </el-form-item>
        <!-- <el-form-item label="子订单ID" prop="oid">
          <el-input v-model="saleAfterForm.oid" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="商品图片" prop="productImgUrl">
          <!-- <el-image style="width: 70px; height: 70px" :src="saleAfterForm.productImgUrl"></el-image> -->
          <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="saleAfterForm.productImgUrl"></el-image>
              <div style="margin-left:10px">
              <p>{{saleAfterForm.goodsTitle}}</p>
              <p>{{saleAfterForm.skuInfo}} </p>
              </div>
            </div>
        </el-form-item>
        <!-- <el-form-item label="商品名称" prop="goodsTitle">
          <el-input v-model="saleAfterForm.goodsTitle" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="退款单号" prop="refundId">
          <el-input v-model.number="saleAfterForm.refundId" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="购买数量" prop="quantity">
          <el-input v-model="saleAfterForm.quantity" placeholder="" style="width:250px" disabled />
        </el-form-item>
        <el-form-item label="退货数量" prop="num">
          <el-input v-model.number="saleAfterForm.num" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="总金额" prop="itemAmount">
          <el-input v-model="saleAfterForm.itemAmount" placeholder="" style="width:250px" disabled/>
        </el-form-item>
        <el-form-item label="退款金额" prop="refundFee">
          <el-input type="number" v-model.number="saleAfterForm.refundFee" placeholder="请输入退款金额" style="width:250px"/>
        </el-form-item>
        <el-form-item label="退款类型" prop="afterSalesType">
          <el-select v-model="saleAfterForm.afterSalesType" placeholder="退款类型" style="width:250px" >
           <el-option value="1" label="退货"></el-option>
           <el-option value="3" label="换货"></el-option>
           <el-option value="9" label="仅退款"></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="实际支付金额" prop="payAmount">
          <el-input v-model="form.payAmount" placeholder="请输入实际支付金额" style="width:250px"/>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitRefundForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrder, getOrder, pullOrder, addOrder, confirmOrder } from "@/api/tao/order";
import { addTaoRefund } from "@/api/tao/taoRefund";
import { listShop } from "@/api/shop/shop";
import { searchSku } from "@/api/goods/goods";
import {
  provinceAndCityData,
  pcTextArr,
  regionData,
  pcaTextArr,
  codeToText,
} from "element-china-area-data";
import {MessageBox} from "element-ui";
import {isRelogin} from "../../../utils/request";

export default {
  name: "Order",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedTaoOrderItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 淘宝订单表格数据
      orderList: [],
      // 淘宝订单明细表格数据
      taoOrderItemList: [],
      goodsList:[],
      shopList:[],
      isAudit:false,
      skuListLoading:false,
      skuList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      detailTitle:'订单详情',
      detailOpen:false,
      saleAfterOpen:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shopId: 6,
        orderSource: '1',
        totalAmount: null,
        shippingFee: null,
        discountAmount: null,
        payAmount: null,
        discountRemark: null,
        orderCreateTime: null,
        orderModifyTime: null,
        payTime: null,
        confirmedTime: null,
        deliveredTime: null,
        completeTime: null,
        sellerMemo: null,
        buyerFeedback: null,
        closeReason: null,
        receivingTime: null,
        statusStr: null,
        status: null,
        logisticsCompany: null,
        logisticsCompanyCode: null,
        logisticsCode: null,
        refundId: null,
        refundAmount: null,
        refundStatus: null,
        auditStatus: null,
        auditTime: null,
        sendStatus: null,
        sendTime: null,
        tag: null,
        isComment: null,
        isMerge: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        updateBy: null
      },
      // 表单参数
      form: {
        provinces: [],
        address:null,
        receiver:null,
        phone:null,
        province:null,
        city:null,
        town:null
      },
      // 售后表单
      saleAfterForm:{
        num:null,
        refundFee:null,
        afterSalesType:null,
        refundId:null
      },
      pcaTextArr,
      // 表单校验
      saleAfterRules:{
        refundId: [{ required: true, message: "不能为空", trigger: "blur" }],
        refundQty: [{ required: true, message: "不能为空", trigger: "blur" }],
        refundFee: [{ required: true, message: "不能为空", trigger: "blur" }],
        afterSalesType: [{ required: true, message: "不能为空", trigger: "change" }],
      },
      rules: {
        id: [
          { required: true, message: "请输入淘宝订单ID", trigger: "blur" }
        ],
        shopId: [
          { required: true, message: "请选择店铺", trigger: "blur" }
        ],
        orderSource: [
          { required: true, message: "请选择订单来源", trigger: "blur" }
        ],
        orderCreateTime: [
          { required: true, message: "订单创建时间不能为空", trigger: "blur" }
        ],

        receiver: [
          { required: true, message: "请填写收件人姓名", trigger: "blur" }
        ],
        phone: [
          { required: true, message: "请填写收件人手机号", trigger: "blur" }
        ],
        provinces: [
          { required: true, message: "请选择省市区", trigger: "blur" }
        ],
        address: [
          { required: true, message: "请填写详细地址", trigger: "change" }
        ],
        totalAmount: [
          { required: true, message: "应付款总金额，totalAmount = ∑itemAmount + shippingFee，单位为元不能为空", trigger: "blur" }
        ],
        shippingFee: [
          { required: true, message: "运费不能为空", trigger: "blur" }
        ],
        discountAmount: [
          { required: true, message: "优惠金额不能为空", trigger: "blur" }
        ],
        payAmount: [
          { required: true, message: "实际支付金额不能为空", trigger: "blur" }
        ],

        status: [
          { required: true, message: "交易状态，waitbuyerpay:等待买家付款;waitsellersend:等待卖家发货;waitlogisticstakein:等待物流公司揽件;waitbuyerreceive:等待买家收货;waitbuyersign:等待买家签收;signinsuccess:买家已签收;confirm_goods:已收货;success:交易成功;cancel:交易取消;terminated:交易终止;未枚举:其他状态不能为空", trigger: "change" }
        ],
        auditStatus: [
          { required: true, message: "订单审核状态不能为空", trigger: "change" }
        ],
        shipType: [
          { required: true, message: "请选择发货类型", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listShop({type:4}).then(response => {
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
        shopId: null,
        orderSource: '1',
        totalAmount: null,
        shippingFee: 0,
        discountAmount: 0,
        payAmount: null,
        sellerMemo: null,
        buyerFeedback: null,
        status: null,
        auditStatus: null,
        auditTime: null,
        sendStatus: null,
        sendTime: null,
        tag: null,
        remark: null,
        isComment: null,
        isMerge: null,
        createTime: null,
        createBy: null,
        updateTime: null,
        updateBy: null
      };
      this.taoOrderItemList = [];
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
      this.isAudit = false
      this.open = true;
      this.title = "添加淘宝订单";
    },
    handlePull() {
      if(this.queryParams.shopId){
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
          }else
            this.$modal.msgSuccess(JSON.stringify(response));
        })
      }else{
        this.$modal.msgSuccess("请先选择店铺");
      }

      // this.$modal.msgSuccess("请先配置API");
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.taoOrderItemList;
        this.detailOpen = true;
        this.detailTitle = "确认订单";
      });
      this.isAudit = true
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.province = this.form.provinces[0]
          this.form.city = this.form.provinces[1]
          this.form.town = this.form.provinces[2]
          this.form.taoOrderItemList = this.taoOrderItemList;
          // if (this.isAudit === true) {
          //   updateOrder(this.form).then(response => {
          //     this.$modal.msgSuccess("修改成功");
          //     this.open = false;
          //     this.getList();
          //   });
          // } else {
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          // }
        }
      });
    },
    /** 确认订单按钮 */
    submitConfirmForm(){
      console.log('====确认订单=====',this.form,this.taoOrderItemList)
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.taoOrderItemList = this.taoOrderItemList;
          confirmOrder(this.form).then(response => {
            this.$modal.msgSuccess("确认成功");
            this.detailOpen = false;
            this.getList();
          });
        }
      })
    },
    /** 售后按钮 */
    handleRefund(row,item){
      this.saleAfterForm.tid = row.id
      this.saleAfterForm.oid = item.subItemId
      this.saleAfterForm.productImgUrl = item.productImgUrl
      this.saleAfterForm.goodsTitle = item.goodsTitle
      this.saleAfterForm.skuInfo = item.skuInfo
      this.saleAfterForm.num = item.quantity
      this.saleAfterForm.quantity = item.quantity
      this.saleAfterForm.itemAmount = item.itemAmount
      this.saleAfterForm.refundFee = item.itemAmount

      console.log('售后====',row)
      this.saleAfterOpen = true
    },
    submitRefundForm() {
      this.$refs["refundForm"].validate(valid => {
        if (valid) {
          addTaoRefund(this.saleAfterForm).then(resp =>{
            console.log('=====售后添加成功=====',resp)
            this.$modal.msgSuccess("退款添加成功");
            this.saleAfterOpen = false
          })
        }
      })
    },
    /** 删除按钮操作 */
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
	/** 淘宝订单明细序号 */
    rowTaoOrderItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 淘宝订单明细添加按钮操作 */
    handleAddTaoOrderItem() {
      let obj = {};
      obj.subItemId = "";
      obj.itemAmount = "";
      obj.discountFee = "";
      obj.adjustFee = "";
      obj.goodsTitle = "";
      obj.goodsNumber = "";
      obj.productImgUrl = "";
      obj.productUrl = "";
      obj.productId = "";
      obj.skuId = "";
      obj.specNumber = "";
      obj.skuInfo = "";
      obj.price = "";
      obj.quantity = "";
      obj.status = "";
      obj.statusStr = "";
      obj.refundStatus = "";
      obj.refundStatusStr = "";
      obj.refundAmount = "";
      obj.refundId = "";
      obj.logisticsStatus = "";
      obj.newSpecId = "";
      obj.newSpecNumber = "";
      obj.afterSaleState = "";
      obj.erpGoodsId = "";
      obj.erpGoodsSpecId = "";
      obj.remark = "";
      obj.isGift = "";
      obj.isSwap = "";
      this.taoOrderItemList.push(obj);
    },
    /** 淘宝订单明细删除按钮操作 */
    handleDeleteTaoOrderItem() {
      if (this.checkedTaoOrderItem.length == 0) {
        this.$modal.msgError("请先选择要删除的淘宝订单明细数据");
      } else {
        const taoOrderItemList = this.taoOrderItemList;
        const checkedTaoOrderItem = this.checkedTaoOrderItem;
        this.taoOrderItemList = taoOrderItemList.filter(function(item) {
          return checkedTaoOrderItem.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleTaoOrderItemSelectionChange(selection) {
      this.checkedTaoOrderItem = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('tao/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    },
    // 搜索SKU
    searchSku(query) {
      this.shopLoading = true;
      const qw = {
        keyword: query
      }
      searchSku(qw).then(res => {
        this.skuList = res.rows;
        this.skuListLoading = false;
      })
    },
    skuChanage(row) {
      console.log('=========',row)
      const spec = this.skuList.find(x => x.id === row.erpGoodsSpecId);
      if (spec) {
        console.log('=========', spec)
        row.erpGoodsId = spec.goodsId
        row.price = spec.purPrice
        row.skuInfo = spec.colorValue + ' ' + spec.sizeValue + ' ' + spec.styleValue
        row.productImgUrl = spec.colorImage
        row.goodsNumber = spec.number
        row.goodsTitle = spec.name
        row.specNumber = spec.specNum
        row.isGift = '0'
        row.quantity = 1
        row.itemAmount = row.price * row.quantity

        // 计算总金额
        let goodsAmount = this.form.totalAmount ? parseFloat(this.form.totalAmount):0.0
        goodsAmount += row.itemAmount
        this.form.totalAmount = goodsAmount
      }
    },
    qtyChange(row) {
      console.log('======值变化=====', row)
      row.itemAmount = row.price * row.comboNum
      // 计算总金额
      let goodsAmountNew =0.0
      this.taoOrderItemList.forEach(x=>{
        goodsAmountNew+= row.itemAmount
      })
      this.form.totalAmount = goodsAmountNew

    },

  }
};
</script>
