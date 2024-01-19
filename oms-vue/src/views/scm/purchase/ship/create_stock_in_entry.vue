<template>
  <div class="app-container">
    <el-form
      :model="form"
      ref="form"
      size="small"
      :rules="rules"
      :inline="true"
      label-width="128px"
    >
      <el-form-item label="采购单号">
        <el-input v-model="form.orderNo" disabled />
      </el-form-item>
      <el-form-item label="采购日期" prop="orderDate">
        <el-date-picker
          clearable
          v-model="form.orderDate"
          disabled
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单日期"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="供应商" prop="supplier">
        <el-input v-model="form.supplier" disabled />
      </el-form-item>
      <el-form-item label="总金额">
        <el-input v-model="form.orderAmount" disabled />
      </el-form-item>
      <el-form-item label="审核人">
        <el-input v-model="form.auditUser" disabled />
      </el-form-item>
      <el-form-item label="审核时间">
        <el-input v-model="form.auditTime" disabled />
      </el-form-item>
      <el-form-item label="采购单确认日期">
        <el-date-picker
          clearable
          v-model="form.supplierConfirmTime"
          disabled
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订单日期"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="供应商发货日期">
        <el-date-picker
          clearable
          v-model="form.supplierDeliveryTime"
          disabled
          type="date"
          value-format="yyyy-MM-dd"
          placeholder=""
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="采购单创建时间">
        <el-date-picker
          clearable
          v-model="form.createTime"
          disabled
          type="date"
          value-format="yyyy-MM-dd"
          placeholder=""
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="创建人">
        <el-input v-model="form.createBy" disabled />
      </el-form-item>
      <el-row>
        <el-form-item label="商品明细：" prop="goodsList">
          <el-col :span="24"> </el-col>
        </el-form-item>

        <el-col :span="24" style="margin-left: 128px">
          <el-table :data="itemList" style="width: 100%">
            <el-table-column type="index" label="序号"> </el-table-column>
            <el-table-column prop="colorImage" label="商品图片">
              <template slot-scope="scope">
                <el-image
                  style="width: 70px; height: 70px"
                  :src="scope.row.colorImage"
                ></el-image>
              </template>
            </el-table-column>
            <el-table-column
              prop="goodsName"
              label="商品名称"
            ></el-table-column>
            <el-table-column prop="specNum" label="SKU"> </el-table-column>
            <el-table-column prop="colorValue" label="颜色"> </el-table-column>
            <el-table-column prop="sizeValue" label="尺码"> </el-table-column>
            <el-table-column prop="styleValue" label="款式"> </el-table-column>
            <el-table-column prop="quantity" label="采购数量">
            </el-table-column>
            <el-table-column prop="inQty" label="需入库数量">
                <template slot-scope="scope">
                    <el-input v-model.number="scope.row.inQty" placeholder="填写需入库的数量" />
                </template>   
            </el-table-column>
            <el-table-column prop="amount" label="总金额"> </el-table-column>
          </el-table>
        </el-col>
      </el-row>
      <el-row style="margin-top: 20px">
        <el-form-item label="收货日期" >
            <el-date-picker
            clearable
            v-model="ship.receiptTime"
            disabled
            type="date"
            value-format="yyyy-MM-dd"
            placeholder=""
            >
        </el-date-picker>
        </el-form-item>
        <el-form-item label="物流公司"><el-input v-model="ship.shipCompany" disabled /> </el-form-item>
        <el-form-item label="物流单号"><el-input v-model="ship.shipNo" disabled /> </el-form-item>
        <el-form-item label="备注"><el-input v-model="ship.remark" disabled /> </el-form-item>
        
      </el-row>
      <el-row>
        <el-form-item label="商品单位"><el-input v-model="ship.orderGoodsUnit" disabled /> </el-form-item>
        <el-form-item label="规格单位"><el-input v-model="ship.orderSpecUnit" disabled /> </el-form-item>
        <el-form-item label="总数量"><el-input v-model="ship.orderSpecUnitTotal" disabled /> </el-form-item>
      </el-row>
      <el-form-item>

        <el-button type="primary" style="margin-left: 128px;" @click="submitForm">生成采购入库单</el-button>
        
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import { getPurchaseOrderShip,createStockInEntry } from "@/api/scm/PurchaseOrderShip";
import { getPurchaseOrder } from "@/api/purchase/purchaseOrder";
import { listPurchaseOrderItem } from "@/api/purchase/purchaseOrderItem";

export default {
  name: "PurchaseOrderShipCreateEntry",
  data() {
    return {
      form: {
        id: null,
        
      },
      ship:{},
      itemList:[],
      rules: {},
    };
  },
  mounted() {
    this.form.id = this.$route.query.id;
    this.getDetail();
  },
  created() {},
  methods: {
    getDetail() {
      getPurchaseOrder(this.form.id).then((res) => {
        this.form = res.data;
        console.log("采购单详情", res.data);
      });

      getPurchaseOrderShip(this.form.id).then((response) => {
        this.ship = response.data;
        console.log("物流详情", this.ship);
      });
      listPurchaseOrderItem({orderId:this.form.id}).then(res =>{
        if(res.rows){
            res.rows.forEach(x=>{
                const g = {
                    ...x
                }
                x.inQty = x.quantity
                
            })
        }
            this.itemList = res.rows
            console.log('采购单明细',res)
        })
    },
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
            this.form.goodsList = this.itemList
            console.log("======创建采购入库单=====", this.form);
            createStockInEntry(this.form).then(res=>{
                console.log("====创建入库单api结果====",res)
                if(res.code === 200){
                    // 调用全局挂载的方法,关闭当前标签页
                    this.$store.dispatch("tagsView/delView", this.$route);
                    this.$router.push('/scm/purchase/ship');                           
                }
            })
        }
      });
    },
  },
};
</script>