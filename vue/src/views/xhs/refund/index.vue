<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="小红书店铺售后id" prop="returnsId">
        <el-input
          v-model="queryParams.returnsId"
          placeholder="请输入小红书店铺售后id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="售后原因id" prop="reasonId">
        <el-input
          v-model="queryParams.reasonId"
          placeholder="请输入售后原因id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="shopId">
        <el-input
          v-model="queryParams.shopId"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="售后原因说明" prop="reason">
        <el-input
          v-model="queryParams.reason"
          placeholder="请输入售后原因说明"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单id" prop="packageId">
        <el-input
          v-model="queryParams.packageId"
          placeholder="请输入订单id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="换货订单id" prop="exchangePackageId">
        <el-input
          v-model="queryParams.exchangePackageId"
          placeholder="请输入换货订单id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="createdTime">
        <el-input
          v-model="queryParams.createdTime"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="returnExpressNo">
        <el-input
          v-model="queryParams.returnExpressNo"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="returnExpressCompany">
        <el-input
          v-model="queryParams.returnExpressCompany"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="returnAddress">
        <el-input
          v-model="queryParams.returnAddress"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否需要寄回 1-需要 0-不需要" prop="shipNeeded">
        <el-input
          v-model="queryParams.shipNeeded"
          placeholder="请输入是否需要寄回 1-需要 0-不需要"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否已退款" prop="refunded">
        <el-input
          v-model="queryParams.refunded"
          placeholder="请输入是否已退款"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="退款时间" prop="refundTime">
        <el-input
          v-model="queryParams.refundTime"
          placeholder="请输入退款时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="fillExpressTime">
        <el-input
          v-model="queryParams.fillExpressTime"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="expressSignTime">
        <el-input
          v-model="queryParams.expressSignTime"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="refundFee">
        <el-input
          v-model="queryParams.refundFee"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="returnExpressRefundable">
        <el-input
          v-model="queryParams.returnExpressRefundable"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="returnExpressRefunded">
        <el-input
          v-model="queryParams.returnExpressRefunded"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="expectRefundFee">
        <el-input
          v-model="queryParams.expectRefundFee"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="自动确认收货时间" prop="autoReceiveDeadline">
        <el-input
          v-model="queryParams.autoReceiveDeadline"
          placeholder="请输入自动确认收货时间"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="updateTime">
        <el-input
          v-model="queryParams.updateTime"
          placeholder="请输入${comment}"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="退货快递公司编号" prop="returnExpressCompanyCode">
        <el-input
          v-model="queryParams.returnExpressCompanyCode"
          placeholder="请输入退货快递公司编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="${comment}" prop="createOn">
        <el-date-picker clearable
          v-model="queryParams.createOn"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择${comment}">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="${comment}" prop="modifyOn">
        <el-date-picker clearable
          v-model="queryParams.modifyOn"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择${comment}">
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['xhs:xhsRefund:add']"
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
          v-hasPermi="['xhs:xhsRefund:edit']"
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
          v-hasPermi="['xhs:xhsRefund:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['xhs:xhsRefund:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="xhsRefundList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="${comment}" align="center" prop="id" />
      <el-table-column label="小红书店铺售后id" align="center" prop="returnsId" />
      <el-table-column label="退货类型 1-退货退款, 2-换货, 3:仅退款(old) 4:仅退款(new) 理论上不会有3出现 5:未发货仅退款" align="center" prop="returnType" />
      <el-table-column label="售后原因id" align="center" prop="reasonId" />
      <el-table-column label="${comment}" align="center" prop="shopId" />
      <el-table-column label="售后原因说明" align="center" prop="reason" />
      <el-table-column label="售后状态 1:待审核 2:待用户寄回 3:待收货 4:完成 5:取消 6:关闭 9:拒绝 9999:删除" align="center" prop="status" />
      <el-table-column label="售后子状态 301-待审核 302-快递已签收 304-收货异常" align="center" prop="subStatus" />
      <el-table-column label="收货异常类型" align="center" prop="receiveAbnormalType" />
      <el-table-column label="订单id" align="center" prop="packageId" />
      <el-table-column label="换货订单id" align="center" prop="exchangePackageId" />
      <el-table-column label="${comment}" align="center" prop="createdTime" />
      <el-table-column label="${comment}" align="center" prop="returnExpressNo" />
      <el-table-column label="${comment}" align="center" prop="returnExpressCompany" />
      <el-table-column label="${comment}" align="center" prop="returnAddress" />
      <el-table-column label="是否需要寄回 1-需要 0-不需要" align="center" prop="shipNeeded" />
      <el-table-column label="是否已退款" align="center" prop="refunded" />
      <el-table-column label="退款状态 108触发退款 1退款中 3退款失败 2退款成功 401已取消 101已创建 201待审核 301审核通过 302审核不通过 402自动关闭" align="center" prop="refundStatus" />
      <el-table-column label="退款时间" align="center" prop="refundTime" />
      <el-table-column label="${comment}" align="center" prop="fillExpressTime" />
      <el-table-column label="${comment}" align="center" prop="expressSignTime" />
      <el-table-column label="${comment}" align="center" prop="refundFee" />
      <el-table-column label="${comment}" align="center" prop="returnExpressRefundable" />
      <el-table-column label="${comment}" align="center" prop="returnExpressRefunded" />
      <el-table-column label="${comment}" align="center" prop="expectRefundFee" />
      <el-table-column label="自动确认收货时间" align="center" prop="autoReceiveDeadline" />
      <el-table-column label="${comment}" align="center" prop="updateTime" />
      <el-table-column label="erp系统发货状态" align="center" prop="erpSendStatus" />
      <el-table-column label="退货快递公司编号" align="center" prop="returnExpressCompanyCode" />
      <el-table-column label="${comment}" align="center" prop="createOn" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createOn, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="${comment}" align="center" prop="modifyOn" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.modifyOn, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['xhs:xhsRefund:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['xhs:xhsRefund:remove']"
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

    <!-- 添加或修改小红书订单退款对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="小红书店铺售后id" prop="returnsId">
          <el-input v-model="form.returnsId" placeholder="请输入小红书店铺售后id" />
        </el-form-item>
        <el-form-item label="售后原因id" prop="reasonId">
          <el-input v-model="form.reasonId" placeholder="请输入售后原因id" />
        </el-form-item>
        <el-form-item label="${comment}" prop="shopId">
          <el-input v-model="form.shopId" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="售后原因说明" prop="reason">
          <el-input v-model="form.reason" placeholder="请输入售后原因说明" />
        </el-form-item>
        <el-form-item label="订单id" prop="packageId">
          <el-input v-model="form.packageId" placeholder="请输入订单id" />
        </el-form-item>
        <el-form-item label="换货订单id" prop="exchangePackageId">
          <el-input v-model="form.exchangePackageId" placeholder="请输入换货订单id" />
        </el-form-item>
        <el-form-item label="${comment}" prop="createdTime">
          <el-input v-model="form.createdTime" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="returnExpressNo">
          <el-input v-model="form.returnExpressNo" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="returnExpressCompany">
          <el-input v-model="form.returnExpressCompany" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="returnAddress">
          <el-input v-model="form.returnAddress" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="是否需要寄回 1-需要 0-不需要" prop="shipNeeded">
          <el-input v-model="form.shipNeeded" placeholder="请输入是否需要寄回 1-需要 0-不需要" />
        </el-form-item>
        <el-form-item label="是否已退款" prop="refunded">
          <el-input v-model="form.refunded" placeholder="请输入是否已退款" />
        </el-form-item>
        <el-form-item label="退款时间" prop="refundTime">
          <el-input v-model="form.refundTime" placeholder="请输入退款时间" />
        </el-form-item>
        <el-form-item label="${comment}" prop="fillExpressTime">
          <el-input v-model="form.fillExpressTime" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="expressSignTime">
          <el-input v-model="form.expressSignTime" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="refundFee">
          <el-input v-model="form.refundFee" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="returnExpressRefundable">
          <el-input v-model="form.returnExpressRefundable" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="returnExpressRefunded">
          <el-input v-model="form.returnExpressRefunded" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="${comment}" prop="expectRefundFee">
          <el-input v-model="form.expectRefundFee" placeholder="请输入${comment}" />
        </el-form-item>
        <el-form-item label="自动确认收货时间" prop="autoReceiveDeadline">
          <el-input v-model="form.autoReceiveDeadline" placeholder="请输入自动确认收货时间" />
        </el-form-item>
        <el-form-item label="退货快递公司编号" prop="returnExpressCompanyCode">
          <el-input v-model="form.returnExpressCompanyCode" placeholder="请输入退货快递公司编号" />
        </el-form-item>
        <el-form-item label="${comment}" prop="createOn">
          <el-date-picker clearable
            v-model="form.createOn"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择${comment}">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="${comment}" prop="modifyOn">
          <el-date-picker clearable
            v-model="form.modifyOn"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择${comment}">
          </el-date-picker>
        </el-form-item>
        <el-divider content-position="center">小红书订单退款明细信息</el-divider>
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddXhsRefundItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteXhsRefundItem">删除</el-button>
          </el-col>
        </el-row>
        <el-table :data="xhsRefundItemList" :row-class-name="rowXhsRefundItemIndex" @selection-change="handleXhsRefundItemSelectionChange" ref="xhsRefundItem">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品id" prop="itemId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemId" placeholder="请输入商品id" />
            </template>
          </el-table-column>
          <el-table-column label="商品名" prop="itemName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemName" placeholder="请输入商品名" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="price" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.price" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="boughtCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.boughtCount" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="appliedCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.appliedCount" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="returnedCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.returnedCount" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="refundedCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.refundedCount" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="returnPrice" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.returnPrice" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="exchangeItemId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.exchangeItemId" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="exchangeItemName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.exchangeItemName" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="skucode" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skucode" placeholder="请输入$comment" />
            </template>
          </el-table-column>
          <el-table-column label="$comment" prop="exchangeSkucode" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.exchangeSkucode" placeholder="请输入$comment" />
            </template>
          </el-table-column>
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listXhsRefund, getXhsRefund, delXhsRefund, addXhsRefund, updateXhsRefund } from "@/api/xhs/xhsRefund";

export default {
  name: "XhsRefund",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedXhsRefundItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 小红书订单退款表格数据
      xhsRefundList: [],
      // 小红书订单退款明细表格数据
      xhsRefundItemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        returnsId: null,
        returnType: null,
        reasonId: null,
        shopId: null,
        reason: null,
        status: null,
        subStatus: null,
        receiveAbnormalType: null,
        packageId: null,
        exchangePackageId: null,
        createdTime: null,
        returnExpressNo: null,
        returnExpressCompany: null,
        returnAddress: null,
        shipNeeded: null,
        refunded: null,
        refundStatus: null,
        refundTime: null,
        fillExpressTime: null,
        expressSignTime: null,
        refundFee: null,
        returnExpressRefundable: null,
        returnExpressRefunded: null,
        expectRefundFee: null,
        autoReceiveDeadline: null,
        updateTime: null,
        erpSendStatus: null,
        returnExpressCompanyCode: null,
        createOn: null,
        modifyOn: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        returnsId: [
          { required: true, message: "小红书店铺售后id不能为空", trigger: "blur" }
        ],
        returnType: [
          { required: true, message: "退货类型 1-退货退款, 2-换货, 3:仅退款(old) 4:仅退款(new) 理论上不会有3出现 5:未发货仅退款不能为空", trigger: "change" }
        ],
        shopId: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        reason: [
          { required: true, message: "售后原因说明不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "售后状态 1:待审核 2:待用户寄回 3:待收货 4:完成 5:取消 6:关闭 9:拒绝 9999:删除不能为空", trigger: "change" }
        ],
        packageId: [
          { required: true, message: "订单id不能为空", trigger: "blur" }
        ],
        createdTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        shipNeeded: [
          { required: true, message: "是否需要寄回 1-需要 0-不需要不能为空", trigger: "blur" }
        ],
        refunded: [
          { required: true, message: "是否已退款不能为空", trigger: "blur" }
        ],
        refundStatus: [
          { required: true, message: "退款状态 108触发退款 1退款中 3退款失败 2退款成功 401已取消 101已创建 201待审核 301审核通过 302审核不通过 402自动关闭不能为空", trigger: "change" }
        ],
        refundTime: [
          { required: true, message: "退款时间不能为空", trigger: "blur" }
        ],
        fillExpressTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        expressSignTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        refundFee: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        returnExpressRefundable: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        returnExpressRefunded: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        expectRefundFee: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        autoReceiveDeadline: [
          { required: true, message: "自动确认收货时间不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        erpSendStatus: [
          { required: true, message: "erp系统发货状态不能为空", trigger: "change" }
        ],
        createOn: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        modifyOn: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询小红书订单退款列表 */
    getList() {
      this.loading = true;
      listXhsRefund(this.queryParams).then(response => {
        this.xhsRefundList = response.rows;
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
        returnsId: null,
        returnType: null,
        reasonId: null,
        shopId: null,
        reason: null,
        status: null,
        subStatus: null,
        receiveAbnormalType: null,
        packageId: null,
        exchangePackageId: null,
        createdTime: null,
        returnExpressNo: null,
        returnExpressCompany: null,
        returnAddress: null,
        shipNeeded: null,
        refunded: null,
        refundStatus: null,
        refundTime: null,
        fillExpressTime: null,
        expressSignTime: null,
        refundFee: null,
        returnExpressRefundable: null,
        returnExpressRefunded: null,
        expectRefundFee: null,
        autoReceiveDeadline: null,
        updateTime: null,
        erpSendStatus: null,
        returnExpressCompanyCode: null,
        createOn: null,
        modifyOn: null
      };
      this.xhsRefundItemList = [];
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
      this.title = "添加小红书订单退款";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getXhsRefund(id).then(response => {
        this.form = response.data;
        this.xhsRefundItemList = response.data.xhsRefundItemList;
        this.open = true;
        this.title = "修改小红书订单退款";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.xhsRefundItemList = this.xhsRefundItemList;
          if (this.form.id != null) {
            updateXhsRefund(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addXhsRefund(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除小红书订单退款编号为"' + ids + '"的数据项？').then(function() {
        return delXhsRefund(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
	/** 小红书订单退款明细序号 */
    rowXhsRefundItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 小红书订单退款明细添加按钮操作 */
    handleAddXhsRefundItem() {
      let obj = {};
      obj.itemId = "";
      obj.itemName = "";
      obj.image = "";
      obj.price = "";
      obj.boughtCount = "";
      obj.appliedCount = "";
      obj.returnedCount = "";
      obj.refundedCount = "";
      obj.returnPrice = "";
      obj.exchangeItemId = "";
      obj.exchangeItemName = "";
      obj.exchangeItemImage = "";
      obj.skucode = "";
      obj.exchangeSkucode = "";
      this.xhsRefundItemList.push(obj);
    },
    /** 小红书订单退款明细删除按钮操作 */
    handleDeleteXhsRefundItem() {
      if (this.checkedXhsRefundItem.length == 0) {
        this.$modal.msgError("请先选择要删除的小红书订单退款明细数据");
      } else {
        const xhsRefundItemList = this.xhsRefundItemList;
        const checkedXhsRefundItem = this.checkedXhsRefundItem;
        this.xhsRefundItemList = xhsRefundItemList.filter(function(item) {
          return checkedXhsRefundItem.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleXhsRefundItemSelectionChange(selection) {
      this.checkedXhsRefundItem = selection.map(item => item.index)
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('xhs/xhsRefund/export', {
        ...this.queryParams
      }, `xhsRefund_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
