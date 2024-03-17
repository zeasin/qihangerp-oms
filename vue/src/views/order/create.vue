<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="108px">
        <el-form-item label="订单编号" prop="orderNum">
          <el-col :span="24">
            <el-input v-model="form.orderNum" style="width:220px" placeholder="请输入订单编号" />
          </el-col>
          
        </el-form-item>
        <el-form-item label="店铺" prop="shopId">
          <el-select v-model="form.shopId" filterable r placeholder="搜索店铺" >
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
        <el-form-item label="收件人姓名" prop="receiverName">
          <el-input v-model="form.receiverName" style="width: 220px;" placeholder="请输入收件人姓名" />
        </el-form-item>
        <el-form-item label="收件人手机号" prop="receiverPhone">
          <el-input v-model="form.receiverPhone"  style="width: 220px;" placeholder="请输入收件人手机号" />
        </el-form-item> 
        <el-form-item label="省市区" prop="provinces">
          <el-cascader style="width:250px"
            size="large"
            :options="pcaTextArr"
            v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <!-- <el-form-item label="省市区" prop="town">
            <el-input v-model="form.province" style="width: 120px;" placeholder="请输入省" />
            <el-input v-model="form.city" placeholder="请输入市" style="width: 120px;margin-left: 10px;" />
            <el-input v-model="form.town" placeholder="请输入区"  style="width: 120px;margin-left: 10px;"/>
        </el-form-item> -->
        <el-form-item label="详细地址" prop="address">
          <el-input v-model="form.address" placeholder="请输入详细地址" />
        </el-form-item>
       
        <el-form-item label="商品明细">
          <el-row :gutter="10" class="mb8" >
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAddSShopOrderItem">添加</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="mini" @click="handleDeleteSShopOrderItem">删除</el-button>
          </el-col>
        </el-row>
        </el-form-item>
        <!-- <el-divider content-position="center" style="margin-left: 98px;">商品信息</el-divider> -->
        
        <el-table style="margin-left: 108px;" :data="form.itemList" :row-class-name="rowSShopOrderItemIndex" @selection-change="handleSShopOrderItemSelectionChange" ref="sShopOrderItem">
          <el-table-column type="selection" width="50" align="center" />
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <!-- <el-table-column label="erp系统商品id" prop="goodsId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsId" placeholder="请输入erp系统商品id" />
            </template>
          </el-table-column>
          <el-table-column label="erp系统商品规格id" prop="specId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specId" placeholder="请输入erp系统商品规格id" />
            </template>
          </el-table-column> -->
          <el-table-column label="商品" prop="goodsId" width="350">
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsTitle" placeholder="请输入商品标题" /> -->
              <el-select v-model="scope.row.goodsId" filterable remote reserve-keyword placeholder="搜索商品" style="width: 330px;"
                :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                  :label="item.name + ' - ' + item.colorValue + ' ' + item.sizeValue + ' ' + item.styleValue"
                  :value="item.id">
                </el-option>
              </el-select>
            </template>
          </el-table-column>
          <el-table-column label="商品图片" prop="goodsImg" width="150">
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsImg" placeholder="请输入商品图片" /> -->
              <el-image style="width: 70px; height: 70px" :src="scope.row.goodsImg"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品编码" prop="goodsNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsNum" disabled placeholder="请输入商品编码" />
            </template>
          </el-table-column>
          <el-table-column label="商品规格" prop="goodsSpec" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsSpec" disabled placeholder="请输入商品规格" />
            </template>
          </el-table-column>
          <el-table-column label="商品规格编码" prop="specNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNum" disabled placeholder="请输入商品规格编码" />
            </template>
          </el-table-column>
          <el-table-column label="商品单价" prop="goodsPrice" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.goodsPrice" disabled placeholder="请输入商品单价" />
            </template>
          </el-table-column>
          <el-table-column label="商品数量" prop="quantity" width="150">
            <template slot-scope="scope">
              <el-input v-model.number="scope.row.quantity" placeholder="请输入商品数量" @input="qtyChange(scope.row)"/>
            </template>
          </el-table-column>
          <el-table-column label="金额" prop="itemAmount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.itemAmount" disabled placeholder="请输入子订单金额" />
            </template>
          </el-table-column>
          
          <el-table-column label="是否赠品0否1是" prop="isGift" width="150">
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.isGift" placeholder="请输入是否赠品0否1是" /> -->
              <el-select v-model="scope.row.isGift" placeholder="是否赠品">
                <el-option label="否" value="0" />
                <el-option label="是" value="1" />
              </el-select>
            </template>
          </el-table-column>
          <!-- <el-table-column label="已退货数量" prop="refundCount" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.refundCount" placeholder="请输入已退货数量" />
            </template>
          </el-table-column> -->
          <!-- <el-table-column label="售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 " prop="refundStatus" width="150">
            <template slot-scope="scope">
              <el-select v-model="scope.row.refundStatus" placeholder="请选择售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 ">
                <el-option label="请选择字典生成" value="" />
              </el-select>
            </template>
          </el-table-column> -->
        </el-table>
        <el-form-item label="商品金额" prop="goodsAmount" style="margin-top: 10px;">
          <el-input v-model="form.goodsAmount" style="width: 220px;" placeholder="请输入商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额" />
        </el-form-item>
        <el-form-item label="运费" prop="postage">
          <el-input v-model="form.postage" style="width:220px" placeholder="请输入邮费，单位：元" />
        </el-form-item>
        <el-form-item label="折扣金额" prop="discountAmount">
          <el-input v-model="form.discountAmount" style="width: 220px;" placeholder="请输入折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额" />
        </el-form-item>
        
        <el-form-item label="支付金额" prop="payAmount">
          <el-input v-model="form.payAmount" style="width: 220px;" placeholder="请输入支付金额，单位：元，支付金额=商品金额-折扣金额+邮费" />
        </el-form-item>
        <el-form-item label="支付时间" prop="payTime">
          <el-date-picker clearable v-model="form.payTime" type="date" style="width: 220px;" value-format="yyyy-MM-dd" placeholder="请选择支付日期">
        </el-date-picker>
          <!-- <el-input v-model="form.payTime" style="width: 220px;" placeholder="请输入支付时间" /> -->
        </el-form-item>
        <el-form-item label="订单备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="买家留言" prop="buyerMemo">
          <el-input v-model="form.buyerMemo" type="textarea" placeholder="请输入买家留言信息" />
        </el-form-item>
        <el-form-item label="标签" prop="tag">
          <el-input v-model="form.tag" placeholder="请输入标签" style="width: 220px;" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-left: 108px;">
        <el-button type="primary" @click="submitForm">创建订单</el-button>
        <!-- <el-button @click="cancel">取 消</el-button> -->
      </div>
  </div>
</template>

<script>
import { searchSku } from "@/api/goods/goods";
import { listShop } from "@/api/shop/shop";
import { addOrder } from "@/api/shop/order";
import {
  provinceAndCityData,
  pcTextArr,
  regionData,
  pcaTextArr,
  codeToText,
} from "element-china-area-data";

export default {
  name: "OrderCreate",
  data() {
    return {
      // 表单参数
      form: {
        shopId:1,
        goodsAmount:null,
        itemList:[],
        provinces: []
      },
      pcaTextArr,
      // 表单校验
      rules: {
        orderNum: [{ required: true, message: '订单编码不能为空' }],
        shopId: [{ required: true, message: '请选择店铺' }],
        receiverName: [{ required: true, message: '请填写收件人信息' }],
        receiverPhone: [{ required: true, message: '请填写收件人信息' }],
        provinces: [{ required: true, message: '请填写收货信息' }],
        city: [{ required: true, message: '请填写收货信息' }],
        town: [{ required: true, message: '请填写收货信息' }],
        address: [{ required: true, message: '请填写收货信息' }],
        goodsTitle: [{ required: true, message: '请完善商品信息' }]
      },
      shopLoading: false,
      shopList: [],
      skuListLoading: false,
      skuList: [],

      // 子表选中数据
      checkedSShopOrderItem: []
    };
  },
  created() {
    this.form.orderDate = this.getDate()
    listShop({}).then(response => {
        this.shopList = response.rows;
      });
  },
  methods: {
    getDate() {
      var now = new Date();
      var year = now.getFullYear(); //得到年份
      var month = now.getMonth(); //得到月份
      var date = now.getDate(); //得到日期
      var hour = " 00:00:00"; //默认时分秒 如果传给后台的格式为年月日时分秒，就需要加这个，如若不需要，此行可忽略
      month = month + 1;
      month = month.toString().padStart(2, "0");
      date = date.toString().padStart(2, "0");
      var defaultDate = `${year}-${month}-${date}`;//
      return defaultDate;
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
      const spec = this.skuList.find(x => x.id === row.goodsId);
      if (spec) {
        console.log('=========', spec)
        row.specId = spec.id
        row.goodsPrice = spec.purPrice
        row.goodsSpec = spec.colorValue + ' ' + spec.sizeValue + ' ' + spec.styleValue
        row.goodsImg = spec.colorImage
        row.goodsNum = spec.number
        row.goodsTitle = spec.name
        row.specNum = spec.specNum
        row.isGift = '0'
        row.quantity = 1
        row.itemAmount = row.goodsPrice * row.quantity

        // 计算总金额
        let goodsAmount = this.form.goodsAmount ? this.form.goodsAmount:0.0
        goodsAmount += row.itemAmount
        this.form.goodsAmount = goodsAmount
        

      //   this.goodsForm.id = spec.id
      //   this.goodsForm.goodsId = spec.goodsId
      //   this.goodsForm.name = spec.name
      //   this.goodsForm.colorImage = spec.colorImage
      //   this.goodsForm.colorValue = spec.colorValue
      //   this.goodsForm.number = spec.number
      //   this.goodsForm.purPrice = spec.purPrice
      //   this.goodsForm.sizeValue = spec.sizeValue
      //   this.goodsForm.specNum = spec.specNum
      //   this.goodsForm.styleValue = spec.styleValue
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
      // if (this.goodsForm.qty && this.goodsForm.qty > 0) {
      //   if (this.goodsForm.purPrice) {
      //     this.goodsForm.amount = this.goodsForm.qty * this.goodsForm.purPrice
      //   }

      // }
    },
    // 搜索店铺
    searchSupplier(query) {
      this.supplierLoading = true;
      const qw = {
        name: query
      }
      listShop(qw).then(response => {
        this.shopList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
      // listSupplier(qw).then(response => {
      //   this.supplierList = response.rows;
      //   this.supplierLoading = false;
      // });
    },
    /** ${subTable.functionName}添加按钮操作 */
    handleAddSShopOrderItem() {
      let obj = {};
      obj.goodsId = "";
      obj.specId = "";
      obj.goodsTitle = "";
      obj.goodsImg = "";
      obj.goodsNum = "";
      obj.goodsSpec = "";
      obj.specNum = "";
      obj.goodsPrice = "";
      obj.itemAmount = "";
      obj.quantity = "";
      obj.remark = "";
      obj.isGift = "";
      obj.refundCount = "";
      obj.refundStatus = "";
      this.form.itemList.push(obj);
    },
    /** ${subTable.functionName}删除按钮操作 */
    handleDeleteSShopOrderItem() {
      if (this.checkedSShopOrderItem.length == 0) {
        this.$modal.msgError("请先选择要删除的商品数据");
      } else {
        const sShopOrderItemList = this.form.itemList;
        const checkedSShopOrderItem = this.checkedSShopOrderItem;
        this.form.itemList = sShopOrderItemList.filter(function(item) {
          return checkedSShopOrderItem.indexOf(item.index) == -1
        });
      }
    },
    /** 复选框选中数据 */
    handleSShopOrderItemSelectionChange(selection) {
      this.checkedSShopOrderItem = selection.map(item => item.index)
    },
    /** ${subTable.functionName}序号 */
    rowSShopOrderItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          
          this.form.province = this.form.provinces[0]
          this.form.city = this.form.provinces[1]
          this.form.town = this.form.provinces[2]

          if(this.form.itemList && this.form.itemList.length >0){
            this.form.itemList.forEach(x=>{
              if(!x.goodsId || !x.quantity){
                this.$modal.msgError("请完善商品信息");
                return 
              }
            })
   
            console.log('======创建订单=====',this.form)
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("订单创建成功");
              // 调用全局挂载的方法,关闭当前标签页
              this.$store.dispatch("tagsView/delView", this.$route);
              this.$router.push('/sale/order/list');
            });
          
        }else{
          this.$modal.msgError("请添加商品");
        }
          
        }
      });
    }
  }
};

</script>