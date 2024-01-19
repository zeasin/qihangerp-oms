<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="店铺" prop="shopId">
        <el-select v-model="queryParams.shopId" filterable  placeholder="搜索店铺" >
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
            <span style="float: left">{{ item.name }}</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 4">淘宝天猫</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 5">拼多多</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 6">抖店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 7">小红书</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 13">快手小店</span>
              <span style="float: right; color: #8492a6; font-size: 13px"  v-if="item.type === 99">其他</span>
          </el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="商品ID" prop="goodsId">
        <el-input
          v-model="queryParams.goodsId"
          placeholder="请输入erp系统商品id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="商品编码" prop="goodsNum">
        <el-input
          v-model="queryParams.goodsNum"
          placeholder="请输入商品编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="规格ID" prop="specId">
        <el-input
          v-model="queryParams.specId"
          placeholder="请输入erp系统商品规格id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="规格编码" prop="specNum">
        <el-input
          v-model="queryParams.goodsNum"
          placeholder="请输入商品规格编码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="备货状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择">
        <el-option
          v-for="item in statusList"
          :key="item.value"
          :label="item.label"
          :value="item.value">
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
          icon="el-icon-document-copy"
          size="mini"
          :disabled="multiple"
          @click="handleSelection"
          v-hasPermi="['xhs:orderReceiver:remove']"
        >生成拣货单</el-button>
      </el-col>
      <el-col :span="1.5">
      <el-button
        type="primary"
        plain
        icon="el-icon-data-analysis"
        size="mini"
        :disabled="multiple"
        @click="handleStatistics"
        v-hasPermi="['xhs:orderReceiver:remove']"
      >统计</el-button>
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['wms:shipping:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="shippingList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" v-if="queryParams.status==='0'" align="center" />
      <!-- <el-table-column label="主键" align="center" prop="id" /> -->
      <el-table-column label="订单编号" align="center" prop="orderNum" />
       <el-table-column label="店铺" align="center" prop="shopId" >
        <template slot-scope="scope">
          <span>{{ shopList.find(x=>x.id === scope.row.shopId).name  }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="店铺平台" align="center" prop="shopType" >
         <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.shopType === 4">淘宝</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 5">拼多多</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 6">抖店</el-tag>
          <el-tag size="small" v-if="scope.row.shopType === 7">小红书</el-tag>
         </template>
      </el-table-column> -->

      <!-- <el-table-column label="子订单编号" align="center" prop="orderItemId" /> -->
      <el-table-column label="订单日期" align="center" prop="orderDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="商品" >
          <template slot-scope="scope">
            <el-row :gutter="20">
            <div style="float: left;display: flex;align-items: center;" >
              <el-image  style="width: 70px; height: 70px;" :src="scope.row.goodsImg"></el-image>
              <div style="margin-left:10px">
              <p>{{scope.row.goodsTitle}}</p>
              <p>{{scope.row.goodsSpec}}&nbsp;
                <el-tag size="small">x {{scope.row.quantity}}</el-tag>
                </p>
              </div>
            </div>
            </el-row>
          </template>
      </el-table-column>
      <el-table-column label="规格编码" align="center" prop="specNum" />
      <!-- <el-table-column label="erp系统商品id" align="center" prop="goodsId" />
      <el-table-column label="erp系统商品规格id" align="center" prop="specId" />
      <el-table-column label="商品标题" align="center" prop="goodsTitle" />
      <el-table-column label="商品图片" align="center" prop="goodsImg" />
      <el-table-column label="商品编码" align="center" prop="goodsNum" />
      <el-table-column label="商品规格" align="center" prop="goodsSpec" />
      <el-table-column label="商品规格编码" align="center" prop="specNum" /> -->
       <el-table-column label="商品数量" align="center" prop="quantity" />
      <!-- <el-table-column label="备注" align="center" prop="remark" /> -->
      <!-- <el-table-column label="物流公司" align="center" prop="shipCompany" /> -->
<!--      <el-table-column label="物流单号" align="center" prop="shipNo" />-->
<!--      <el-table-column label="运费" align="center" prop="shipCost" />-->
<!--      <el-table-column label="发货时间" align="center" prop="shipTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.shipTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="出库人" align="center" prop="outOperator" />-->
<!--      <el-table-column label="出库仓位" align="center" prop="outPosition" />-->
<!--      <el-table-column label="出库时间" align="center" prop="outTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.outTime, '{y}-{m}-{d}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->


      <el-table-column label="仓库库存" align="center" prop="inventory" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 0">待备货</el-tag>
          <el-tag size="small" v-if="scope.row.status === 1">备货中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已出库</el-tag>
        </template>
      </el-table-column>
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['wms:shipping:edit']"-->
<!--          >修改</el-button>-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-delete"-->
<!--            @click="handleDelete(scope.row)"-->
<!--            v-hasPermi="['wms:shipping:remove']"-->
<!--          >删除</el-button>-->
<!--        </template>-->
<!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改仓库订单发货对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>
        <el-form-item label="单号" prop="stockOutNum" v-if="isGen">
          <el-input v-model="form.stockOutNum" disabled placeholder="请输入单号" />
        </el-form-item>
        <el-form-item label="生成时间" prop="createTime" v-if="isGen">
          <el-date-picker clearable
            v-model="form.createTime"
            type="datetime" disabled
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择生成时间">
          </el-date-picker>
        </el-form-item>
        <el-divider content-position="center" v-if="isGen">拣货商品</el-divider>
        <el-table :data="skuList" :row-class-name="rowItemIndex" ref="skuItem">
<!--          <el-table-column type="selection" width="50" align="center" />-->
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品图片" prop="goodsImg" >
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="goodsTitle" ></el-table-column>
          <el-table-column label="规格" prop="goodsSpec" ></el-table-column>
          <el-table-column label="sku编码" prop="specNum" ></el-table-column>
          <el-table-column label="数量" prop="quantity"></el-table-column>
          <el-table-column label="仓库库存" prop="inventory"></el-table-column>

        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer" v-if="isGen">
        <el-button type="primary" @click="submitForm">生成拣货单</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listShipping, getShipping, stockingAdd } from "@/api/wms/shipping";
import { listShop } from "@/api/shop/shop";
export default {
  name: "Shipping",
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
      // 仓库订单发货表格数据
      shippingList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      isGen:true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 100,
        shopId: null,
        goodsId: null,
        specId: null,
        goodsNum: null,
        goodsSpec: null,
        specNum: null,
        status: null,
      },
      // 表单参数
      form: {},
      shopList: [],
      skuList:[],
      statusList: [
        {
          value: '0',
          label: '待备货'
        }, {
          value: '1',
          label: '备货中'
        }, {
          value: '2',
          label: '已备货'
        }
      ],
      // 表单校验
      rules: {
        stockOutNum: [
          { required: true, message: "单号不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "生成时间不能为空", trigger: "blur" }
        ],
        goodsId: [
          { required: true, message: "erp系统商品id不能为空", trigger: "blur" }
        ],
        specId: [
          { required: true, message: "erp系统商品规格id不能为空", trigger: "blur" }
        ],
        quantity: [
          { required: true, message: "商品数量不能为空", trigger: "blur" }
        ],
      }
    };
  },
  mounted() {

  },
  created() {
    listShop({}).then(response => {
        this.shopList = response.rows;
      });
    if(this.$route.query.status){
      this.queryParams.status = this.$route.query.status
    }else {
      this.queryParams.status = '0'
    }
    this.getList();
  },
  methods: {
    rowItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 查询仓库订单发货列表 */
    getList() {
      this.loading = true;
      listShipping(this.queryParams).then(response => {
        this.shippingList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
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
    /** 提交按钮 */
    submitForm() {
      // console.log("=============提交===",this.ids)
      this.$refs["form"].validate(valid => {
        if (valid) {
          if(!this.skuList || this.skuList.length === 0){
            this.$modal.msgError("请选择备货商品");
          }
          this.form.ids = this.ids;
          stockingAdd(this.form).then(response => {
            this.$modal.msgSuccess("拣货单生成成功");
            this.open = false;
            this.getList();
          });

        }
      });
    },
    handleStatistics(row){
      this.handleSelection(row,false)
    },
    /** 删除按钮操作 */
    handleSelection(row,isGen) {
      const ids = row.id || this.ids;
      // console.log("=====生成出库单=====",ids)
      if(!ids && ids.length===0){
        this.$modal.msgError("请选选择要备货的商品");
        return
      }
      if(isGen===undefined) this.isGen = true
      else this.isGen = isGen
      if(this.isGen === false)this.title = "备货统计";
      else this.title = "生成拣货单";

      // 创建一个包含年月日小时分钟秒的字符串作为基本编号
      var date = new Date();
      var year = date.getFullYear().toString(); // 四位数表示的年份
      var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 两位数表示的月份（注意要加上补零）
      var day = date.getDate().toString().padStart(2, '0'); // 两位数表示的天数（同样需要补零）
      var hours = date.getHours().toString().padStart(2, '0'); // 两位数表示的小时数（同样需要补零）
      var minutes = date.getMinutes().toString().padStart(2, '0'); // 两位数表示的分钟数（同样需要补零）
      var seconds = date.getSeconds().toString().padStart(2, '0'); // 两位数表示的秒数（同样需要补零）
      // 生成随机数部分
      var randomNum = Math.floor((Math.random() * 9) + 1); // 生成1到9之间的随机整数
      // 将所有部分组合起来形成最终的编号
      var code = `${year}${month}${day}${hours}${minutes}${seconds}${randomNum}`;
      // console.log("生成的编号为：" + code);

      this.form.stockOutNum = code
      this.form.createTime = new Date()
      this.skuList=[]

      ids.forEach(id=>{
        const obj = this.shippingList.find(y=>y.id === id)
        const has = this.skuList.find(y=>y.specId === obj.specId)
        if(has){
          // 增加数量即可
          has.quantity = has.quantity + obj.quantity
          has.ids.push(id)
        }else{
          // 新增数据
          const ids1 =[]
          ids1.push(id);
          this.skuList.push({
            ids:ids1,
            specId:obj.specId,
            goodsImg:obj.goodsImg,
            goodsNum:obj.goodsNum,
            goodsTitle:obj.goodsTitle,
            goodsSpec:obj.goodsSpec,
            specNum:obj.specNum,
            quantity:obj.quantity,
            inventory:obj.inventory
          })
        }
      })


      this.open = true;
      // this.$modal.confirm('是否确认删除仓库订单发货编号为"' + ids + '"的数据项？').then(function() {
      //   return delShipping(ids);
      // }).then(() => {
      //   this.getList();
      //   this.$modal.msgSuccess("删除成功");
      // }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('wms/shipping/export', {
        ...this.queryParams
      }, `shipping_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
