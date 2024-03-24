<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单编号"
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
      <el-form-item label="手机号" prop="postTel">
        <el-input
          v-model="queryParams.postTel"
          placeholder="请输入收件人手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="物流单号" prop="logisticsCode">
        <el-input
          v-model="queryParams.logisticsCode"
          placeholder="请输入物流单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="下单时间" prop="orderCreateTime">
        <el-date-picker clearable
          v-model="queryParams.orderCreateTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单创建时间">
        </el-date-picker>
      </el-form-item>

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
          v-hasPermi="['dou:order:remove']"
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
<!--      <el-table-column label="订单id，自增" align="center" prop="id" />-->
      <el-table-column label="订单编号" align="center" prop="orderId" />
      <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span v-if="scope.row.shopId==22">梦小妮牛仔裤</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" width="350">
          <template slot-scope="scope">
            <el-row v-for="item in scope.row.douOrderItemList" :key="item.id" :gutter="20">

            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="item.productPic"></el-image>
              <div style="margin-left:10px">
              <p>{{item.productName}}</p>
              <p>{{item.goodsSpec}}&nbsp;
                <el-tag size="small">x {{item.comboNum}}</el-tag>
                <el-button v-if="item.itemStatus === 0" type="text" size="mini" round @click="handleRefund(scope.row,item)">售后</el-button>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="orderTotalAmount" />
      <el-table-column label="运费" align="center" prop="postAmount" />
<!--      <el-table-column label="买家用户名" align="center" prop="userName" />-->
      <!-- <el-table-column label="收货地址" align="center" prop="postAddr" /> -->
<!--      <el-table-column label="邮政编码" align="center" prop="postCode" />-->
      <el-table-column label="收件人" align="center" prop="postReceiver" />
<!--      <el-table-column label="收件人电话" align="center" prop="postTel" />-->
      <el-table-column label="买家备注" align="center" prop="buyerWords" />
      <el-table-column label="卖家备注" align="center" prop="sellerWords" />
<!--      <el-table-column label="物流公司id" align="center" prop="logisticsId" />-->
      <el-table-column label="物流单号" align="center" prop="logisticsCode" />
      <!-- <el-table-column label="物流公司" align="center" prop="logisticsCompany" /> -->
      <!-- <el-table-column label="发货时间" align="center" prop="logisticsTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.logisticsTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收货时间" align="center" prop="receiptTime" /> -->
      <el-table-column label="订单状态" align="center" prop="orderStatus" >
        <template slot-scope="scope">
          <!-- 订单状态1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消5 已完成（已收货） -->
          <el-tag size="small" v-if="scope.row.orderStatus === 1"> 待支付</el-tag>
          <el-tag size="small" v-if="scope.row.orderStatus === 2"> 备货中</el-tag>
          <el-tag size="small" v-if="scope.row.orderStatus === 3"> 已发货</el-tag>
          <el-tag size="small" v-if="scope.row.orderStatus === 4"> 已取消</el-tag>
          <el-tag size="small" v-if="scope.row.orderStatus === 5"> 已完成</el-tag>
          <span></span>

          <el-tag size="small" v-if="scope.row.auditStatus === 0" style="margin-top: 5px;"> 待确认</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 1" style="margin-top: 5px;"> 已确认</el-tag>
          <el-tag size="small" v-if="scope.row.auditStatus === 2" style="margin-top: 5px;"> 已拦截</el-tag>

        </template>
      </el-table-column>
      <!-- <el-table-column label="订单状态" align="center" prop="orderStatusStr" /> -->
      <el-table-column label="订单创建时间" align="center" prop="orderCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderCreateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="最晚发货时间" align="center" prop="expShipTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expShipTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
<!--      <el-table-column label="订单取消原因" align="center" prop="cancelReason" />-->
<!--      <el-table-column label="【支付类型" align="center" prop="payType" />-->
      <!-- <el-table-column label="支付方式" align="center" prop="payTypeName" /> -->
<!--      <el-table-column label="支付时间 (pay_type为0货到付款时, 此字段为空)" align="center" prop="payTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->

      <!-- <el-table-column label="平台优惠券金额 (单位: 分)" align="center" prop="couponAmount" /> -->
      <!-- <el-table-column label="商家优惠券金额 (单位: 分)" align="center" prop="shopCouponAmount" /> -->
<!--      <el-table-column label="优惠券详情 (type为优惠券类型, credit为优惠金额,单位分)" align="center" prop="couponInfo" />-->

<!--      <el-table-column label="运费险金额" align="center" prop="postInsuranceAmount" />-->
      <!-- <el-table-column label="是否评价 (1:已评价)" align="center" prop="isComment" /> -->
      <!-- <el-table-column label="订单佣金 (详情见附录)" align="center" prop="cType" /> -->
<!--      <el-table-column label="订单渠道 (站外0 火山1 抖音2 头条3 西瓜4 微信5 闪购6 头条lite版本7 懂车帝8 皮皮虾9)" align="center" prop="bType" />-->
<!--      <el-table-column label="app渠道" align="center" prop="appSource" />-->
<!--      <el-table-column label="流量来源" align="center" prop="trafficeSource" />-->
<!--      <el-table-column label="佣金率" align="center" prop="cosRatio" />-->
<!--      <el-table-column label="创建时间" align="center" prop="createdTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.createdTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
     <!--  <el-table-column label="发货状态" align="center" prop="sendStatus" />
      <el-table-column label="发货时间" align="center" prop="sendTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.sendTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column> -->
      <!-- <el-table-column label="订单审核状态" align="center" prop="auditStatus" /> -->
<!--      <el-table-column label="加密地址详情" align="center" prop="encryptDetail" />-->
      <!-- <el-table-column label="省" align="center" prop="province" /> -->
      <!-- <el-table-column label="市" align="center" prop="city" /> -->
      <!-- <el-table-column label="区" align="center" prop="town" /> -->
      <!-- <el-table-column label="街道" align="center" prop="street" /> -->
<!--      <el-table-column label="发货时间" align="center" prop="shipTime" />-->
<!--      <el-table-column label="0、普通 1、拼团 2、定金预售 3、订金找贷 4、拍卖 5、0元单 6、回收 7、寄卖" align="center" prop="tradeType" />-->
<!--      <el-table-column label="加密电话" align="center" prop="encryptPostTel" />-->
<!--      <el-table-column label="加密联系人" align="center" prop="encryptPostReceiver" />-->
<!--      <el-table-column label="打单结果" align="center" prop="result" />-->
<!--      <el-table-column label="打印状态" align="center" prop="printStatus" />-->
<!--      <el-table-column label="打印日期" align="center" prop="printTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.printTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="号码检索串" align="center" prop="phoneKey" />-->
<!--      <el-table-column label="地址检索串" align="center" prop="addressKey" />-->
<!--      <el-table-column label="达人id" align="center" prop="authorId" />-->
<!--      <el-table-column label="${comment}" align="center" prop="authorName" />-->
<!--      <el-table-column label="是否结算" align="center" prop="settlementStatus" />-->
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.auditStatus === 0"
            size="mini"
            type="success"
            icon="el-icon-success"
            @click="handleConfirm(scope.row)"
            v-hasPermi="['dou:order:edit']"
          >确认订单</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleDetail(scope.row)"
            v-hasPermi="['dou:order:remove']"
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

    <!-- 添加或修改抖店订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="180px" inline>
        <el-form-item label="抖音订单ID" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入抖音订单id" style="width:250px"/>
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
        <!-- <el-form-item label="买家用户名" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入买家用户名" />
        </el-form-item> -->
        <el-form-item label="省市区" prop="provinces">
          <el-cascader style="width:250px"
            size="large"
            :options="pcaTextArr"
            v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <el-form-item label="详细地址" prop="postAddr">
          <el-input v-model="form.postAddr" placeholder="请输入详细地址" style="width:250px" />
        </el-form-item>
        <!-- <el-form-item label="邮政编码" prop="postCode">
          <el-input v-model="form.postCode" placeholder="请输入邮政编码" />
        </el-form-item> -->
        <el-form-item label="收件人姓名" prop="postReceiver">
          <el-input v-model="form.postReceiver" placeholder="请输入收件人姓名" style="width:250px"/>
        </el-form-item>
        <el-form-item label="收件人电话" prop="postTel">
          <el-input v-model="form.postTel" placeholder="请输入收件人电话" style="width:250px"/>
        </el-form-item>
        <el-form-item label="买家备注" prop="buyerWords">
          <el-input type="textarea" v-model="form.buyerWords" placeholder="请输入买家备注" style="width:250px"/>
        </el-form-item>
        <el-form-item label="卖家备注" prop="sellerWords">
          <el-input type="textarea" v-model="form.sellerWords" placeholder="请输入卖家备注" style="width:250px"/>
        </el-form-item>

        <el-form-item label="订单创建时间" prop="orderCreateTime">
          <el-date-picker clearable style="width:250px"
            v-model="form.orderCreateTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择订单创建时间">
          </el-date-picker>
        </el-form-item>


        <el-divider content-position="center">订单商品</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddDouOrderItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteDouOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="douOrderItemList" :row-class-name="rowDouOrderItemIndex" @selection-change="handleDouOrderItemSelectionChange" ref="douOrderItem" style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350" v-if="!isAudit" >
            <template slot-scope="scope">
              <el-select v-model="scope.row.erpSpecId" filterable remote reserve-keyword placeholder="搜索商品" style="width: 330px;"
                :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                  :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"
                  :value="item.id">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="商品图片" prop="goodsImage" >
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.productPic"></el-image>
            </template>
          </el-table-column>
          <!-- <el-table-column label="商品名称" prop="productName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productName" placeholder="请输入商品名称" />
            </template>
          </el-table-column>
          <el-table-column label="商品编码" prop="goodsNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsNum" placeholder="请输入商品编码" />
            </template>
          </el-table-column> -->
          <el-table-column label="规格编码" prop="specNum" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNum" disabled/>
            </template>
          </el-table-column>
          <el-table-column label="单价" prop="price">
            <template slot-scope="scope" >
              <el-input v-model="scope.row.price" placeholder="请输入商品单价" disabled />
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="comboNum">
            <template slot-scope="scope">
              <el-input v-model="scope.row.comboNum" placeholder="请输入数量"  @input="qtyChange(scope.row)" :disabled="isAudit"/>
            </template>
          </el-table-column>

          <el-table-column label="总金额" prop="totalAmount" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.totalAmount" placeholder="请输入总金额 " disabled/>
            </template>
          </el-table-column>


<!--           <el-table-column label="是否赠品0否1是" prop="isGift" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.isGift" placeholder="请输入是否赠品0否1是" />
            </template>
          </el-table-column> -->

        </el-table>

         <el-form-item label="邮费金额 (单位: 分)" prop="postAmount">
          <el-input v-model="form.postAmount" placeholder="请输入邮费金额" style="width:250px"/>
        </el-form-item>
        <el-form-item label="平台优惠券金额 (单位: 分)" prop="couponAmount">
          <el-input v-model="form.couponAmount" placeholder="请输入平台优惠券金额 " style="width:250px"/>
        </el-form-item>
        <el-form-item label="商家优惠券金额 (单位: 分)" prop="shopCouponAmount">
          <el-input v-model="form.shopCouponAmount" placeholder="请输入商家优惠券金额" style="width:250px"/>
        </el-form-item>

        <el-form-item label="订单总金额 (单位: 分) " prop="orderTotalAmount">
          <el-input v-model="form.orderTotalAmount" placeholder="请输入订单总金额 (不包含运费" style="width:250px"/>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 订单审核、订单详情对话框 -->
    <el-dialog :title="detailTitle" :visible.sync="detailOpen" width="1000px" append-to-body >
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" inline>
        <el-descriptions title="订单信息">
          <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
          <el-descriptions-item label="订单号">{{form.orderId}}</el-descriptions-item>
          <el-descriptions-item label="店铺">
            {{ shopList.find(x=>x.id === form.shopId)?shopList.find(x=>x.id === form.shopId).name:'' }}
          </el-descriptions-item>
          <el-descriptions-item label="订单类型">
            <el-tag size="small" v-if="form.tradeType ===1 ">拼团</el-tag>
            <el-tag size="small" v-if="form.tradeType ===0 ">普通</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="app渠道">
            <el-tag size="small" v-if="form.appSource">{{ form.appSource }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="流量来源">
            <el-tag size="small" v-if="form.trafficeSource">{{ form.trafficeSource }}</el-tag>
          </el-descriptions-item>
<!--          <el-descriptions-item label="成团状态">-->
<!--            <el-tag size="small" v-if="form.groupStatus ===0 ">拼团中</el-tag>-->
<!--            <el-tag size="small" v-if="form.groupStatus ===1 ">已成团</el-tag>-->
<!--            <el-tag size="small" v-if="form.groupStatus ===2 ">团失败</el-tag>-->
<!--          </el-descriptions-item>-->


          <el-descriptions-item label="买家备注">
            {{form.buyerWords}}
          </el-descriptions-item>
          <el-descriptions-item label="卖家备注">
            {{form.sellerWords}}
          </el-descriptions-item>
          <el-descriptions-item label="订单取消原因">
            {{form.cancelReason}}
          </el-descriptions-item>
          <el-descriptions-item label="创建时间">
            {{ form.orderCreateTime }}
          </el-descriptions-item>
          <el-descriptions-item label="最晚发货时间"> {{ form.expShipTime }}</el-descriptions-item>
          <el-descriptions-item label="支付时间"> {{ form.payTime }}</el-descriptions-item>

          <el-descriptions-item label="订单状态">
<!--            订单状态1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消5 已完成（已收货）-->
            <el-tag v-if="form.orderStatus === 1" style="margin-bottom: 6px;">待支付</el-tag>
            <el-tag v-if="form.orderStatus === 2" style="margin-bottom: 6px;">备货中</el-tag>
            <el-tag v-if="form.orderStatus === 3" style="margin-bottom: 6px;">已发货</el-tag>
          </el-descriptions-item>
<!--          <el-descriptions-item label="退款状态">-->
<!--            <el-tag v-if="form.refundStatus === 1">无售后或售后关闭</el-tag>-->
<!--            <el-tag v-if="form.refundStatus === 2">售后处理中</el-tag>-->
<!--            <el-tag v-if="form.refundStatus === 3">退款中</el-tag>-->
<!--            <el-tag v-if="form.refundStatus === 4">退款成功</el-tag>-->
<!--          </el-descriptions-item>-->

        </el-descriptions>
        <el-descriptions title="付款信息">
<!--          <el-descriptions-item label="商品总额">{{form.goodsAmount}}</el-descriptions-item>-->
<!--          <el-descriptions-item label="团长免单金额">{{form.capitalFreeDiscount}}</el-descriptions-item>-->
          <el-descriptions-item label="商家优惠金额">{{form.shopCouponAmount}}</el-descriptions-item>
          <el-descriptions-item label="平台优惠金额">{{form.couponAmount}}</el-descriptions-item>
          <el-descriptions-item label="运费">{{form.postAmount}}</el-descriptions-item>
          <el-descriptions-item label="实际支付金额">{{form.orderTotalAmount}}</el-descriptions-item>
          <el-descriptions-item label="支付方式"> {{ form.payTypeName }}</el-descriptions-item>
        </el-descriptions>


        <el-descriptions title="收货信息">
          <el-descriptions-item label="收件人姓名">{{form.postReceiver}}</el-descriptions-item>
          <el-descriptions-item label="收件人手机号">{{form.postTel}}</el-descriptions-item>
          <el-descriptions-item label="省市区">{{form.province}}{{form.city}}{{form.town}}</el-descriptions-item>
          <el-descriptions-item label="详细地址">{{form.postAddr}}</el-descriptions-item>
        </el-descriptions>
        <el-descriptions title="发货信息">
          <!-- <el-descriptions-item label="发货方式">
            <el-tag v-if="form.shipType === 1"  type="danger">供应商代发</el-tag>
              <el-tag v-if="form.shipType === 0" type="danger">仓库发货</el-tag>
          </el-descriptions-item> -->
          <el-descriptions-item label="物流公司">{{form.logisticsCompany}}</el-descriptions-item>
          <el-descriptions-item label="物流单号">{{form.logisticsCode}}</el-descriptions-item>
          <el-descriptions-item label="发货时间">{{form.logisticsTime}}</el-descriptions-item>
        </el-descriptions>
        <el-divider content-position="center">订单商品</el-divider>
        <el-table :data="goodsList"  style="margin-bottom: 10px;">
          <el-table-column label="序号" align="center" type="index" width="50"/>

          <el-table-column label="商品图片" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.productPic"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="productName" ></el-table-column>
          <el-table-column label="SKU" prop="goodsSpec" width="150"></el-table-column>
          <el-table-column label="sku编码" prop="specNum"></el-table-column>
          <el-table-column label="单价" prop="goodsPrice"></el-table-column>
          <el-table-column label="数量" prop="comboNum"></el-table-column>
          <el-table-column label="商品金额" prop="totalAmount"></el-table-column>
        </el-table>
        <el-row :gutter="10" class="mb8" v-if="isAudit">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddDouOrderItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteDouOrderItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="douOrderItemList" v-if="isAudit" :row-class-name="rowDouOrderItemIndex" @selection-change="handleDouOrderItemSelectionChange" ref="douOrderItem" style="margin-bottom: 10px;">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品" prop="erpGoodsId" width="350" >
            <template slot-scope="scope">
              <el-select v-model="scope.row.erpSpecId" filterable remote reserve-keyword placeholder="搜索商品" style="width: 330px;"
                         :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                           :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"
                           :value="item.id">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="商品图片" prop="goodsImage" >
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.productPic"></el-image>
            </template>
          </el-table-column>
          <!-- <el-table-column label="商品名称" prop="productName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.productName" placeholder="请输入商品名称" />
            </template>
          </el-table-column>
          <el-table-column label="商品编码" prop="goodsNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsNum" placeholder="请输入商品编码" />
            </template>
          </el-table-column> -->
          <el-table-column label="规格编码" prop="specNum" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNum" />
            </template>
          </el-table-column>
          <el-table-column label="单价" prop="price">
            <template slot-scope="scope" >
              <el-input v-model="scope.row.price" placeholder="请输入商品单价"  />
            </template>
          </el-table-column>
          <el-table-column label="数量" prop="comboNum">
            <template slot-scope="scope">
              <el-input v-model="scope.row.comboNum" placeholder="请输入数量"  @input="qtyChange(scope.row)"/>
            </template>
          </el-table-column>

          <el-table-column label="总金额" prop="totalAmount" >
            <template slot-scope="scope">
              <el-input v-model="scope.row.totalAmount" placeholder="请输入总金额 " />
            </template>
          </el-table-column>
        </el-table>

        <el-form-item label="收件人姓名" prop="postReceiver" v-if="isAudit">
          <el-input v-model="form.postReceiver" placeholder="请输入收件人姓名" style="width:250px" />
        </el-form-item>
        <el-form-item label="收件人电话" prop="postTel" v-if="isAudit">
          <el-input v-model="form.postTel" placeholder="请输入收件人电话" style="width:250px" />
        </el-form-item>
        <el-form-item label="省市区" prop="provinces" v-if="isAudit">
          <el-cascader style="width:250px"
                       size="large"
                       :options="pcaTextArr"
                       v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <el-form-item label="详细地址" prop="postAddr" v-if="isAudit">
          <el-input v-model="form.postAddr" placeholder="请输入收件地址" style="width:250px" />
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
        <el-form-item label="订单ID" prop="orderId">
          <el-input v-model.number="saleAfterForm.orderId" placeholder="订单号" style="width:250px" disabled />
        </el-form-item>
        <!-- <el-form-item label="子订单ID" prop="oid">
          <el-input v-model="saleAfterForm.oid" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="商品图片" prop="goodsImage">
          <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="saleAfterForm.productPic"></el-image>
              <div style="margin-left:10px">
              <p>{{saleAfterForm.productName}}</p>
              <p>{{saleAfterForm.goodsSpec}} </p>
              </div>
            </div>
        </el-form-item>
        <!-- <el-form-item label="商品名称" prop="goodsTitle">
          <el-input v-model="saleAfterForm.goodsTitle" placeholder="" style="width:250px" disabled />
        </el-form-item> -->
        <el-form-item label="退款单号" prop="aftersaleId">
          <el-input v-model.number="saleAfterForm.aftersaleId" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="购买数量" prop="quantity">
          <el-input v-model="saleAfterForm.quantity" placeholder="" style="width:250px" disabled />
        </el-form-item>
        <el-form-item label="退货数量" prop="comboNum">
          <el-input v-model.number="saleAfterForm.comboNum" placeholder="" style="width:250px" />
        </el-form-item>
        <el-form-item label="总金额" prop="itemAmount">
          <el-input v-model="saleAfterForm.itemAmount" placeholder="" style="width:250px" disabled/>
        </el-form-item>
        <el-form-item label="退款金额" prop="comboAmount">
          <el-input type="number" v-model.number="saleAfterForm.comboAmount" placeholder="请输入退款金额" style="width:250px"/>
        </el-form-item>
        <el-form-item label="退款类型" prop="aftersaleType">
          <el-select v-model="saleAfterForm.aftersaleType" placeholder="退款类型" style="width:250px" >
           <el-option value="1" label="已发货仅退款"></el-option>
           <el-option value="0" label="退货退款"></el-option>
           <el-option value="2" label="未发货仅退款"></el-option>
           <el-option value="3" label="换货"></el-option>
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
import { listOrder, getOrder, delOrder, addOrder, confirmOrder,pullOrder } from "@/api/dou/order";
import { addDouRefund } from "@/api/dou/douRefund";

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
import {isRelogin} from "@/utils/request";
export default {
  name: "OrderDou",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedDouOrderItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 抖店订单表格数据
      orderList: [],
      // 抖店订单明细表格数据
      douOrderItemList: [],
      shopList:[],
      isAudit:false,
      detailOpen:false,
      detailTitle:'',
      skuListLoading:false,
      skuList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        shopId: null,
        postReceiver: null,
        postTel: null,
        logisticsCode: null,
        logisticsTime: null,
        receiptTime: null,
        orderStatus: null,
        orderStatusStr: null,
        orderCreateTime: null,
        expShipTime: null,
        payTime: null,
        postInsuranceAmount: null,
        isComment: null,
        cType: null,
        bType: null,
        cosRatio: null,
        createdTime: null,
        sendStatus: null,
        sendTime: null,
        auditStatus: null,
        province: null,
      },
      form: {
        provinces: []
      },
      goodsList:[],
      pcaTextArr,
      saleAfterOpen:false,
      // 售后表单
      saleAfterForm:{
        comboNum:null,
        comboAmount:null,
        aftersaleType:null,
        aftersaleId:null
      },
      // 表单校验
      saleAfterRules:{
        aftersaleId: [{ required: true, message: "不能为空", trigger: "blur" }],
        comboNum: [{ required: true, message: "不能为空", trigger: "blur" }],
        comboAmount: [{ required: true, message: "不能为空", trigger: "blur" }],
        aftersaleType: [{ required: true, message: "不能为空", trigger: "change" }],
      },
      // 表单校验
      rules: {
        orderId: [
          { required: true, message: "抖音订单ID不能为空", trigger: "blur" }
        ],
        shopId: [
          { required: true, message: "请选择店铺", trigger: "blur" }
        ],
        provinces: [
          { required: true, message: "请选择省市区", trigger: "blur" }
        ],
        postAddr: [
          { required: true, message: "请填写详细地址", trigger: "change" }
        ],
        postReceiver: [
          { required: true, message: "请填写收件人姓名", trigger: "blur" }
        ],
        postTel: [
          { required: true, message: "请填写收件人手机号", trigger: "blur" }
        ],
        orderCreateTime: [
          { required: true, message: "订单创建时间不能为空", trigger: "blur" }
        ],
        postAmount: [
          { required: true, message: "邮费金额 (单位: 分)不能为空", trigger: "blur" }
        ],
        shipType: [
          { required: true, message: "请选择发货方式", trigger: "blur" }
        ],
        orderTotalAmount: [
          { required: true, message: "实际支付金额（不包含运费）不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    listShop({type:6}).then(response => {
        this.shopList = response.rows;
      });
    this.getList();
  },
  methods: {
    /** 查询抖店订单列表 */
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
      this.detailOpen = false
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderId: null,
        shopId: null,
        userName: null,
        postAddr: null,
        postCode: null,
        postReceiver: null,
        postTel: null,
        buyerWords: null,
        sellerWords: null,
        logisticsId: null,
        logisticsCode: null,
        logisticsCompany: null,
        logisticsTime: null,
        receiptTime: null,
        orderStatus: null,
        orderStatusStr: null,
        orderCreateTime: null,
        expShipTime: null,
        cancelReason: null,
        payType: null,
        payTypeName: null,
        payTime: null,
        postAmount: 0,
        couponAmount: 0,
        shopCouponAmount: 0,
        couponInfo: null,
        orderTotalAmount: null,
        postInsuranceAmount: null,
        isComment: null,
        cType: null,
        bType: null,
        appSource: null,
        trafficeSource: null,
        cosRatio: null,
        createdTime: null,
        updateTime: null,
        sendStatus: null,
        sendTime: null,
        auditStatus: null,
        encryptDetail: null,
        province: null,
        city: null,
        town: null,
        street: null,
        shipTime: null,
        tradeType: null,
        encryptPostTel: null,
        encryptPostReceiver: null,
        result: null,
        printStatus: null,
        printTime: null,
        phoneKey: null,
        addressKey: null,
        authorId: null,
        authorName: null,
        settlementStatus: null
      };
      this.douOrderItemList = [];
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
      this.title = "添加抖店订单";
    },
    handlePull(){

      // this.$modal.msgSuccess("请先配置API参数");
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
    },
    handleImport(){
      // this.$modal.msgSuccess("");
    },
    handleDetail(row){
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;

        this.goodsList = response.data.douOrderItemList;
        this.detailOpen = true;
        this.detailTitle = "订单详情";
        this.isAudit = false
      });

    },
    /** 修改按钮操作 */
    handleConfirm(row) {
      this.reset();
      const id = row.id || this.ids
      getOrder(id).then(response => {
        this.form = response.data;
        this.goodsList = response.data.douOrderItemList;
        this.form.provinces = []
        this.form.provinces.push(response.data.province)
        this.form.provinces.push(response.data.city)
        this.form.provinces.push(response.data.town)
        this.detailOpen = true;
        this.detailTitle = "确认订单";
        this.isAudit = true
      });

    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.province = this.form.provinces[0]
          this.form.city = this.form.provinces[1]
          this.form.town = this.form.provinces[2]
          this.form.douOrderItemList = this.douOrderItemList;
          // if (this.form.id != null) {
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
    submitConfirmForm(){
        this.$refs["form"].validate(valid => {
          if (valid) {
            this.form.province = this.form.provinces[0]
            this.form.city = this.form.provinces[1]
            this.form.town = this.form.provinces[2]
            this.form.douOrderItemList = this.douOrderItemList;

            confirmOrder(this.form).then(response => {
                this.$modal.msgSuccess("订单确认成功");
                this.detailOpen = false;
                this.isAudit = false
                this.getList();
              });

          }
        })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除抖店订单编号为"' + ids + '"的数据项？').then(function() {
        return delOrder(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 抖店订单明细序号 */
    rowDouOrderItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 抖店订单明细添加按钮操作 */
    handleAddDouOrderItem() {
      let obj = {};
      obj.orderId = "";
      obj.subOrderId = "";
      obj.shopId = "";
      obj.productId = "";
      obj.productName = "";
      obj.productPic = "";
      obj.comboId = "";
      obj.goodsNum = "";
      obj.specNum = "";
      obj.goodsSpec = "";
      obj.comboNum = "";
      obj.postAmount = "";
      obj.couponAmount = "";
      obj.couponMetaId = "";
      obj.couponInfo = "";
      obj.campaignInfo = "";
      obj.totalAmount = "";
      obj.isComment = "";
      obj.erpGoodsId = "";
      obj.erpSpecId = "";
      obj.remark = "";
      obj.price = "";
      obj.isGift = "";
      obj.itemStatus = "";
      this.douOrderItemList.push(obj);
    },
    /** 抖店订单明细删除按钮操作 */
    handleDeleteDouOrderItem() {
      if (this.checkedDouOrderItem.length == 0) {
        this.$modal.msgError("请先选择要删除的抖店订单明细数据");
      } else {
        const douOrderItemList = this.douOrderItemList;
        const checkedDouOrderItem = this.checkedDouOrderItem;
        this.douOrderItemList = douOrderItemList.filter(function(item) {
          return checkedDouOrderItem.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleDouOrderItemSelectionChange(selection) {
      this.checkedDouOrderItem = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('dou/order/export', {
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
        row.price = spec.purPrice
        row.goodsSpec = spec.colorValue + ' ' + spec.sizeValue + ' ' + spec.styleValue
        row.productPic = spec.colorImage
        row.goodsNum = spec.number
        row.productName = spec.name
        row.specNum = spec.specNum
        row.isGift = '0'
        row.comboNum = 1
        row.totalAmount = row.price * row.comboNum

        // 计算总金额
        let goodsAmount = this.form.orderTotalAmount ? parseFloat(this.form.orderTotalAmount):0.0
        goodsAmount += row.totalAmount
        this.form.orderTotalAmount = goodsAmount
      }
    },
    qtyChange(row) {
      console.log('======值变化=====', row)
      row.totalAmount = row.price * row.comboNum
      // 计算总金额
      let goodsAmountNew =0.0
      this.douOrderItemList.forEach(x=>{
        goodsAmountNew+= row.totalAmount
      })
      this.form.orderTotalAmount = goodsAmountNew

    },
    /** 售后按钮 */
    handleRefund(row,item){
      console.log('售后====',row,item)
      this.saleAfterForm.orderId = item.orderId
      this.saleAfterForm.subOrderId = item.subOrderId

      this.saleAfterForm.productPic = item.productPic
      this.saleAfterForm.productName = item.productName
      this.saleAfterForm.goodsSpec = item.goodsSpec
      this.saleAfterForm.quantity = item.comboNum
      this.saleAfterForm.comboNum = item.comboNum
      this.saleAfterForm.itemAmount = item.totalAmount
      this.saleAfterForm.comboAmount = item.totalAmount


      this.saleAfterOpen = true
    },
    submitRefundForm() {
      this.$refs["refundForm"].validate(valid => {
        if (valid) {
          addDouRefund(this.saleAfterForm).then(resp =>{
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
