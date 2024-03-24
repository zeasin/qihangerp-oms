<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderSn">
        <el-input
          v-model="queryParams.orderSn"
          placeholder="请输入订单编号"
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

      <el-form-item label="手机号" prop="receiverPhone1">
        <el-input
          v-model="queryParams.receiverPhone1"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="快递单号" prop="trackingNumber">
        <el-input
          v-model="queryParams.trackingNumber"
          placeholder="请输入快递单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

<!--      <el-form-item label="省" prop="province">-->
<!--        <el-input-->
<!--          v-model="queryParams.province"-->
<!--          placeholder="请输入省"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->
<!--      <el-form-item label="市" prop="city">-->
<!--        <el-input-->
<!--          v-model="queryParams.city"-->
<!--          placeholder="请输入市"-->
<!--          clearable-->
<!--          @keyup.enter.native="handleQuery"-->
<!--        />-->
<!--      </el-form-item>-->


      <el-form-item label="创建时间" prop="createdTime">
        <el-date-picker clearable
          v-model="queryParams.createdTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单创建时间">
        </el-date-picker>
      </el-form-item>

<!--       <el-form-item label="标签" prop="tag">
        <el-input
          v-model="queryParams.tag"
          placeholder="请输入标签"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->
<!--     -->
<!--      <el-form-item label="API拉取时间" prop="pullTime">-->
<!--        <el-date-picker clearable-->
<!--          v-model="queryParams.pullTime"-->
<!--          type="date"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          placeholder="请选择API拉取时间">-->
<!--        </el-date-picker>-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">

      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePull"
          v-hasPermi="['pdd:order:remove']"
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
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
      <!-- <el-table-column label="订单id" align="center" prop="id" /> -->
      <el-table-column label="订单编号" align="center" prop="orderSn" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span v-if="scope.row.shopId==5">梦小妮潮流女装</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" prop="pddOrderItemList" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.pddOrderItemList" :key="item.id" :gutter="20">
              <!-- <div class="container">
                <img :src="item.goodsImage"  style="width: 70px; height: 70px" alt="your-image-description">
                <p>your text here</p>
              </div> -->

              <!-- <div style="width: 75px;">
                  <el-image  style="width: 70px; height: 70px" :src="item.goodsImage"></el-image>
            </div> -->
            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.goodsImage"></el-image>
              <div style="margin-left:10px">
              <p>{{item.goodsName}}</p>
              <p>{{item.goodsSpec}}</p>
              <p>
                <el-tag size="small">x {{item.quantity}}</el-tag>

                <el-button v-if="item.refundStatus === 1" type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </p>
              </div>
            </div>


            </el-row>
          </template>
      </el-table-column>
      <!-- <el-table-column label="订单类型" align="center" prop="tradeType" /> -->
      <!-- <el-table-column label="成交状态" align="center" prop="confirmStatus" /> -->
<!--      <el-table-column label="是否顺丰包邮，1-是 0-否" align="center" prop="freeSf" />-->
<!--      <el-table-column label="成团状态：0：拼团中、1：已成团、2：团失败" align="center" prop="groupStatus" />-->
      <!-- <el-table-column label="邮费" align="center" prop="postage" />
      <el-table-column label="折扣金额" align="center" prop="discountAmount" /> -->
      <el-table-column label="商品金额" align="center" prop="goodsAmount" />
      <el-table-column label="实付金额" align="center" prop="payAmount" />
     <!--  <el-table-column label="团长免单金额，单位：元" align="center" prop="capitalFreeDiscount" />
      <el-table-column label="商家优惠金额，单位：元" align="center" prop="sellerDiscount" />
      <el-table-column label="平台优惠金额，单位：元" align="center" prop="platformDiscount" /> -->
      <!-- <el-table-column label="订单备注" align="center" prop="remark" /> -->
      <!-- <el-table-column label="更新时间" align="center" prop="updatedAt" /> -->
      <el-table-column label="状态" align="center" prop="orderStatus" >
         <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.orderStatus === 1"> 待发货</el-tag>
          <el-tag size="small" v-if="scope.row.orderStatus === 2"> 已发货</el-tag>
          <el-tag size="small" v-if="scope.row.orderStatus === 3"> 已签收</el-tag>
          <span></span>
          <el-tag size="small" v-if="scope.row.refundStatus === 1" style="margin-top: 5px;"> 无售后或售后关闭</el-tag>
          <el-tag size="small" v-if="scope.row.refundStatus === 2" style="margin-top: 5px;"> 售后处理中</el-tag>
          <el-tag size="small" v-if="scope.row.refundStatus === 3" style="margin-top: 5px;"> 退款中</el-tag>
          <el-tag size="small" v-if="scope.row.refundStatus === 4" style="margin-top: 5px;"> 退款成功</el-tag>

          <el-tag size="small" v-if="scope.row.auditStatus === 0" style="margin-top: 5px;"> 待确认</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 1" style="margin-top: 5px;"> 已确认</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 2" style="margin-top: 5px;"> 已拦截</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="是否是抽奖订单，1-非抽奖订单，2-抽奖订单" align="center" prop="isLuckyFlag" />-->
      <!-- <el-table-column label="订单状态" align="center" prop="orderStatus" /> -->
      <el-table-column label="发货物流" align="center" prop="trackingNumber">
        <template slot-scope="scope">
          {{scope.row.trackingNumber}}<br/>
          {{scope.row.shippingTime}}
        </template>
      </el-table-column>
      <!-- <el-table-column label="发货时间" align="center" prop="shipping_time" /> -->
      <!-- <el-table-column label="快递单号" align="center" prop="trackingNumber" /> -->
      <!-- <el-table-column label="物流公司" align="center" prop="trackingCompany" /> -->
      <!-- <el-table-column label="支付方式" align="center" prop="payType" /> -->
<!--      <el-table-column label="支付单号" align="center" prop="payNo" />-->

<!--      <el-table-column label="收件人电话" align="center" prop="receiverPhone" />-->
<!--      <el-table-column label="收件人姓名" align="center" prop="receiverName" />-->
      <el-table-column label="收件人" align="center" prop="receiverName1" >
        <template slot-scope="scope">
          {{scope.row.receiverName1}}<br/>
          {{scope.row.province}}{{scope.row.city}}
        </template>
      </el-table-column>
<!--      <el-table-column label="手机号" align="center" prop="receiverPhone1" />-->
<!--      <el-table-column label="${comment}" align="center" prop="receiverAddress1" />-->
<!--      <el-table-column label="详细地址" align="center" prop="address" />-->
      <!-- <el-table-column label="区县" align="center" prop="town" />
      <el-table-column label="市" align="center" prop="city" />
      <el-table-column label="省" align="center" prop="province" /> -->
<!--      <el-table-column label="国家地区" align="center" prop="country" />-->
      <el-table-column label="订单创建时间" align="center" prop="createdTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
<!--      <el-table-column label="支付时间" align="center" prop="payTime" />-->
<!--      <el-table-column label="成交时间" align="center" prop="confirmTime" />-->
<!--      <el-table-column label="确认收货时间" align="center" prop="receiveTime" />-->
      <el-table-column label="买家留言信息" align="center" prop="buyerMemo" />
      <!-- <el-table-column label="售后状态" align="center" prop="afterSalesStatus" /> -->
<!--      <el-table-column label="订单成交时间" align="center" prop="orderConfirmTime" />-->
      <!-- <el-table-column label="订单承诺发货时间" align="center" prop="lastShipTime" /> -->
      <!-- <el-table-column label="审核状态" align="center" prop="auditStatus" /> -->
<!--      <el-table-column label="结算状态" align="center" prop="settlementStatus" />-->
      <!-- <el-table-column label="发货状态" align="center" prop="shipStatus" /> -->
<!--      <el-table-column label="发货时间" align="center" prop="shipTime" />-->
      <!-- <el-table-column label="标签" align="center" prop="tag" /> -->
<!--      <el-table-column label="导入文件id" align="center" prop="excelLogId" />-->
<!--      <el-table-column label="导入结果" align="center" prop="excelMsg" />-->
<!--      <el-table-column label="打印密文" align="center" prop="encryptedData" />-->
<!--      <el-table-column label="打印签名" align="center" prop="signature" />-->
<!--      <el-table-column label="打印状态" align="center" prop="printStatus" />-->
<!--      <el-table-column label="打印时间" align="center" prop="printTime" />-->
<!--      <el-table-column label="收件人检索" align="center" prop="nameKey" />-->
<!--      <el-table-column label="手机号检索" align="center" prop="phoneKey" />-->
<!--      <el-table-column label="地址检索" align="center" prop="addressKey" />-->
<!--      <el-table-column label="订单处理结果" align="center" prop="result" />-->
<!--      <el-table-column label="API拉取时间" align="center" prop="pullTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.pullTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
          v-if="scope.row.auditStatus === 0"
            size="mini"
            type="success"
            icon="el-icon-success"
            @click="handleConfirm(scope.row)"
            v-hasPermi="['pdd:order:edit']"
          >确认订单</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['pdd:order:remove']"
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

    <!-- 添加或修改拼多多订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="180px" inline>
        <el-form-item label="订单编号" prop="orderSn">
          <el-input v-model="form.orderSn" placeholder="请输入订单编号" style="width:250px" :disabled="isAudit" />
        </el-form-item>
        <el-form-item label="店铺" prop="shopId">
          <!-- <el-input v-model="form.shopId" placeholder="请输入内部店铺ID" /> -->
          <el-select v-model="form.shopId" placeholder="请选择店铺" style="width:250px" :disabled="isAudit">
           <el-option
              v-for="item in shopList"
              :key="item.id"
              :label="item.name"
              :value="item.id" >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否顺丰包邮" prop="freeSf">
          <!-- <el-input v-model="form.freeSf" placeholder="请输入是否顺丰包邮，1-是 0-否" /> -->
          <el-select v-model="form.freeSf" placeholder="是否顺丰包邮" style="width:250px" :disabled="isAudit">
           <el-option label="是" value="1"></el-option>
           <el-option label="否" value="0"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item label="是否是抽奖订单" prop="isLuckyFlag">
          <!-- <el-input v-model="form.isLuckyFlag" placeholder="请输入是否是抽奖订单，1-非抽奖订单，2-抽奖订单" /> -->
          <el-select v-model="form.isLuckyFlag" placeholder="是否是抽奖订单" style="width:250px" :disabled="isAudit">
           <el-option label="非抽奖订单" value="1"></el-option>
           <el-option label="抽奖订单" value="2"></el-option>
          </el-select>
        </el-form-item>

       <el-form-item label="收件人姓名" prop="receiverName1">
          <el-input v-model="form.receiverName1" placeholder="请输入收件人姓名" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
        <el-form-item label="收件人电话" prop="receiverPhone1">
          <el-input v-model="form.receiverPhone1" placeholder="请输入收件人电话" style="width:250px" :disabled="isAudit" />
        </el-form-item>
        <el-form-item label="省市区" prop="provinces">
          <el-cascader style="width:250px"
            size="large"
            :options="pcaTextArr"
            v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <el-form-item label="详细地址" prop="receiverAddress1">
          <el-input v-model="form.receiverAddress1" placeholder="请输入收件地址" style="width:250px" :disabled="isAudit" />
        </el-form-item>

        <!-- <el-form-item label="国家地区" prop="country">
          <el-input v-model="form.country" placeholder="请输入国家地区" />
        </el-form-item> -->
        <el-form-item label="订单创建时间" prop="createdTime">
          <el-date-picker clearable :disabled="isAudit"
            v-model="form.createdTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择订单创建时间" style="width:250px">
          </el-date-picker>
        </el-form-item>

        <el-form-item label="买家留言信息" prop="buyerMemo">
          <el-input v-model="form.buyerMemo" type="textarea" placeholder="请输入买家留言信息" style="width:250px" />
        </el-form-item>
        <el-form-item label="订单备注" prop="remark">
          <el-input type="textarea" v-model="form.remark" placeholder="请输入内容" style="width:250px"/>
        </el-form-item>

        <el-form-item label="标签" prop="tag">
          <el-input v-model="form.tag" placeholder="请输入标签" style="width:250px"/>
        </el-form-item>

        <el-divider content-position="center">订单商品</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button v-if="!isAudit" type="primary" icon="el-icon-plus" size="mini" @click="handleAddPddOrderItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" v-if="!isAudit" icon="el-icon-delete" size="mini" @click="handleDeletePddOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="pddOrderItemList" :row-class-name="rowPddOrderItemIndex" @selection-change="handlePddOrderItemSelectionChange" ref="pddOrderItem" style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center" v-if="!isAudit" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350" v-if="!isAudit" >
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.erpGoodsId" placeholder="请输入erp系统商品id" /> -->
              <el-select v-model="scope.row.erpSpecId" filterable remote reserve-keyword placeholder="搜索商品" style="width: 330px;"
                :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                  :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"
                  :value="item.id">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <!-- <el-table-column label="erp系统商品规格id" prop="erpSpecId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.erpSpecId" placeholder="请输入erp系统商品规格id" />
            </template>
          </el-table-column> -->
          <el-table-column label="商品图片" prop="goodsImage" >
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsName" placeholder="请输入商品名称" /> -->
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImage"></el-image>
            </template>
          </el-table-column>
         <!--  <el-table-column label="商品编码" prop="goodsNum" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsNum" disabled placeholder="请输入商品编码" />
            </template>
          </el-table-column> -->
          <!-- <el-table-column label="商品规格" prop="goodsSpec" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsSpec" placeholder="请输入商品规格" />
            </template>
          </el-table-column> -->
          <el-table-column label="规格编码" prop="specNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNum" disabled placeholder="请输入商品规格编码" />
            </template>
          </el-table-column>
          <el-table-column label="单价" prop="goodsPrice" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsPrice" disabled placeholder="请输入商品单价" />
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.quantity" placeholder="请输入商品数量" @input="qtyChange(scope.row)" :disabled="isAudit" />
            </template>
          </el-table-column>
          <el-table-column label="总金额" prop="itemAmount">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemAmount" placeholder="请输入子订单金额" :disabled="isAudit" />
            </template>
          </el-table-column>

          <!-- <el-table-column label="是否礼品0否1是" prop="isGift" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.isGift" placeholder="请输入是否礼品0否1是" />
            </template>
          </el-table-column>
          <el-table-column label="拼多多商品id" prop="goodId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodId" placeholder="请输入拼多多商品id" />
            </template>
          </el-table-column>
          <el-table-column label="拼多多商品skuid" prop="skuId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skuId" placeholder="请输入拼多多商品skuid" />
            </template>
          </el-table-column>
          <el-table-column label="已退货数量" prop="refundCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.refundCount" placeholder="请输入已退货数量" />
            </template>
          </el-table-column> -->
        </el-table>
        <!-- <el-form-item label="折扣金额，单位：元" prop="discountAmount">
          <el-input v-model="form.discountAmount" placeholder="请输入折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额"  style="width:250px"/>
        </el-form-item> -->
        <el-form-item label="商品金额，单位：元" prop="goodsAmount">
          <el-input v-model="form.goodsAmount" placeholder="请输入商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
        <el-form-item label="商家优惠金额，单位：元" prop="sellerDiscount">
          <el-input v-model="form.sellerDiscount" placeholder="请输入商家优惠金额，单位：元" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
        <el-form-item label="平台优惠金额，单位：元" prop="platformDiscount">
          <el-input v-model="form.platformDiscount" placeholder="请输入平台优惠金额，单位：元" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
        <el-form-item label="团长免单金额，单位：元" prop="capitalFreeDiscount">
          <el-input type="number" v-model.number="form.capitalFreeDiscount" placeholder="请输入团长免单金额，单位：元" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
        <!-- <el-form-item label="支付金额，单位：元" prop="payAmount">
          <el-input v-model="form.payAmount" placeholder="请输入支付金额，单位：元，支付金额=商品金额-折扣金额+邮费" style="width:250px" />
        </el-form-item>
    -->

       <el-form-item label="邮费，单位：元" prop="postage">
          <el-input v-model="form.postage" placeholder="请输入邮费，单位：元" style="width:250px" :disabled="isAudit"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <!-- 订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1100px" append-to-body>

      <el-form ref="form" :model="form" :rules="rules" label-width="100px" inline>
        <el-descriptions title="订单信息">
            <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
            <el-descriptions-item label="订单号">{{form.orderSn}}</el-descriptions-item>
            <el-descriptions-item label="店铺">
              {{ shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:'' }}
            </el-descriptions-item>
            <el-descriptions-item label="订单类型">
              <el-tag size="small" v-if="form.tradeType ===1 ">定金订单</el-tag>
              <el-tag size="small" v-if="form.tradeType ===0 ">普通订单</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="是否顺丰包邮">
              <el-tag size="small" v-if="form.freeSf ===1 ">是</el-tag>
              <el-tag size="small" v-if="form.freeSf ===0 ">否</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="是否抽奖订单">
              <el-tag size="small" v-if="form.isLuckyFlag ===1 ">非抽奖订单</el-tag>
              <el-tag size="small" v-if="form.isLuckyFlag ===2 ">抽奖订单</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="成团状态">
              <el-tag size="small" v-if="form.groupStatus ===0 ">拼团中</el-tag>
              <el-tag size="small" v-if="form.groupStatus ===1 ">已成团</el-tag>
              <el-tag size="small" v-if="form.groupStatus ===2 ">团失败</el-tag>
            </el-descriptions-item>


            <el-descriptions-item label="买家留言">
              {{form.buyerMemo}}
            </el-descriptions-item>
            <el-descriptions-item label="备注">
              {{form.remark}}
            </el-descriptions-item>
            <el-descriptions-item label="创建时间">
              {{ form.createdTime }}
            </el-descriptions-item>
             <el-descriptions-item label="支付时间"> {{ form.payTime }}</el-descriptions-item>
             <el-descriptions-item label="最后更新时间"> {{ form.updatedAt }}</el-descriptions-item>

            <el-descriptions-item label="订单状态">
              <el-tag v-if="form.orderStatus === 1" style="margin-bottom: 6px;">待发货</el-tag>
              <el-tag v-if="form.orderStatus === 2" style="margin-bottom: 6px;">已发货</el-tag>
              <el-tag v-if="form.orderStatus === 3" style="margin-bottom: 6px;">已签收</el-tag>
            </el-descriptions-item>
            <el-descriptions-item label="退款状态">
              <el-tag v-if="form.refundStatus === 1">无售后或售后关闭</el-tag>
              <el-tag v-if="form.refundStatus === 2">售后处理中</el-tag>
               <el-tag v-if="form.refundStatus === 3">退款中</el-tag>
               <el-tag v-if="form.refundStatus === 4">退款成功</el-tag>
            </el-descriptions-item>

        </el-descriptions>
        <el-descriptions title="付款信息">
            <el-descriptions-item label="商品总额">{{form.goodsAmount}}</el-descriptions-item>
            <el-descriptions-item label="团长免单金额">{{form.capitalFreeDiscount}}</el-descriptions-item>
            <el-descriptions-item label="商家优惠金额">{{form.sellerDiscount}}</el-descriptions-item>
            <el-descriptions-item label="平台优惠金额">{{form.platformDiscount}}</el-descriptions-item>
            <el-descriptions-item label="运费">{{form.postage}}</el-descriptions-item>
            <el-descriptions-item label="实际支付金额">{{form.payAmount}}</el-descriptions-item>
        </el-descriptions>


         <el-descriptions title="收货信息">
          <el-descriptions-item label="收件人姓名">{{form.receiverName1}}</el-descriptions-item>
          <el-descriptions-item label="收件人手机号">{{form.receiverPhone1}}</el-descriptions-item>
          <el-descriptions-item label="省市区">{{form.province}}{{form.city}}{{form.town}}</el-descriptions-item>
          <el-descriptions-item label="详细地址">{{form.receiverAddress1}}</el-descriptions-item>
        </el-descriptions>
        <el-descriptions title="发货信息">
          <!-- <el-descriptions-item label="发货方式">
            <el-tag v-if="form.shipType === 1"  type="danger">供应商代发</el-tag>
              <el-tag v-if="form.shipType === 0" type="danger">仓库发货</el-tag>
          </el-descriptions-item> -->
            <el-descriptions-item label="物流公司">{{form.trackingCompany}}</el-descriptions-item>
            <el-descriptions-item label="物流单号">{{form.trackingNumber}}</el-descriptions-item>
            <el-descriptions-item label="发货时间">{{form.shippingTime}}</el-descriptions-item>
        </el-descriptions>

        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="goodsList"  style="margin-bottom: 10px;">
          <!-- <el-table-column type="selection" width="50" align="center" /> -->
          <el-table-column label="序号" align="center" type="index" width="50"/>

          <el-table-column label="商品图片" prop="goodsImage" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImage"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="goodsName" ></el-table-column>
          <el-table-column label="SKU" prop="goodsSpec" width="150"></el-table-column>
          <el-table-column label="sku编码" prop="specNum"></el-table-column>
          <el-table-column label="单价" prop="goodsPrice"></el-table-column>
          <el-table-column label="数量" prop="quantity"></el-table-column>
          <el-table-column label="商品金额" prop="itemAmount"></el-table-column>
        </el-table>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button v-if="isAudit" type="primary" icon="el-icon-plus" size="mini" @click="handleAddPddOrderItem">添加赠品</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" v-if="isAudit" icon="el-icon-delete" size="mini" @click="handleDeletePddOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table v-if="isAudit" :data="pddOrderItemList" :row-class-name="rowPddOrderItemIndex" @selection-change="handlePddOrderItemSelectionChange" ref="pddOrderItem" style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center"  />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350" >
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.erpGoodsId" placeholder="请输入erp系统商品id" /> -->
              <el-select v-model="scope.row.erpSpecId" filterable remote reserve-keyword placeholder="搜索商品" style="width: 330px;"
                :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                  :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"
                  :value="item.id">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <!-- <el-table-column label="erp系统商品规格id" prop="erpSpecId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.erpSpecId" placeholder="请输入erp系统商品规格id" />
            </template>
          </el-table-column> -->
          <el-table-column label="商品图片" prop="goodsImage" >
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsName" placeholder="请输入商品名称" /> -->
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImage"></el-image>
            </template>
          </el-table-column>
         <!--  <el-table-column label="商品编码" prop="goodsNum" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsNum" disabled placeholder="请输入商品编码" />
            </template>
          </el-table-column> -->
          <!-- <el-table-column label="商品规格" prop="goodsSpec" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsSpec" placeholder="请输入商品规格" />
            </template>
          </el-table-column> -->
          <el-table-column label="规格编码" prop="specNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNum" disabled placeholder="请输入商品规格编码" />
            </template>
          </el-table-column>
          <el-table-column label="单价" prop="goodsPrice" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsPrice" disabled placeholder="请输入商品单价" />
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.quantity" placeholder="请输入商品数量" @input="qtyChange(scope.row)" />
            </template>
          </el-table-column>
          <el-table-column label="总金额" prop="itemAmount">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemAmount" placeholder="请输入子订单金额" />
            </template>
          </el-table-column>

          <!-- <el-table-column label="是否礼品0否1是" prop="isGift" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.isGift" placeholder="请输入是否礼品0否1是" />
            </template>
          </el-table-column>
          <el-table-column label="拼多多商品id" prop="goodId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodId" placeholder="请输入拼多多商品id" />
            </template>
          </el-table-column>
          <el-table-column label="拼多多商品skuid" prop="skuId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skuId" placeholder="请输入拼多多商品skuid" />
            </template>
          </el-table-column>
          <el-table-column label="已退货数量" prop="refundCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.refundCount" placeholder="请输入已退货数量" />
            </template>
          </el-table-column> -->
        </el-table>


        <el-form-item label="收件人姓名" prop="receiverName1" v-if="isAudit">
          <el-input v-model="form.receiverName1" placeholder="请输入收件人姓名" style="width:250px" />
        </el-form-item>
        <el-form-item label="收件人电话" prop="receiverPhone1" v-if="isAudit">
          <el-input v-model="form.receiverPhone1" placeholder="请输入收件人电话" style="width:250px" />
        </el-form-item>
        <el-form-item label="省市区" prop="provinces" v-if="isAudit">
          <el-cascader style="width:250px"
                       size="large"
                       :options="pcaTextArr"
                       v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <el-form-item label="详细地址" prop="receiverAddress1" v-if="isAudit">
          <el-input v-model="form.receiverAddress1" placeholder="请输入收件地址" style="width:250px" />
        </el-form-item>
        <el-form-item label="发货方式" prop="shipType" v-if="isAudit">
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
          <el-input v-model.number="saleAfterForm.orderSn" placeholder="订单号" style="width:250px" disabled />
        </el-form-item>
        <!-- <el-form-item label="子订单ID" prop="oid">
          <el-input v-model="saleAfterForm.oid" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="商品图片" prop="goodsImage">
          <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="saleAfterForm.goodsImage"></el-image>
              <div style="margin-left:10px">
              <p>{{saleAfterForm.goodsName}}</p>
              <p>{{saleAfterForm.goodsSpec}} </p>
              </div>
            </div>
        </el-form-item>
        <!-- <el-form-item label="商品名称" prop="goodsTitle">
          <el-input v-model="saleAfterForm.goodsTitle" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="退款单号" prop="id">
          <el-input v-model.number="saleAfterForm.id" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="购买数量" prop="quantity">
          <el-input v-model="saleAfterForm.quantity" placeholder="" style="width:250px" disabled />
        </el-form-item>
        <el-form-item label="退货数量" prop="refundQty">
          <el-input v-model.number="saleAfterForm.refundQty" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="总金额" prop="itemAmount">
          <el-input v-model="saleAfterForm.itemAmount" placeholder="" style="width:250px" disabled/>
        </el-form-item>
        <el-form-item label="退款金额" prop="refundAmount">
          <el-input type="number" v-model.number="saleAfterForm.refundAmount" placeholder="请输入退款金额" style="width:250px"/>
        </el-form-item>
        <el-form-item label="退款类型" prop="afterSalesType">
          <el-select v-model="saleAfterForm.afterSalesType" placeholder="退款类型" style="width:250px" >
           <el-option value="2" label="仅退款"></el-option>
           <el-option value="3" label="退货退款"></el-option>
           <el-option value="4" label="换货"></el-option>
           <el-option value="5" label="缺货补寄"></el-option>
           <el-option value="9" label="拦截退货"></el-option>
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
import { listOrder, getOrder, addOrder, confirmOrder,pullOrder } from "@/api/pdd/order";
import { listShop } from "@/api/shop/shop";
import { searchSku } from "@/api/goods/goods";
import { addPddRefund } from "@/api/pdd/pddRefund";
import {
  provinceAndCityData,
  pcTextArr,
  regionData,
  pcaTextArr,
  codeToText,
} from "element-china-area-data";
import {MessageBox} from "element-ui";
import {isRelogin} from "@/utils/request";


export default {
  name: "OrderPdd",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedPddOrderItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 拼多多订单表格数据
      orderList: [],
      // 拼多多订单明细表格数据
      pddOrderItemList: [],
      goodsList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      detailTitle:'',
      detailOpen:false,
      // 是否审核状态
      isAudit:false,
      shopList:[],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderSn: null,
        shopId: null,
        tradeType: null,
        confirmStatus: null,
        refundStatus: null,
        isLuckyFlag: null,
        orderStatus: null,
        shippingTime: null,
        trackingNumber: null,
        trackingCompany: null,
        createdTime: null,
        afterSalesStatus: null,
        orderConfirmTime: null,
        lastShipTime: null,
        auditStatus: null,
        settlementStatus: null,
        shipStatus: null,
        shipTime: null
      },
      // 表单参数
      form: {
        provinces: []
      },
      pcaTextArr,
      skuListLoading:false,
      skuList:[],
      saleAfterOpen:false,
      // 售后表单
      saleAfterForm:{
        refundQty:null,
        refundAmount:null,
        afterSalesType:null,
        id:null
      },
      // 表单校验
      saleAfterRules:{
        id: [{ required: true, message: "不能为空", trigger: "blur" }],
        refundQty: [{ required: true, message: "不能为空", trigger: "blur" }],
        refundAmount: [{ required: true, message: "不能为空", trigger: "blur" }],
        afterSalesType: [{ required: true, message: "不能为空", trigger: "change" }],
      },
      rules: {
        orderSn: [
          { required: true, message: "订单编号不能为空", trigger: "blur" }
        ],
        shopId: [
          { required: true, message: "内部店铺ID不能为空", trigger: "blur" }
        ],
        tradeType: [
          { required: true, message: "订单类型 0-普通订单 ，1- 定金订单不能为空", trigger: "change" }
        ],

        freeSf: [
          { required: true, message: "是否顺丰包邮，1-是 0-否不能为空", trigger: "blur" }
        ],
        isLuckyFlag:[
          { required: true, message: "是否抽奖订单不能为空", trigger: "blur" }
        ],
        receiverName1:[{ required: true, message: "收件人不能为空", trigger: "blur" }],
        receiverPhone1:[{ required: true, message: "收件人电话不能为空", trigger: "blur" }],
        provinces:[{ required: true, message: "请选择省市区", trigger: "blur" }],
        receiverAddress1:[{ required: true, message: "详细地址不能为空", trigger: "blur" }],
        createdTime:[{ required: true, message: "订单创建时间不能为空", trigger: "blur" }],
        capitalFreeDiscount: [
          { required: true, message: "团长免单金额，单位：元不能为空", trigger: "blur" }
        ],
        sellerDiscount: [
          { required: true, message: "商家优惠金额，单位：元不能为空", trigger: "blur" }
        ],
        platformDiscount: [
          { required: true, message: "平台优惠金额，单位：元不能为空", trigger: "blur" }
        ],
        refundStatus: [
          { required: true, message: "售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部不能为空", trigger: "change" }
        ],

        orderStatus: [
          { required: true, message: "订单状态1：待发货，2：已发货待签收，3：已签收不能为空", trigger: "change" }
        ],
        postage: [
          { required: true, message: "邮费，单位：元不能为空", trigger: "blur" }
        ],
        discountAmount: [
          { required: true, message: "折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额不能为空", trigger: "blur" }
        ],
        goodsAmount: [
          { required: true, message: "商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额不能为空", trigger: "blur" }
        ],
        payAmount: [
          { required: true, message: "支付金额，单位：元，支付金额=商品金额-折扣金额+邮费不能为空", trigger: "blur" }
        ],
        shipType: [
          { required: true, message: "请选择发货方式", trigger: "blur" }
        ],
      }
    };
  },
  created() {
     listShop({type:5}).then(response => {
        this.shopList = response.rows;

      });

    this.getList();

  },
  methods: {
    /** 查询拼多多订单列表 */
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
      this.detailOpen = false;
      this.open = false;
      this.saleAfterOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderSn: null,
        shopId: null,
        tradeType: 0,
        confirmStatus: 1,
        freeSf: '0',
        groupStatus: 1,
        capitalFreeDiscount: 0.00,
        sellerDiscount: 0,
        platformDiscount: 0,
        remark: null,
        updatedAt: null,
        refundStatus: null,
        isLuckyFlag: '1',
        orderStatus: null,
        shippingTime: null,
        trackingNumber: null,
        trackingCompany: null,
        payType: null,
        payNo: null,
        postage: 0,
        discountAmount: null,
        goodsAmount: null,
        payAmount: null,
        receiverPhone: null,
        receiverName: null,
        receiverName1: null,
        receiverPhone1: null,
        receiverAddress1: null,
        address: null,
        town: null,
        city: null,
        province: null,
        country: '中国',
        createdTime: null,
        payTime: null,
        confirmTime: null,
        receiveTime: null,
        buyerMemo: null,
        afterSalesStatus: null,
        orderConfirmTime: null,
        lastShipTime: null,
        auditStatus: null,
        settlementStatus: null,
        shipStatus: null,
        shipTime: null,
        tag: null,
        provinces: []
      };
      this.pddOrderItemList = [];
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
      this.title = "添加拼多多订单";
    },
    handleImport() {

    },
    /** 修改按钮操作 */
    handleConfirm(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {

        this.form = response.data;
        this.goodsList = response.data.pddOrderItemList;
        // this.$nextTick(()=>{
        //   this.form.isLuckyFlag = response.data.isLuckyFlag+''
        //   this.form.freeSf = response.data.freeSf+''
        // })
        this.form.provinces = []
        this.form.provinces.push(response.data.province)
        this.form.provinces.push(response.data.city)
        this.form.provinces.push(response.data.town)
        this.isAudit = true
        this.detailOpen = true;
        this.detailTitle = "确认订单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      console.log('====提交表单====',this.form.provinces)
      this.$refs["form"].validate(valid => {
        if (valid) {

            if(this.form.pddOrderItemList && this.form.pddOrderItemList.length > 0){
              this.form.pddOrderItemList.forEach(x =>{
                if(!x.erpSpecId || x.erpSpecId === 0){
                  this.$modal.msgError("请完善商品信息");
                  return
                }
              })
              addOrder(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }else{
              this.$modal.msgError("请添加商品");
            }

          }

      });
    },
    /** 删除按钮操作 */
    handlePull(row) {
      if(this.queryParams.shopId){
        pullOrder({shopId:this.queryParams.shopId,updType:0}).then(response => {
          console.log('拉取pdd订单接口返回=====',response)
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
    handleDetail(row){
      getOrder(row.id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.pddOrderItemList;
        // this.$nextTick(()=>{
        //   this.form.isLuckyFlag = response.data.isLuckyFlag+''
        //   this.form.freeSf = response.data.freeSf+''
        // })
        this.detailOpen = true;
        this.detailTitle = "订单详情";
        this.isAudit = false
      });
    },
    submitConfirmForm(){
      console.log('====提交表单====',this.form)
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.province = this.form.provinces[0]
          this.form.city = this.form.provinces[1]
          this.form.town = this.form.provinces[2]
          this.form.pddOrderItemList = this.pddOrderItemList;
          console.log('====提交表单====',this.form)
          confirmOrder(this.form).then(response => {
            this.$modal.msgSuccess("订单确认成功");
            this.open = false;
            this.getList();
          });

          }
      })
    },
	  /** 拼多多订单明细序号 */
    rowPddOrderItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 拼多多订单明细添加按钮操作 */
    handleAddPddOrderItem() {
      let obj = {};
      obj.erpGoodsId = "";
      obj.erpSpecId = "";
      obj.goodsName = "";
      obj.goodsImage = "";
      obj.goodsNum = "";
      obj.goodsSpec = "";
      obj.specNum = "";
      obj.goodsPrice = "";
      obj.itemAmount = "";
      obj.quantity = "";
      obj.remark = "";
      obj.isGift = "";
      obj.goodId = "";
      obj.skuId = "";
      obj.refundCount = "";
      this.pddOrderItemList.push(obj);
    },
    /** 拼多多订单明细删除按钮操作 */
    handleDeletePddOrderItem() {
      if (this.checkedPddOrderItem.length == 0) {
        this.$modal.msgError("请先选择要删除的拼多多订单明细数据");
      } else {
        const pddOrderItemList = this.pddOrderItemList;
        const checkedPddOrderItem = this.checkedPddOrderItem;
        this.pddOrderItemList = pddOrderItemList.filter(function(item) {
          return checkedPddOrderItem.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handlePddOrderItemSelectionChange(selection) {
      this.checkedPddOrderItem = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('pdd/order/export', {
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
      const spec = this.skuList.find(x => x.id === row.erpSpecId);
      if (spec) {
        console.log('=========', spec)
        row.erpGoodsId = spec.goodsId

        row.goodsPrice = spec.purPrice
        row.goodsSpec = spec.colorValue + ' ' + spec.sizeValue + ' ' + spec.styleValue
        row.goodsImage = spec.colorImage
        row.goodsNum = spec.number
        row.goodsName = spec.name
        row.specNum = spec.specNum
        row.isGift = '0'
        row.quantity = 1
        row.refundCount = 0
        row.itemAmount = row.goodsPrice * row.quantity

        // 计算总金额
        let goodsAmount = this.form.goodsAmount ? parseFloat(this.form.goodsAmount):0.0
        goodsAmount += row.itemAmount
        this.form.goodsAmount = goodsAmount
      }
    },
    qtyChange(row) {
      console.log('======值变化=====', row)
      row.itemAmount = row.goodsPrice * row.quantity
      // 计算总金额
      let goodsAmountNew =0.0
      this.form.itemList.forEach(x=>{
        goodsAmountNew+= row.itemAmount
      })
      this.form.goodsAmount = goodsAmountNew

    },
        /** 售后按钮 */
    handleRefund(row,item){
      console.log('售后====',row,item)
      this.saleAfterForm.orderId = item.orderId
      this.saleAfterForm.orderItemId = item.id
      this.saleAfterForm.orderSn = row.orderSn
      this.saleAfterForm.goodsImage = item.goodsImage
      this.saleAfterForm.goodsName = item.goodsName
      this.saleAfterForm.goodsSpec = item.goodsSpec
      this.saleAfterForm.refundQty = item.quantity
      this.saleAfterForm.quantity = item.quantity
      this.saleAfterForm.itemAmount = item.itemAmount
      this.saleAfterForm.refundAmount = item.itemAmount


      this.saleAfterOpen = true
    },
    submitRefundForm() {
      this.$refs["refundForm"].validate(valid => {
        if (valid) {
          addPddRefund(this.saleAfterForm).then(resp =>{
            console.log('=====售后添加成功=====',resp)
            this.$modal.msgSuccess("退款添加成功");
            this.saleAfterOpen = false
          })
        }
      })
    },
  }
};
</script>

