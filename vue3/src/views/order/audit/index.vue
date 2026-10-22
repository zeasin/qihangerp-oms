<template>
  <div class="app-container audit-workbench">
    <!-- 状态池页签 -->
    <el-tabs v-model="activePool" class="pool-tabs" @tab-change="handlePoolChange">
      <el-tab-pane v-for="p in pools" :key="p.value" :name="p.value">
        <template #label>
          <span class="pool-tab-label">
            {{ p.label }}
            <span class="pool-count">{{ poolCountText(p.countKey) }}</span>
          </span>
        </template>
      </el-tab-pane>
    </el-tabs>

    <!-- 查询方案栏 -->
    <div class="scheme-bar">
      <span class="scheme-title">常用方案：</span>
      <el-button
        v-for="s in schemeList"
        :key="s.id"
        size="small"
        :type="activeSchemeId === s.id ? 'primary' : ''"
        @click="applyScheme(s)"
      >{{ s.name }}</el-button>
      <el-button size="small" link type="primary" @click="saveAsScheme">保存为方案</el-button>
      <el-button size="small" link @click="openSchemeManage">方案管理</el-button>
    </div>

    <!-- 筛选条件 -->
    <el-form v-show="showSearch" :model="filters" size="small" :inline="true" label-width="88px" class="filter-form">
      <el-form-item label="订单号">
        <el-input v-model="filters.orderNums" placeholder="多单号用逗号/换行分隔，最多50个" clearable style="width: 230px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="商品">
        <el-input v-model="filters.goodsKeyword" placeholder="标题/规格编码/条码" clearable style="width: 180px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="收件人">
        <el-input v-model="filters.receiverName" placeholder="收件人姓名" clearable style="width: 130px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="手机号">
        <el-input v-model="filters.receiverMobile" placeholder="收件人手机号" clearable style="width: 140px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="平台">
        <el-select v-model="filters.shopType" placeholder="全部平台" clearable style="width: 150px">
          <el-option label="销售订单" :value="0" />
          <el-option v-for="item in platformList" :key="item.id" :label="item.name" :value="item.id" />
        </el-select>
      </el-form-item>
      <el-form-item label="店铺">
        <el-select v-model="filters.shopId" placeholder="全部店铺" filterable clearable style="width: 180px">
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id" />
        </el-select>
      </el-form-item>
      <el-form-item label="下单时间">
        <el-date-picker
          v-model="orderTimeRange"
          value-format="YYYY-MM-DD"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          clearable
          style="width: 240px"
        />
      </el-form-item>
      <el-form-item label="买家留言">
        <el-input v-model="filters.buyerMemo" placeholder="买家留言" clearable style="width: 150px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="卖家备注">
        <el-input v-model="filters.sellerMemo" placeholder="卖家备注" clearable style="width: 150px" @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="实付金额">
        <el-input-number v-model="filters.amountMin" :min="0" :controls="false" placeholder="最低" style="width: 90px" />
        <span class="range-sep">-</span>
        <el-input-number v-model="filters.amountMax" :min="0" :controls="false" placeholder="最高" style="width: 90px" />
      </el-form-item>
      <el-form-item v-if="activePool === 'released'" label="发货方">
        <el-select v-model="filters.shipperCategory" placeholder="全部" clearable style="width: 140px">
          <el-option label="仓库/店铺自用" value="self" />
          <el-option label="供应商" value="supplier" />
          <el-option label="云仓" value="cloud" />
        </el-select>
      </el-form-item>
      <el-form-item label="含买家留言">
        <el-switch v-model="filters.hasBuyerMemo" />
      </el-form-item>
      <el-form-item label="标签">
        <el-select v-model="filters.tagIds" multiple collapse-tags filterable placeholder="全部标签" style="width: 220px">
          <el-option v-for="t in enabledTags" :key="t.id" :label="t.name" :value="t.id" />
        </el-select>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" size="small" @click="handleQuery">
          <el-icon><Search /></el-icon>搜索
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button size="small" @click="resetQuery">
          <el-icon><Refresh /></el-icon>重置
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button size="small" @click="showSearch = !showSearch">{{ showSearch ? '收起' : '展开' }}</el-button>
      </el-col>
      <right-toolbar :showSearch="showSearch" @queryTable="refreshAll" />
    </el-row>

    <!-- 异常池分类 -->
    <div v-if="activePool === 'exception'" class="filter-tags-row">
      <span class="filter-tags-label">异常分类：</span>
      <el-check-tag :checked="filters.tagIds.length === 0" @change="selectCategory(null)">全部</el-check-tag>
      <el-check-tag
        v-for="t in exceptionCounts.tags"
        :key="t.tagId"
        :checked="filters.tagIds.length === 1 && filters.tagIds[0] === t.tagId"
        @change="selectCategory(t.tagId)"
      >{{ t.name }}（{{ t.count }}）</el-check-tag>
      <span class="uncategorized-text">未分类 {{ exceptionCounts.uncategorized || 0 }}</span>
    </div>

    <!-- 快捷标签过滤 -->
    <div v-if="generalTags.length" class="filter-tags-row">
      <span class="filter-tags-label">标签：</span>
      <el-check-tag
        v-for="t in generalTags"
        :key="t.id"
        :checked="filters.tagIds.includes(t.id)"
        @change="toggleTagFilter(t.id)"
      >
        <span :style="t.color ? { color: t.color } : {}">{{ t.name }}</span>
      </el-check-tag>
    </div>

    <!-- 批量操作 -->
    <el-row :gutter="10" class="mb8">
      <el-col v-if="activePool === 'pending' || activePool === 'exception'" :span="1.5">
        <el-button type="success" size="small" :disabled="!selectedRows.length" @click="openRelease(selectedRows)">批量放行</el-button>
      </el-col>
      <el-col v-if="activePool === 'pending'" :span="1.5">
        <el-button type="warning" size="small" :disabled="!selectedRows.length" @click="openToException(selectedRows)">批量转异常</el-button>
      </el-col>
      <el-col v-if="activePool === 'exception'" :span="1.5">
        <el-button size="small" :disabled="!selectedRows.length" @click="batchToNormal">批量转正常</el-button>
      </el-col>
      <el-col v-if="activePool === 'released'" :span="1.5">
        <el-button type="warning" size="small" :disabled="!selectedRows.length" @click="batchWithdraw(selectedRows)">批量撤回异常</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button size="small" :disabled="!selectedRows.length" @click="openTagApply(1)">打标</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button size="small" :disabled="!selectedRows.length" @click="openTagApply(0)">撤标</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button size="small" @click="openTagManage">标签管理</el-button>
      </el-col>
    </el-row>

    <!-- 订单列表（主单/子单平铺） -->
    <el-table
      v-loading="loading"
      :data="orderRows"
      row-key="id"
      @selection-change="handleSelectionChange"
      @sort-change="handleSortChange"
    >
      <el-table-column type="selection" width="45" align="center" />
      <el-table-column type="expand" width="36">
        <template #default="scope">
          <el-table :data="scope.row.items || []" size="small" class="inner-table">
            <el-table-column label="图片" width="60">
              <template #default="itemScope">
                <ImagePreview :src="itemScope.row.goodsImg" :width="40" :height="40" />
              </template>
            </el-table-column>
            <el-table-column label="商品" prop="goodsTitle" min-width="260" show-overflow-tooltip />
            <el-table-column label="规格" prop="goodsSpec" min-width="140" show-overflow-tooltip />
            <el-table-column label="SKU编码" prop="skuNum" width="150" />
            <el-table-column label="商品编码" prop="goodsNum" width="150" />
            <el-table-column label="数量" prop="quantity" width="70" align="center" />
          </el-table>
        </template>
      </el-table-column>
      <el-table-column label="订单号" min-width="220">
        <template #default="scope">
          <div class="order-num-line">
            <el-tag size="small" :type="isMaster(scope.row) ? 'primary' : 'info'" effect="plain">
              {{ scope.row.orderRoleName || (isMaster(scope.row) ? '主订单' : '子订单') }}
            </el-tag>
            <span class="order-num">{{ scope.row.orderNum }}</span>
            <el-icon class="copy-icon" @click="copyText(scope.row.orderNum)"><DocumentCopy /></el-icon>
          </div>
          <div class="sub-line">
            <el-tag v-if="scope.row.orderMode === 1" size="small" type="success">手工</el-tag>
            <el-tag v-if="scope.row.orderMode === 2" size="small" type="warning">补发</el-tag>
            <span v-if="!isMaster(scope.row)">主单ID：{{ scope.row.parentOrderId }}</span>
            <el-tag v-if="scope.row.splitFlag" size="small" type="warning">已拆分</el-tag>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="商品" min-width="340">
        <template #default="scope">
          <div class="goods-cell">
            <ImagePreview :src="scope.row.firstImage" :width="42" :height="42" />
            <div class="goods-info">
              <div class="goods-title" :title="scope.row.goodsSummary">{{ scope.row.goodsSummary }}</div>
              <div class="goods-sub">
                <span v-if="scope.row.skuNumText" class="sku-text">SKU：{{ scope.row.skuNumText }}</span>
                <el-tag size="small" type="info">{{ scope.row.itemCount || 0 }}款 / {{ scope.row.totalQuantity || 0 }}件</el-tag>
              </div>
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="收件人" min-width="170">
        <template #default="scope">
          <div>{{ scope.row.receiverName }}&nbsp;{{ scope.row.receiverMobile }}</div>
          <div class="sub-line">{{ scope.row.province }}{{ scope.row.city }}{{ scope.row.town }}</div>
        </template>
      </el-table-column>
      <el-table-column label="金额" width="130" prop="payment" sortable="custom">
        <template #default="scope">
          <div>实付：{{ formatAmount(scope.row.payment) }}</div>
          <div class="sub-line">订单：{{ formatAmount(scope.row.amount) }}</div>
        </template>
      </el-table-column>
      <el-table-column label="店铺" min-width="150">
        <template #default="scope">
          <div>{{ shopName(scope.row.shopId) }}</div>
          <div class="sub-line">{{ platformName(scope.row.shopType) }}</div>
        </template>
      </el-table-column>
      <el-table-column label="状态" min-width="210">
        <template #default="scope">
          <div class="status-line">
            <el-tag size="small" :type="auditTagType(scope.row.auditStatus)">{{ scope.row.auditStatusName || auditName(scope.row.auditStatus) }}</el-tag>
            <el-tag size="small" :type="shipTagType(scope.row.shipStatus)">{{ shipStatusName(scope.row.shipStatus) }}</el-tag>
            <el-tag v-if="waybillText(scope.row)" size="small" type="info">{{ waybillText(scope.row) }}</el-tag>
          </div>
          <div
            v-if="(activePool === 'pending' || activePool === 'exception') && scope.row.canRelease === false"
            class="sub-line danger"
          >{{ scope.row.canReleaseMsg || '不满足放行条件' }}</div>
          <div v-if="scope.row.latestDeliveryTime" class="sub-line" :class="{ danger: isOverdue(scope.row) }">
            最晚发货：{{ parseTime(scope.row.latestDeliveryTime) }}
          </div>
        </template>
      </el-table-column>
      <el-table-column label="标签" min-width="150">
        <template #default="scope">
          <div class="row-tags">
            <el-tag
              v-for="t in rowTags(scope.row)"
              :key="t.id"
              size="small"
              effect="plain"
              :style="tagStyle(t)"
            >{{ t.name }}</el-tag>
            <span v-if="!rowTags(scope.row).length" class="sub-line">—</span>
          </div>
        </template>
      </el-table-column>
      <el-table-column label="下单时间" width="165" prop="orderTime" sortable="custom">
        <template #default="scope">{{ parseTime(scope.row.orderTime) }}</template>
      </el-table-column>
      <el-table-column label="操作" width="260" fixed="right">
        <template #default="scope">
          <el-button link type="primary" size="small" @click="openDetail(scope.row)">详情</el-button>
          <el-button v-if="canSplitRow(scope.row)" link type="primary" size="small" @click="openSplit(scope.row)">拆单</el-button>
          <el-button
            v-if="activePool === 'pending' || activePool === 'exception'"
            link
            type="success"
            size="small"
            :disabled="scope.row.canRelease === false"
            @click="openRelease([scope.row])"
          >放行</el-button>
          <el-button v-if="activePool === 'pending'" link type="warning" size="small" @click="openToException([scope.row])">转异常</el-button>
          <el-button v-if="activePool === 'exception'" link size="small" @click="toNormal([scope.row])">转正常</el-button>
          <el-button v-if="activePool === 'released'" link type="warning" size="small" @click="batchWithdraw([scope.row])">撤回异常</el-button>
          <el-dropdown trigger="click" @command="handleRowCommand($event, scope.row)">
            <el-button link size="small" class="more-btn">更多<el-icon><ArrowDown /></el-icon></el-button>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item command="memo">修改备注</el-dropdown-item>
                <el-dropdown-item command="address" :disabled="activePool === 'shipped'">修改地址</el-dropdown-item>
                <el-dropdown-item v-if="isMaster(scope.row) && activePool !== 'shipped'" command="cancel" divided>取消订单</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 订单详情抽屉 -->
    <el-drawer v-model="detailVisible" title="订单详情" size="720px" append-to-body>
      <div v-loading="detailLoading">
        <el-descriptions :column="2" border size="small">
          <el-descriptions-item label="订单号">{{ detailOrder.orderNum }}</el-descriptions-item>
          <el-descriptions-item label="订单角色">
            {{ detailOrder.orderRoleName || (isMaster(detailOrder) ? '主订单' : '子订单') }}
          </el-descriptions-item>
          <el-descriptions-item label="审核状态">{{ detailOrder.auditStatusName || auditName(detailOrder.auditStatus) }}</el-descriptions-item>
          <el-descriptions-item label="订单状态">{{ detailOrder.orderStatus }}</el-descriptions-item>
          <el-descriptions-item label="发货状态">{{ shipStatusName(detailOrder.shipStatus) }}</el-descriptions-item>
          <el-descriptions-item label="取号状态">{{ waybillText(detailOrder) || '未取号' }}</el-descriptions-item>
          <el-descriptions-item label="店铺">{{ shopName(detailOrder.shopId) }}</el-descriptions-item>
          <el-descriptions-item label="平台">{{ platformName(detailOrder.shopType) }}</el-descriptions-item>
          <el-descriptions-item label="实付金额">{{ formatAmount(detailOrder.payment) }}</el-descriptions-item>
          <el-descriptions-item label="订单金额">{{ formatAmount(detailOrder.amount) }}</el-descriptions-item>
          <el-descriptions-item label="买家留言" :span="2">{{ detailOrder.buyerMemo || '—' }}</el-descriptions-item>
          <el-descriptions-item label="卖家备注" :span="2">{{ detailOrder.sellerMemo || '—' }}</el-descriptions-item>
          <el-descriptions-item label="收件人">{{ detailOrder.receiverName }}&nbsp;{{ detailOrder.receiverMobile }}</el-descriptions-item>
          <el-descriptions-item label="下单时间">{{ parseTime(detailOrder.orderTime) }}</el-descriptions-item>
          <el-descriptions-item label="收货地址" :span="2">
            {{ detailOrder.province }}{{ detailOrder.city }}{{ detailOrder.town }}{{ detailOrder.address }}
          </el-descriptions-item>
          <el-descriptions-item label="标签" :span="2">
            <el-tag
              v-for="t in rowTags(detailOrder)"
              :key="t.id"
              size="small"
              effect="plain"
              :style="tagStyle(t)"
              class="mr4"
            >{{ t.name }}</el-tag>
            <span v-if="!rowTags(detailOrder).length">—</span>
          </el-descriptions-item>
        </el-descriptions>

        <h4 class="section-title">商品明细</h4>
        <el-table :data="detailItems" size="small" border>
          <el-table-column label="图片" width="60">
            <template #default="scope">
              <ImagePreview :src="scope.row.goodsImg" :width="36" :height="36" />
            </template>
          </el-table-column>
          <el-table-column label="商品" prop="goodsTitle" min-width="220" show-overflow-tooltip />
          <el-table-column label="规格" prop="goodsSpec" width="130" show-overflow-tooltip />
          <el-table-column label="SKU编码" prop="skuNum" width="130" />
          <el-table-column label="单价" width="90" align="right">
            <template #default="scope">{{ formatAmount(scope.row.goodsPrice) }}</template>
          </el-table-column>
          <el-table-column label="数量" prop="quantity" width="60" align="center" />
          <el-table-column label="已退款" prop="refundCount" width="70" align="center" />
        </el-table>

        <template v-if="detailChildren.length">
          <h4 class="section-title">拆分子订单</h4>
          <el-table :data="detailChildren" size="small" border>
            <el-table-column label="子单ID" prop="id" width="90" />
            <el-table-column label="订单号" prop="orderNum" min-width="160" />
            <el-table-column label="审核状态" prop="auditStatusName" width="110" />
            <el-table-column label="发货状态" width="90">
              <template #default="scope">{{ shipStatusName(scope.row.shipStatus) }}</template>
            </el-table-column>
            <el-table-column label="创建时间" width="160">
              <template #default="scope">{{ parseTime(scope.row.createTime) }}</template>
            </el-table-column>
          </el-table>
        </template>
      </div>
    </el-drawer>

    <!-- 放行确认 -->
    <el-dialog v-model="releaseVisible" title="审核放行" width="500px" append-to-body>
      <el-alert
        type="info"
        :closable="false"
        show-icon
        title="开源版第一期放行无需面单账号，放行后订单进入「待发货」池，按手动发货流程处理。"
        class="mb12"
      />
      <div class="dialog-tip">已选 <b>{{ releaseRows.length }}</b> 单</div>
      <el-form label-width="80px">
        <el-form-item label="放行备注">
          <el-input v-model="releaseRemark" type="textarea" :rows="3" maxlength="200" show-word-limit placeholder="选填" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="releaseVisible = false">取消</el-button>
        <el-button type="primary" :loading="releaseSubmitting" @click="submitRelease">确认放行</el-button>
      </template>
    </el-dialog>

    <!-- 放行结果 -->
    <el-dialog v-model="releaseResultVisible" title="放行结果" width="680px" append-to-body>
      <el-alert
        type="warning"
        :closable="false"
        show-icon
        :title="`成功 ${releaseResult.successCount} 单，失败 ${releaseResult.failCount} 单（失败订单仍留在原状态池）`"
        class="mb12"
      />
      <el-table :data="releaseResult.failures" size="small" border max-height="320">
        <el-table-column label="订单号" prop="orderNum" min-width="160" />
        <el-table-column label="失败原因" prop="msg" min-width="280" />
      </el-table>
      <template #footer>
        <el-button type="primary" @click="releaseResultVisible = false">知道了</el-button>
      </template>
    </el-dialog>

    <!-- 转异常 -->
    <el-dialog v-model="exceptionVisible" title="转异常" width="520px" append-to-body>
      <div class="dialog-tip">已选 <b>{{ exceptionRows.length }}</b> 单，转异常后进入异常池</div>
      <el-form label-width="90px">
        <el-form-item label="异常分类" required>
          <el-radio-group v-model="exceptionTagId" class="exception-radio-group">
            <el-radio v-for="t in exceptionPoolTags" :key="t.id" :value="t.id">{{ t.name }}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="exceptionVisible = false">取消</el-button>
        <el-button type="warning" :loading="exceptionSubmitting" @click="submitException">确认转异常</el-button>
      </template>
    </el-dialog>

    <!-- 打标/撤标 -->
    <el-dialog v-model="tagApplyVisible" :title="tagApplyAction === 1 ? '批量打标' : '批量撤标'" width="480px" append-to-body>
      <div class="dialog-tip">已选 <b>{{ tagApplyRows.length }}</b> 单</div>
      <el-select v-model="tagApplyIds" multiple filterable placeholder="请选择标签" style="width: 100%">
        <el-option v-for="t in applyTagCandidates" :key="t.id" :label="t.name" :value="t.id" />
      </el-select>
      <template #footer>
        <el-button @click="tagApplyVisible = false">取消</el-button>
        <el-button type="primary" :loading="tagApplySubmitting" @click="submitTagApply">确认</el-button>
      </template>
    </el-dialog>

    <!-- 修改备注 -->
    <el-dialog v-model="memoVisible" title="修改卖家备注" width="500px" append-to-body>
      <div class="dialog-tip">订单号：{{ memoOrderNum }}</div>
      <el-input v-model="memoValue" type="textarea" :rows="4" maxlength="500" show-word-limit placeholder="请输入卖家备注" />
      <template #footer>
        <el-button @click="memoVisible = false">取消</el-button>
        <el-button type="primary" :loading="memoSubmitting" @click="submitMemo">保存</el-button>
      </template>
    </el-dialog>

    <!-- 修改地址 -->
    <el-dialog v-model="addressVisible" title="修改收货地址" width="560px" append-to-body>
      <el-form label-width="90px">
        <el-form-item label="收件人" required>
          <el-input v-model="addressForm.receiverName" maxlength="50" />
        </el-form-item>
        <el-form-item label="手机号" required>
          <el-input v-model="addressForm.receiverMobile" maxlength="20" />
        </el-form-item>
        <el-form-item label="省">
          <el-input v-model="addressForm.province" maxlength="50" placeholder="省" />
        </el-form-item>
        <el-form-item label="市">
          <el-input v-model="addressForm.city" maxlength="50" placeholder="市" />
        </el-form-item>
        <el-form-item label="区/县">
          <el-input v-model="addressForm.town" maxlength="50" placeholder="区/县" />
        </el-form-item>
        <el-form-item label="详细地址" required>
          <el-input v-model="addressForm.address" type="textarea" :rows="2" maxlength="200" show-word-limit />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="addressVisible = false">取消</el-button>
        <el-button type="primary" :loading="addressSubmitting" @click="submitAddress">保存</el-button>
      </template>
    </el-dialog>

    <!-- 取消订单 -->
    <el-dialog v-model="cancelVisible" title="取消订单" width="500px" append-to-body>
      <el-alert
        type="warning"
        :closable="false"
        show-icon
        title="取消将联动作废该主订单下全部有效子订单，操作不可撤销。"
        class="mb12"
      />
      <div class="dialog-tip">订单号：{{ cancelForm.orderNum }}</div>
      <el-input v-model="cancelForm.reason" type="textarea" :rows="3" maxlength="200" show-word-limit placeholder="取消原因（选填）" />
      <template #footer>
        <el-button @click="cancelVisible = false">取消</el-button>
        <el-button type="danger" :loading="cancelSubmitting" @click="submitCancel">确认取消订单</el-button>
      </template>
    </el-dialog>

    <!-- 拆单 -->
    <el-dialog v-model="splitVisible" title="拆单" width="1080px" append-to-body :close-on-click-modal="false">
      <div v-loading="splitLoading">
        <div class="dialog-tip">订单号：{{ splitOrderNum }}</div>
        <el-table :data="splitItems" size="small" border class="mb12">
          <el-table-column label="商品" min-width="280">
            <template #default="scope">
              <div class="goods-cell">
                <ImagePreview :src="scope.row.goodsImg" :width="36" :height="36" />
                <div class="goods-info">
                  <div class="goods-title" :title="scope.row.goodsTitle">{{ scope.row.goodsTitle }}</div>
                  <div class="goods-sub">{{ scope.row.goodsSpec }}</div>
                </div>
              </div>
            </template>
          </el-table-column>
          <el-table-column label="SKU编码" prop="skuNum" width="150" />
          <el-table-column label="数量" prop="quantity" width="70" align="center" />
          <el-table-column label="已退款" prop="refundCount" width="70" align="center" />
          <el-table-column label="已拆出" prop="splitOut" width="70" align="center" />
          <el-table-column label="剩余可拆" width="90" align="center">
            <template #default="scope">
              <span :class="{ danger: splitBaseRemain(scope.row) <= 0 }">{{ splitBaseRemain(scope.row) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="本次剩余" width="90" align="center">
            <template #default="scope">
              <span :class="{ danger: splitRemaining(scope.row) > 0 }">{{ splitRemaining(scope.row) }}</span>
            </template>
          </el-table-column>
        </el-table>

        <div v-for="(g, gi) in splitGroups" :key="gi" class="split-group">
          <div class="split-group-head">
            <el-input v-model="g.groupName" size="small" style="width: 160px" placeholder="批次名称" />
            <el-select v-model="g.shipType" clearable size="small" placeholder="发货方式（可后置）" style="width: 170px" @change="onSplitShipTypeChange(g)">
              <el-option label="本地仓库发货" :value="0" />
              <el-option label="供应商发货" :value="300" />
            </el-select>
            <el-select v-if="g.shipType === 0" v-model="g.warehouseId" clearable filterable size="small" placeholder="选择仓库" style="width: 180px">
              <el-option v-for="w in warehouseList" :key="w.id" :label="w.name" :value="w.id" />
            </el-select>
            <el-select v-if="g.shipType === 300" v-model="g.supplierId" clearable filterable size="small" placeholder="选择供应商" style="width: 180px">
              <el-option v-for="s in supplierList" :key="s.id" :label="s.name" :value="s.id" />
            </el-select>
            <el-select v-model="g.logisticsId" clearable filterable size="small" placeholder="快递公司（选填）" style="width: 170px">
              <el-option v-for="l in logisticsList" :key="l.id" :label="l.name" :value="l.id" />
            </el-select>
            <el-button link type="danger" @click="removeSplitGroup(gi)">移除批次</el-button>
          </div>
          <el-table :data="splitItems" size="small" border>
            <el-table-column label="商品" prop="goodsTitle" min-width="280" show-overflow-tooltip />
            <el-table-column label="SKU编码" prop="skuNum" width="150" />
            <el-table-column label="剩余可拆" width="90" align="center">
              <template #default="scope">{{ splitBaseRemain(scope.row) }}</template>
            </el-table-column>
            <el-table-column label="本批数量" width="150" align="center">
              <template #default="scope">
                <el-input-number
                  v-model="g.items[scope.row.itemId]"
                  :min="0"
                  :max="splitRowMax(scope.row, g)"
                  :controls="false"
                  size="small"
                  style="width: 100px"
                  :disabled="splitRowMax(scope.row, g) <= 0"
                />
              </template>
            </el-table-column>
          </el-table>
        </div>

        <el-button size="small" type="primary" plain @click="addSplitGroup">+ 新增拆单批次</el-button>
        <div class="split-tip">
          提示：每批生成一个子订单，发货方式可留空后置到打单发货；提交后被拆订单退出状态池，请尽量分配完整。
        </div>
      </div>
      <template #footer>
        <el-button @click="splitVisible = false">取消</el-button>
        <el-button type="primary" :loading="splitSubmitting" :disabled="splitLoading" @click="submitSplit">确认拆单</el-button>
      </template>
    </el-dialog>

    <!-- 标签管理 -->
    <el-dialog v-model="tagManageVisible" title="标签管理" width="880px" append-to-body>
      <div class="mb8">
        <el-button type="primary" size="small" @click="openTagForm()">新增标签</el-button>
        <el-button size="small" @click="loadTagRows">刷新</el-button>
      </div>
      <el-table v-loading="tagLoading" :data="tagRows" size="small" border max-height="420">
        <el-table-column label="标签" min-width="160">
          <template #default="scope">
            <el-tag size="small" effect="plain" :style="tagStyle(scope.row)">{{ scope.row.name }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="绑定池" width="120">
          <template #default="scope">{{ scope.row.bindPool === 2 ? '异常池分类' : '普通标签' }}</template>
        </el-table-column>
        <el-table-column label="排序" prop="sort" width="80" align="center" />
        <el-table-column label="状态" width="100" align="center">
          <template #default="scope">
            <el-switch :model-value="scope.row.status === 1" @change="toggleTagStatus(scope.row, $event)" />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150" align="center">
          <template #default="scope">
            <el-button link type="primary" size="small" @click="openTagForm(scope.row)">编辑</el-button>
            <el-button link type="danger" size="small" @click="removeTagRow(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>

    <!-- 标签表单 -->
    <el-dialog v-model="tagFormVisible" :title="tagForm.id ? '编辑标签' : '新增标签'" width="440px" append-to-body>
      <el-form label-width="90px">
        <el-form-item label="标签名称" required>
          <el-input v-model="tagForm.name" maxlength="30" placeholder="请输入标签名称" />
        </el-form-item>
        <el-form-item label="标签颜色">
          <el-color-picker v-model="tagForm.color" />
        </el-form-item>
        <el-form-item label="绑定池">
          <el-radio-group v-model="tagForm.bindPool">
            <el-radio :value="0">普通标签</el-radio>
            <el-radio :value="2">异常池分类</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="排序">
          <el-input-number v-model="tagForm.sort" :min="0" :max="9999" />
        </el-form-item>
        <el-form-item label="状态">
          <el-switch v-model="tagForm.status" :active-value="1" :inactive-value="0" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="tagFormVisible = false">取消</el-button>
        <el-button type="primary" :loading="tagFormSubmitting" @click="submitTagForm">保存</el-button>
      </template>
    </el-dialog>

    <!-- 方案管理 -->
    <el-dialog v-model="schemeManageVisible" title="查询方案管理" width="920px" append-to-body>
      <div class="mb8">
        <el-button type="primary" size="small" @click="saveAsScheme">保存当前筛选为方案</el-button>
        <el-button size="small" @click="loadSchemeRows">刷新</el-button>
      </div>
      <el-table v-loading="schemeLoading" :data="schemeRows" size="small" border max-height="420">
        <el-table-column label="方案名称" prop="name" min-width="140" />
        <el-table-column label="查询条件" min-width="320" show-overflow-tooltip>
          <template #default="scope">{{ describeConditions(scope.row.conditions) }}</template>
        </el-table-column>
        <el-table-column label="排序" prop="sort" width="70" align="center" />
        <el-table-column label="状态" width="90" align="center">
          <template #default="scope">
            <el-switch :model-value="scope.row.status === 1" @change="toggleSchemeStatus(scope.row, $event)" />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="260" align="center">
          <template #default="scope">
            <el-button link type="primary" size="small" @click="renameScheme(scope.row)">重命名</el-button>
            <el-button link type="primary" size="small" @click="overwriteScheme(scope.row)">用当前筛选覆盖</el-button>
            <el-button link type="danger" size="small" @click="removeScheme(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, reactive, ref } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search, Refresh, DocumentCopy, ArrowDown } from '@element-plus/icons-vue'
import {
  poolPage,
  poolCounts,
  exceptionTagCounts,
  toException,
  releaseOrders,
  withdrawToException,
  cancelWorkOrder,
  updateOrderMemo,
  updateOrderAddress,
  getOrderTree,
  getWorkbenchItems,
  listTags,
  tagOptions,
  poolTagOptions,
  addTag,
  editTag,
  setTagStatus,
  deleteTag,
  applyTags,
  listSchemes,
  schemeOptions,
  addScheme,
  editScheme,
  deleteScheme,
  setSchemeStatus,
  splitPreview,
  splitSubmit
} from '@/api/order/workbench'
import { listPlatform, listShop } from '@/api/shop/shop'
import { listWarehouse } from '@/api/wms/warehouse'
import { listSupplier } from '@/api/goods/supplier'
import { listLogisticsStatus } from '@/api/shipping/logisticsLibrary'
import { getUserProfile } from '@/api/system/user'
import { parseTime } from '@/utils/zhijian'
import Pagination from '@/components/Pagination/index.vue'
import RightToolbar from '@/components/RightToolbar/index.vue'
import ImagePreview from '@/components/ImagePreview/index.vue'

const pools = [
  { value: 'pending', label: '待审核', countKey: 'pending' },
  { value: 'exception', label: '异常池', countKey: 'exception' },
  { value: 'released', label: '待发货', countKey: 'released' },
  { value: 'shipped', label: '已发货', countKey: 'shipped' }
]

const activePool = ref('pending')
const counts = reactive<Record<string, number>>({ pending: 0, exception: 0, released: 0, shipped: 0 })
const loading = ref(false)
const showSearch = ref(true)
const orderRows = ref<any[]>([])
const total = ref(0)
const selectedRows = ref<any[]>([])
const queryParams = reactive({ pageNum: 1, pageSize: 10 })
const orderTimeRange = ref<string[] | null>(null)

function defaultFilters() {
  return {
    orderNums: '',
    goodsKeyword: '',
    receiverName: '',
    receiverMobile: '',
    shopType: null as number | null,
    shopId: null as number | null,
    buyerMemo: '',
    sellerMemo: '',
    hasBuyerMemo: false,
    tagIds: [] as number[],
    amountMin: null as number | null,
    amountMax: null as number | null,
    shipperCategory: null as string | null,
    sortField: '',
    sortOrder: ''
  }
}
const filters = reactive<any>(defaultFilters())

// ==================== 基础数据 ====================

const platformList = ref<any[]>([])
const shopList = ref<any[]>([])
const tagList = ref<any[]>([])
const schemeList = ref<any[]>([])
const activeSchemeId = ref<number | null>(null)
const warehouseList = ref<any[]>([])
const supplierList = ref<any[]>([])
const logisticsList = ref<any[]>([])

const tagMap = computed(() => {
  const map = new Map<number, any>()
  tagList.value.forEach((t) => map.set(Number(t.id), t))
  return map
})
const enabledTags = computed(() => tagList.value.filter((t) => t.status === 1))
const generalTags = computed(() => enabledTags.value.filter((t) => t.bindPool !== 2))
const applyTagCandidates = computed(() => (tagApplyAction.value === 1 ? enabledTags.value : tagList.value))

function loadPlatforms() {
  listPlatform({ status: 0 }).then((res: any) => {
    platformList.value = res.rows || []
  }).catch(() => {})
}

function loadIdentityAndShops() {
  getUserProfile().then((res: any) => {
    const user = res.data || res.user
    const merchantId = user?.userType === 20 ? user.deptId : undefined
    loadShops(merchantId)
  }).catch(() => loadShops())
}

function loadShops(merchantId?: number) {
  listShop({ pageNum: 1, pageSize: 1000, merchantId }).then((res: any) => {
    shopList.value = res.rows || []
  }).catch(() => {})
}

async function loadTagList() {
  const map = new Map<number, any>()
  try {
    const res: any = await listTags({ pageNum: 1, pageSize: 500 })
    ;(res.rows || []).forEach((t: any) => map.set(Number(t.id), { ...t, id: Number(t.id) }))
  } catch {
    // 列表失败时仍尝试加载启用标签
  }
  try {
    const res: any = await tagOptions()
    ;(res.data || []).forEach((t: any) => {
      if (!map.has(Number(t.id))) map.set(Number(t.id), { ...t, id: Number(t.id) })
    })
  } catch {
    // 忽略
  }
  tagList.value = Array.from(map.values())
}

function loadSchemes() {
  schemeOptions().then((res: any) => {
    schemeList.value = res.data || []
  }).catch(() => {})
}

function loadSplitOptions() {
  listWarehouse({ pageNum: 1, pageSize: 500 }).then((res: any) => {
    warehouseList.value = res.rows || []
  }).catch(() => {})
  listSupplier({ pageNum: 1, pageSize: 500 }).then((res: any) => {
    supplierList.value = res.rows || []
  }).catch(() => {})
  listLogisticsStatus({ status: 1 }).then((res: any) => {
    logisticsList.value = res.rows || []
  }).catch(() => {})
}

// ==================== 列表查询 ====================

function buildQuery() {
  const p: any = {
    pageNum: queryParams.pageNum,
    pageSize: queryParams.pageSize,
    pool: activePool.value
  }
  if (filters.orderNums) p.orderNums = filters.orderNums
  if (filters.goodsKeyword) p.goodsKeyword = filters.goodsKeyword
  if (filters.receiverName) p.receiverName = filters.receiverName
  if (filters.receiverMobile) p.receiverMobile = filters.receiverMobile
  if (filters.shopType !== null && filters.shopType !== undefined) p.shopType = filters.shopType
  if (filters.shopId !== null && filters.shopId !== undefined) p.shopId = filters.shopId
  if (filters.buyerMemo) p.buyerMemo = filters.buyerMemo
  if (filters.sellerMemo) p.sellerMemo = filters.sellerMemo
  if (filters.hasBuyerMemo) p.hasBuyerMemo = true
  if (filters.tagIds.length) p.tagIds = filters.tagIds.join(',')
  if (filters.amountMin !== null && filters.amountMin !== undefined) p.amountMin = filters.amountMin
  if (filters.amountMax !== null && filters.amountMax !== undefined) p.amountMax = filters.amountMax
  if (filters.shipperCategory) p.shipperCategory = filters.shipperCategory
  if (filters.sortField && filters.sortOrder) {
    p.sortField = filters.sortField
    p.sortOrder = filters.sortOrder
  }
  if (orderTimeRange.value && orderTimeRange.value.length === 2) {
    p.orderTimeBegin = orderTimeRange.value[0]
    p.orderTimeEnd = orderTimeRange.value[1]
  }
  return p
}

function getList() {
  loading.value = true
  poolPage(buildQuery()).then((res: any) => {
    orderRows.value = res.rows || []
    total.value = res.total || 0
    selectedRows.value = []
  }).finally(() => {
    loading.value = false
  })
}

function loadCounts() {
  poolCounts(buildQuery()).then((res: any) => {
    Object.assign(counts, res.data || {})
  }).catch(() => {})
}

const exceptionCounts = reactive<any>({ tags: [], uncategorized: 0 })

function loadExceptionCounts() {
  exceptionTagCounts(buildQuery()).then((res: any) => {
    exceptionCounts.tags = res.data?.tags || []
    exceptionCounts.uncategorized = res.data?.uncategorized || 0
  }).catch(() => {})
}

function refreshAll() {
  getList()
  loadCounts()
  if (activePool.value === 'exception') loadExceptionCounts()
}

function handleQuery() {
  queryParams.pageNum = 1
  refreshAll()
}

function resetQuery() {
  Object.assign(filters, defaultFilters())
  orderTimeRange.value = null
  activeSchemeId.value = null
  handleQuery()
}

function handlePoolChange() {
  // 异常池分类标签只在异常池生效，切换池时清掉，避免其他池被分类标签过滤成空
  filters.tagIds = filters.tagIds.filter((id: number) => tagMap.value.get(Number(id))?.bindPool !== 2)
  queryParams.pageNum = 1
  refreshAll()
}

function handleSelectionChange(rows: any[]) {
  selectedRows.value = rows
}

function handleSortChange({ prop, order }: any) {
  filters.sortField = order ? prop : ''
  filters.sortOrder = order || ''
  queryParams.pageNum = 1
  getList()
}

function toggleTagFilter(tagId: number) {
  const index = filters.tagIds.indexOf(tagId)
  if (index >= 0) filters.tagIds.splice(index, 1)
  else filters.tagIds.push(tagId)
  handleQuery()
}

function selectCategory(tagId: number | null) {
  filters.tagIds = tagId ? [tagId] : []
  handleQuery()
}

// ==================== 展示辅助 ====================

function poolCountText(key: string) {
  const value = Number(counts[key] || 0)
  return value > 999 ? '999+' : String(value)
}

function isMaster(row: any) {
  return Number(row?.orderRole ?? 0) === 0
}

function canSplitRow(row: any) {
  if (activePool.value !== 'pending' && activePool.value !== 'exception') return false
  if (row.itemCount === 1 && Number(row.totalQuantity || 0) === 1) return false
  return row.orderRole === 0 || row.orderRole === 1
}

function formatAmount(value: any) {
  if (value === null || value === undefined || value === '') return '—'
  const num = Number(value)
  if (Number.isNaN(num)) return String(value)
  return '¥' + num.toFixed(2)
}

function shopName(id: any) {
  const shop = shopList.value.find((s) => Number(s.id) === Number(id))
  return shop?.name || (id ? '#' + id : '—')
}

function platformName(type: any) {
  if (type === null || type === undefined) return '—'
  const platform = platformList.value.find((p) => Number(p.id) === Number(type))
  if (platform) return platform.name
  return Number(type) === 0 ? '销售订单' : String(type)
}

function auditName(code: any) {
  const names: Record<number, string> = { 0: '待审核', 1: '已审核通过', 2: '已转异常', 3: '已拆单' }
  return names[Number(code)] || '—'
}

function auditTagType(code: any) {
  const map: Record<number, string> = { 0: 'warning', 1: 'success', 2: 'danger', 3: 'info' }
  return map[Number(code)] || 'info'
}

function shipStatusName(code: any) {
  const names: Record<number, string> = { 0: '未发货', 1: '部分发货', 2: '全部发货', 3: '无需发货' }
  return names[Number(code)] || '—'
}

function shipTagType(code: any) {
  const map: Record<number, string> = { 0: 'info', 1: 'warning', 2: 'success', 3: 'info' }
  return map[Number(code)] || 'info'
}

function waybillText(row: any) {
  if (row?.waybillCode) return row.waybillCode
  const names: Record<number, string> = { 0: '未取号', 1: '已取号', 2: '已打印', 3: '已发货', 10: '手动发货' }
  const status = Number(row?.waybillStatus || 0)
  return status > 0 ? names[status] || '' : ''
}

function isOverdue(row: any) {
  if (!row?.latestDeliveryTime) return false
  if (Number(row.shipStatus || 0) > 0) return false
  return Number(row.latestDeliveryTime) * 1000 < Date.now()
}

function rowTags(row: any) {
  if (!row?.tag) return []
  return String(row.tag)
    .split(',')
    .map((s) => s.trim())
    .filter(Boolean)
    .map((id) => tagMap.value.get(Number(id)) || { id: Number(id), name: '#' + id, color: '' })
}

function tagStyle(tag: any) {
  return tag?.color ? { color: tag.color, borderColor: tag.color } : {}
}

function copyText(text: string) {
  navigator.clipboard.writeText(text).then(() => {
    ElMessage.success('复制成功')
  }).catch(() => {
    ElMessage.warning('该浏览器不支持自动复制')
  })
}

// ==================== 详情 ====================

const detailVisible = ref(false)
const detailLoading = ref(false)
const detailOrder = ref<any>({})
const detailItems = ref<any[]>([])
const detailChildren = ref<any[]>([])

function openDetail(row: any) {
  detailOrder.value = row
  detailItems.value = []
  detailChildren.value = []
  detailVisible.value = true
  detailLoading.value = true
  const tasks: Promise<any>[] = [
    getWorkbenchItems(row.id).then((res: any) => {
      detailItems.value = res.data || []
    }).catch(() => {})
  ]
  if (isMaster(row)) {
    tasks.push(getOrderTree(row.id).then((res: any) => {
      detailChildren.value = res.data?.children || []
    }).catch(() => {}))
  }
  Promise.allSettled(tasks).then(() => {
    detailLoading.value = false
  })
}

// ==================== 放行 ====================

const releaseVisible = ref(false)
const releaseSubmitting = ref(false)
const releaseRows = ref<any[]>([])
const releaseRemark = ref('')
const releaseResultVisible = ref(false)
const releaseResult = reactive<any>({ successCount: 0, failCount: 0, failures: [] })

function openRelease(rows: any[]) {
  if (!rows.length) {
    ElMessage.warning('请先勾选订单')
    return
  }
  const blocked = rows.filter((r) => r.canRelease === false)
  if (blocked.length) {
    ElMessage.warning(`有 ${blocked.length} 单不满足放行条件，请先处理`)
    return
  }
  releaseRows.value = rows
  releaseRemark.value = ''
  releaseVisible.value = true
}

function submitRelease() {
  releaseSubmitting.value = true
  releaseOrders({ ids: releaseRows.value.map((r) => r.id), remark: releaseRemark.value || undefined })
    .then((res: any) => {
      const data = res.data || {}
      releaseVisible.value = false
      if (Number(data.failCount || 0) > 0) {
        releaseResult.successCount = data.successCount || 0
        releaseResult.failCount = data.failCount || 0
        releaseResult.failures = (data.items || [])
          .filter((item: any) => !item.success)
          .map((item: any) => ({
            ...item,
            orderNum: releaseRows.value.find((r) => Number(r.id) === Number(item.id))?.orderNum || ''
          }))
        releaseResultVisible.value = true
      } else {
        ElMessage.success(`放行成功 ${data.successCount || releaseRows.value.length} 单`)
      }
      refreshAll()
    }).finally(() => {
      releaseSubmitting.value = false
    })
}

// ==================== 转异常 / 转正常 / 撤回异常 ====================

const exceptionVisible = ref(false)
const exceptionSubmitting = ref(false)
const exceptionRows = ref<any[]>([])
const exceptionTagId = ref<number | null>(null)
const exceptionPoolTags = ref<any[]>([])

function openToException(rows: any[]) {
  if (!rows.length) {
    ElMessage.warning('请先勾选订单')
    return
  }
  poolTagOptions(2).then((res: any) => {
    exceptionPoolTags.value = res.data || []
    if (!exceptionPoolTags.value.length) {
      ElMessage.warning('暂无异常分类标签，请先在「标签管理」创建绑定异常池分类的标签')
      return
    }
    exceptionRows.value = rows
    exceptionTagId.value = exceptionPoolTags.value[0].id
    exceptionVisible.value = true
  }).catch(() => {})
}

function submitException() {
  if (!exceptionTagId.value) {
    ElMessage.warning('请选择异常分类')
    return
  }
  exceptionSubmitting.value = true
  toException({ orderIds: exceptionRows.value.map((r) => r.id), target: 2, tagId: exceptionTagId.value })
    .then((res: any) => {
      ElMessage.success(res.data || '转异常成功')
      exceptionVisible.value = false
      loadTagList()
      refreshAll()
    }).finally(() => {
      exceptionSubmitting.value = false
    })
}

function batchToNormal() {
  toNormal(selectedRows.value)
}

function toNormal(rows: any[]) {
  if (!rows.length) {
    ElMessage.warning('请先勾选订单')
    return
  }
  ElMessageBox.confirm(`确认将选中的 ${rows.length} 单转回待审核池？`, '提示', { type: 'warning' })
    .then(() => {
      toException({ orderIds: rows.map((r) => r.id), target: 0 }).then((res: any) => {
        ElMessage.success(res.data || '转正常成功')
        refreshAll()
      })
    }).catch(() => {})
}

function batchWithdraw(rows: any[]) {
  if (!rows.length) {
    ElMessage.warning('请先勾选订单')
    return
  }
  ElMessageBox.confirm(`确认将选中的 ${rows.length} 单撤回异常池？撤回后订单需重新审核。`, '提示', { type: 'warning' })
    .then(() => {
      withdrawToException({ orderIds: rows.map((r) => r.id) }).then((res: any) => {
        ElMessage.success(res.data || res.msg || '撤回成功')
        refreshAll()
      })
    }).catch(() => {})
}

// ==================== 打标/撤标 ====================

const tagApplyVisible = ref(false)
const tagApplySubmitting = ref(false)
const tagApplyAction = ref(1)
const tagApplyRows = ref<any[]>([])
const tagApplyIds = ref<number[]>([])

function openTagApply(action: number) {
  if (!selectedRows.value.length) {
    ElMessage.warning('请先勾选订单')
    return
  }
  tagApplyAction.value = action
  tagApplyRows.value = selectedRows.value
  tagApplyIds.value = []
  tagApplyVisible.value = true
}

function submitTagApply() {
  if (!tagApplyIds.value.length) {
    ElMessage.warning('请选择标签')
    return
  }
  tagApplySubmitting.value = true
  applyTags({
    action: tagApplyAction.value,
    orderIds: tagApplyRows.value.map((r) => String(r.id)),
    tagIds: tagApplyIds.value
  }).then((res: any) => {
    ElMessage.success(res.data || res.msg || '操作成功')
    tagApplyVisible.value = false
    refreshAll()
  }).finally(() => {
    tagApplySubmitting.value = false
  })
}

// ==================== 备注 / 地址 / 取消 ====================

const memoVisible = ref(false)
const memoSubmitting = ref(false)
const memoOrderId = ref<any>(null)
const memoOrderNum = ref('')
const memoValue = ref('')

function openMemo(row: any) {
  memoOrderId.value = row.id
  memoOrderNum.value = row.orderNum
  memoValue.value = row.sellerMemo || ''
  memoVisible.value = true
}

function submitMemo() {
  memoSubmitting.value = true
  updateOrderMemo({ orderId: memoOrderId.value, sellerMemo: memoValue.value })
    .then(() => {
      ElMessage.success('卖家备注已保存')
      memoVisible.value = false
      refreshAll()
    }).finally(() => {
      memoSubmitting.value = false
    })
}

const addressVisible = ref(false)
const addressSubmitting = ref(false)
const addressForm = reactive<any>({
  orderId: null,
  receiverName: '',
  receiverMobile: '',
  province: '',
  city: '',
  town: '',
  address: ''
})

function openAddress(row: any) {
  Object.assign(addressForm, {
    orderId: row.id,
    receiverName: row.receiverName || '',
    receiverMobile: row.receiverMobile || '',
    province: row.province || '',
    city: row.city || '',
    town: row.town || '',
    address: row.address || ''
  })
  addressVisible.value = true
}

function submitAddress() {
  if (!addressForm.receiverName || !addressForm.receiverMobile || !addressForm.address) {
    ElMessage.warning('收件人、手机号、详细地址不能为空')
    return
  }
  addressSubmitting.value = true
  updateOrderAddress({ ...addressForm })
    .then(() => {
      ElMessage.success('收货地址已更新')
      addressVisible.value = false
      refreshAll()
    }).finally(() => {
      addressSubmitting.value = false
    })
}

const cancelVisible = ref(false)
const cancelSubmitting = ref(false)
const cancelForm = reactive<any>({ orderId: null, orderNum: '', reason: '' })

function openCancel(row: any) {
  if (!isMaster(row)) {
    ElMessage.warning('仅支持主订单级取消')
    return
  }
  Object.assign(cancelForm, { orderId: row.id, orderNum: row.orderNum, reason: '' })
  cancelVisible.value = true
}

function submitCancel() {
  cancelSubmitting.value = true
  cancelWorkOrder({ orderId: cancelForm.orderId, reason: cancelForm.reason || undefined })
    .then(() => {
      ElMessage.success('订单已取消')
      cancelVisible.value = false
      refreshAll()
    }).finally(() => {
      cancelSubmitting.value = false
    })
}

function handleRowCommand(command: any, row: any) {
  if (command === 'memo') openMemo(row)
  else if (command === 'address') openAddress(row)
  else if (command === 'cancel') openCancel(row)
}

// ==================== 拆单 ====================

const splitVisible = ref(false)
const splitLoading = ref(false)
const splitSubmitting = ref(false)
const splitOrderId = ref<any>(null)
const splitOrderNum = ref('')
const splitItems = ref<any[]>([])
const splitGroups = ref<any[]>([])

function openSplit(row: any) {
  splitOrderId.value = row.id
  splitOrderNum.value = row.orderNum
  splitItems.value = []
  splitGroups.value = []
  splitVisible.value = true
  splitLoading.value = true
  splitPreview(row.id).then((res: any) => {
    splitItems.value = res.data?.items || []
    addSplitGroup()
  }).catch(() => {
    splitVisible.value = false
  }).finally(() => {
    splitLoading.value = false
  })
}

function addSplitGroup() {
  const items: Record<string, number> = {}
  splitItems.value.forEach((item: any) => {
    if (splitBaseRemain(item) > 0) items[item.itemId] = 0
  })
  splitGroups.value.push({
    groupName: `拆分批次${splitGroups.value.length + 1}`,
    shipType: null,
    warehouseId: null,
    supplierId: null,
    logisticsId: null,
    items
  })
}

function removeSplitGroup(index: number) {
  splitGroups.value.splice(index, 1)
}

function onSplitShipTypeChange(group: any) {
  if (group.shipType !== 0) group.warehouseId = null
  if (group.shipType !== 300) group.supplierId = null
}

function splitBaseRemain(item: any) {
  return Math.max(0, Number(item.available || 0) - Number(item.splitOut || 0))
}

function splitGroupQty(group: any, item: any) {
  return Number(group?.items?.[item.itemId] || 0)
}

function splitAllocated(item: any, exclude?: any) {
  return splitGroups.value.reduce((sum, group) => {
    if (group === exclude) return sum
    return sum + splitGroupQty(group, item)
  }, 0)
}

function splitRowMax(item: any, group: any) {
  return Math.max(0, splitBaseRemain(item) - splitAllocated(item, group))
}

function splitRemaining(item: any) {
  return Math.max(0, splitBaseRemain(item) - splitAllocated(item))
}

function submitSplit() {
  if (!splitOrderId.value) return
  const groups: any[] = []
  for (const group of splitGroups.value) {
    const items = splitItems.value
      .map((item: any) => ({ sourceOrderItemId: item.itemId, quantity: Number(group.items?.[item.itemId] || 0) }))
      .filter((item) => item.quantity > 0)
    if (!items.length) {
      ElMessage.warning(`${group.groupName || '拆单批次'}未分配任何数量`)
      return
    }
    if (group.shipType === 0 && !group.warehouseId) {
      ElMessage.warning(`${group.groupName}请选择发货仓库`)
      return
    }
    if (group.shipType === 300 && !group.supplierId) {
      ElMessage.warning(`${group.groupName}请选择发货供应商`)
      return
    }
    groups.push({
      groupName: group.groupName,
      shipType: group.shipType,
      warehouseId: group.shipType === 0 ? group.warehouseId : undefined,
      supplierId: group.shipType === 300 ? group.supplierId : undefined,
      logisticsId: group.logisticsId || undefined,
      items
    })
  }
  if (!groups.length) {
    ElMessage.warning('请先添加拆单批次')
    return
  }
  for (const item of splitItems.value) {
    const total = splitGroups.value.reduce((sum, group) => sum + splitGroupQty(group, item), 0)
    if (total > splitBaseRemain(item)) {
      ElMessage.error(`商品「${item.goodsTitle}」分配数量超过剩余可拆`)
      return
    }
  }
  const unassigned = splitItems.value.filter((item: any) => {
    const total = groups.reduce((sum: number, group: any) => {
      const line = group.items.find((x: any) => x.sourceOrderItemId === item.itemId)
      return sum + Number(line?.quantity || 0)
    }, 0)
    return splitBaseRemain(item) - total > 0
  })
  const doSubmit = () => {
    splitSubmitting.value = true
    splitSubmit({ orderId: splitOrderId.value, groups }).then((res: any) => {
      ElMessage.success(res.data || res.msg || '拆单成功')
      splitVisible.value = false
      refreshAll()
    }).finally(() => {
      splitSubmitting.value = false
    })
  }
  if (unassigned.length) {
    ElMessageBox.confirm(
      `有 ${unassigned.length} 个商品未分配完整，提交后被拆订单将退出状态池，未分配数量不再参与履约。是否继续？`,
      '提示',
      { type: 'warning' }
    ).then(doSubmit).catch(() => {})
  } else {
    doSubmit()
  }
}

// ==================== 标签管理 ====================

const tagManageVisible = ref(false)
const tagLoading = ref(false)
const tagRows = ref<any[]>([])
const tagFormVisible = ref(false)
const tagFormSubmitting = ref(false)
const tagForm = reactive<any>({ id: null, name: '', color: '#409eff', bindPool: 0, sort: 0, status: 1 })

function openTagManage() {
  tagManageVisible.value = true
  loadTagRows()
}

function loadTagRows() {
  tagLoading.value = true
  listTags({ pageNum: 1, pageSize: 500 }).then((res: any) => {
    tagRows.value = res.rows || []
  }).finally(() => {
    tagLoading.value = false
  })
}

function openTagForm(row?: any) {
  if (row) {
    Object.assign(tagForm, {
      id: row.id,
      name: row.name,
      color: row.color || '#409eff',
      bindPool: row.bindPool || 0,
      sort: row.sort || 0,
      status: row.status ?? 1
    })
  } else {
    Object.assign(tagForm, { id: null, name: '', color: '#409eff', bindPool: 0, sort: 0, status: 1 })
  }
  tagFormVisible.value = true
}

function submitTagForm() {
  if (!tagForm.name || !String(tagForm.name).trim()) {
    ElMessage.warning('请输入标签名称')
    return
  }
  const data: any = {
    name: String(tagForm.name).trim(),
    color: tagForm.color,
    bindPool: tagForm.bindPool,
    sort: tagForm.sort,
    status: tagForm.status
  }
  if (tagForm.id) data.id = tagForm.id
  tagFormSubmitting.value = true
  const request = tagForm.id ? editTag(data) : addTag(data)
  request.then(() => {
    ElMessage.success('标签已保存')
    tagFormVisible.value = false
    loadTagRows()
    loadTagList()
    if (activePool.value === 'exception') loadExceptionCounts()
  }).finally(() => {
    tagFormSubmitting.value = false
  })
}

function toggleTagStatus(row: any, value: any) {
  const status = value ? 1 : 0
  setTagStatus({ id: row.id, status }).then(() => {
    row.status = status
    loadTagList()
  })
}

function removeTagRow(row: any) {
  ElMessageBox.confirm(`确认删除标签「${row.name}」？`, '提示', { type: 'warning' })
    .then(() => deleteTag(row.id))
    .then(() => {
      ElMessage.success('标签已删除')
      loadTagRows()
      loadTagList()
    }).catch(() => {})
}

// ==================== 查询方案 ====================

const schemeManageVisible = ref(false)
const schemeLoading = ref(false)
const schemeRows = ref<any[]>([])

const conditionLabels: Record<string, string> = {
  orderNums: '多单号',
  goodsKeyword: '商品',
  receiverName: '收件人',
  receiverMobile: '手机号',
  shopType: '平台',
  shopId: '店铺',
  buyerMemo: '买家留言',
  sellerMemo: '卖家备注',
  hasBuyerMemo: '含买家留言',
  tagIds: '标签',
  amountMin: '实付起',
  amountMax: '实付止',
  shipperCategory: '发货方',
  orderTimeRange: '下单时间',
  sortField: '排序字段',
  sortOrder: '排序方向'
}

function collectConditions() {
  const conditions: any = {}
  Object.keys(conditionLabels).forEach((key) => {
    if (key === 'tagIds') {
      if (filters.tagIds.length) conditions.tagIds = [...filters.tagIds]
    } else if (key === 'orderTimeRange') {
      if (orderTimeRange.value && orderTimeRange.value.length === 2) {
        conditions.orderTimeRange = [...orderTimeRange.value]
      }
    } else if (key === 'hasBuyerMemo') {
      if (filters.hasBuyerMemo) conditions.hasBuyerMemo = true
    } else if (key === 'amountMin' || key === 'amountMax' || key === 'shopType' || key === 'shopId') {
      if (filters[key] !== null && filters[key] !== undefined && filters[key] !== '') conditions[key] = filters[key]
    } else if (filters[key]) {
      conditions[key] = filters[key]
    }
  })
  return conditions
}

function applyScheme(scheme: any) {
  let conditions: any = {}
  try {
    conditions = JSON.parse(scheme.conditions || '{}')
  } catch {
    conditions = {}
  }
  Object.assign(filters, defaultFilters())
  Object.keys(conditionLabels).forEach((key) => {
    if (key === 'tagIds' || key === 'orderTimeRange') return
    if (conditions[key] !== undefined && conditions[key] !== null) filters[key] = conditions[key]
  })
  filters.tagIds = Array.isArray(conditions.tagIds) ? conditions.tagIds.map(Number) : []
  orderTimeRange.value = Array.isArray(conditions.orderTimeRange) && conditions.orderTimeRange.length === 2
    ? conditions.orderTimeRange
    : null
  activeSchemeId.value = scheme.id
  handleQuery()
}

function saveAsScheme() {
  ElMessageBox.prompt('请输入方案名称', '保存为方案', {
    inputValue: '',
    inputPlaceholder: '例如：待审核-加急订单',
    inputValidator: (value: string) => (!!value && !!value.trim()) || '方案名称不能为空'
  }).then(({ value }) => {
    return addScheme({
      name: value.trim(),
      conditions: JSON.stringify(collectConditions()),
      sort: schemeList.value.length,
      status: 1
    }).then(() => {
      ElMessage.success('方案已保存')
      loadSchemes()
      if (schemeManageVisible.value) loadSchemeRows()
    })
  }).catch(() => {})
}

function openSchemeManage() {
  schemeManageVisible.value = true
  loadSchemeRows()
}

function loadSchemeRows() {
  schemeLoading.value = true
  listSchemes({ pageNum: 1, pageSize: 200 }).then((res: any) => {
    schemeRows.value = res.rows || []
  }).finally(() => {
    schemeLoading.value = false
  })
}

function renameScheme(row: any) {
  ElMessageBox.prompt('请输入新的方案名称', '重命名方案', {
    inputValue: row.name,
    inputValidator: (value: string) => (!!value && !!value.trim()) || '方案名称不能为空'
  }).then(({ value }) => {
    return editScheme({ id: row.id, name: value.trim() }).then(() => {
      ElMessage.success('方案已重命名')
      loadSchemeRows()
      loadSchemes()
    })
  }).catch(() => {})
}

function overwriteScheme(row: any) {
  ElMessageBox.confirm(`确认用当前筛选条件覆盖方案「${row.name}」？`, '提示', { type: 'warning' })
    .then(() => editScheme({ id: row.id, conditions: JSON.stringify(collectConditions()) }))
    .then(() => {
      ElMessage.success('方案条件已更新')
      loadSchemeRows()
    }).catch(() => {})
}

function toggleSchemeStatus(row: any, value: any) {
  const status = value ? 1 : 0
  setSchemeStatus({ id: row.id, status }).then(() => {
    row.status = status
    loadSchemes()
  })
}

function removeScheme(row: any) {
  ElMessageBox.confirm(`确认删除方案「${row.name}」？`, '提示', { type: 'warning' })
    .then(() => deleteScheme(row.id))
    .then(() => {
      ElMessage.success('方案已删除')
      loadSchemeRows()
      loadSchemes()
    }).catch(() => {})
}

function describeConditions(conditionsText: any) {
  if (!conditionsText) return '—'
  try {
    const conditions = JSON.parse(conditionsText)
    const parts: string[] = []
    Object.keys(conditionLabels).forEach((key) => {
      const value = conditions[key]
      if (value === undefined || value === null || value === '' || (Array.isArray(value) && !value.length)) return
      if (key === 'shopType') parts.push(`平台:${platformName(value)}`)
      else if (key === 'shopId') parts.push(`店铺:${shopName(value)}`)
      else if (key === 'orderTimeRange') parts.push(`下单:${value.join(' ~ ')}`)
      else if (key === 'tagIds') {
        parts.push('标签:' + value.map((id: any) => tagMap.value.get(Number(id))?.name || '#' + id).join(','))
      } else {
        parts.push(`${conditionLabels[key]}:${value}`)
      }
    })
    return parts.join('；') || '—'
  } catch {
    return String(conditionsText)
  }
}

// ==================== 初始化 ====================

onMounted(() => {
  loadPlatforms()
  loadIdentityAndShops()
  loadTagList()
  loadSchemes()
  loadSplitOptions()
  refreshAll()
})
</script>

<style scoped lang="scss">
.pool-tabs {
  margin-bottom: 2px;
}

.pool-tab-label {
  display: inline-flex;
  align-items: center;
  gap: 6px;
}

.pool-count {
  min-width: 20px;
  height: 18px;
  padding: 0 6px;
  border-radius: 9px;
  background: #f0f2f5;
  color: #606266;
  font-size: 12px;
  line-height: 18px;
  text-align: center;
}

.scheme-bar {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px;
  padding-bottom: 8px;
}

.scheme-title {
  color: #606266;
  font-size: 13px;
}

.filter-form {
  padding-top: 4px;
}

.range-sep {
  margin: 0 6px;
  color: #909399;
}

.filter-tags-row {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px;
  margin-bottom: 8px;
}

.filter-tags-label {
  color: #606266;
  font-size: 13px;
}

.uncategorized-text {
  color: #909399;
  font-size: 12px;
}

.order-num-line {
  display: flex;
  align-items: center;
  gap: 5px;
}

.order-num {
  font-weight: 600;
}

.copy-icon {
  color: #409eff;
  cursor: pointer;
}

.sub-line {
  margin-top: 2px;
  color: #909399;
  font-size: 12px;
}

.danger {
  color: #f56c6c;
}

.goods-cell {
  display: flex;
  align-items: center;
  gap: 10px;
}

.goods-info {
  min-width: 0;
}

.goods-title {
  overflow: hidden;
  font-size: 13px;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.goods-sub {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 6px;
  margin-top: 4px;
}

.sku-text {
  max-width: 220px;
  overflow: hidden;
  color: #909399;
  font-size: 12px;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.status-line {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
}

.row-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
}

.more-btn {
  margin-left: 8px;
}

.mb12 {
  margin-bottom: 12px;
}

.mr4 {
  margin-right: 4px;
}

.section-title {
  margin: 16px 0 8px;
}

.dialog-tip {
  margin-bottom: 10px;
  color: #606266;
  font-size: 13px;
}

.exception-radio-group {
  display: flex;
  flex-wrap: wrap;
  gap: 4px 16px;
}

.split-group {
  margin-bottom: 12px;
  padding: 10px;
  border: 1px solid #ebeef5;
  border-radius: 4px;
}

.split-group-head {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
  margin-bottom: 8px;
}

.split-tip {
  margin-top: 10px;
  color: #909399;
  font-size: 12px;
}

.inner-table {
  padding: 4px 20px;
  background: #fafafa;
}
</style>
