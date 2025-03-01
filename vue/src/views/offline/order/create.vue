<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="108px">
        <el-form-item label="订单号" prop="orderNum">
          <el-col :span="24">
            <el-input v-model="form.orderNum" style="width:220px" placeholder="请输入订单编号" />
            <el-button type="" size="mini" @click="genOrderNum">生成订单号</el-button>
          </el-col>

        </el-form-item>
        <el-form-item label="店铺" prop="shopId">
          <el-select v-model="form.shopId" filterable r placeholder="搜索店铺" >
          <el-option v-for="item in shopList" :key="item.id" :label="item.name" :value="item.id">
             <span style="float: left">{{ item.name }}</span>
          </el-option>
        </el-select>
        </el-form-item>
      <el-form-item label="智能识别" prop="addressAll">
        <el-input type="textarea" v-model="form.addressAll" placeholder="" />
        <el-row>
          <el-button size="mini" @click="parseAddress">识别</el-button>
        </el-row>
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
          <el-table-column label="商品" prop="skuId" width="350">
            <template slot-scope="scope">
              <!-- <el-input v-model="scope.row.goodsTitle" placeholder="请输入商品标题" /> -->
              <el-select v-model="scope.row.skuId" filterable remote reserve-keyword placeholder="搜索商品SKU" style="width: 330px;"
                :remote-method="searchSku" :loading="skuListLoading" @change="skuChanage(scope.row)">
                <el-option v-for="item in skuList" :key="item.id"
                  :label="item.goodsName + ' ' + item.skuName +' - ' + item.skuCode"
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
          <el-table-column label="商品规格" prop="skuName" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skuName" disabled placeholder="请输入商品规格" />
            </template>
          </el-table-column>
          <el-table-column label="Sku编码" prop="skuCode" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.skuCode" disabled placeholder="请输入商品规格编码" />
            </template>
          </el-table-column>
          <el-table-column label="外部编码" prop="outerErpSkuId" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.outerErpSkuId" disabled placeholder="请输入商品编码" />
            </template>
          </el-table-column>

          <el-table-column label="商品单价" prop="salePrice" width="150">
            <template slot-scope="scope">
              <el-input type="number" v-model.number="scope.row.salePrice"  placeholder="请输入商品单价" @input="qtyChange(scope.row)"/>
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
        </el-table>
        <el-form-item label="商品金额" prop="goodsAmount" style="margin-top: 10px;">
          <el-input v-model="form.goodsAmount" style="width: 220px;" placeholder="请输入商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额" />
        </el-form-item>
        <el-form-item label="运费" prop="postage">
          <el-input v-model="form.postage" style="width:220px" placeholder="请输入邮费，单位：元" />
        </el-form-item>
        <el-form-item label="折扣金额" prop="sellerDiscount">
          <el-input v-model="form.sellerDiscount" style="width: 220px;" placeholder="请输入折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额" />
        </el-form-item>

<!--        <el-form-item label="支付金额" prop="payAmount">-->
<!--          <el-input v-model="form.payAmount" style="width: 220px;" placeholder="请输入支付金额，单位：元，支付金额=商品金额-折扣金额+邮费" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="支付时间" prop="payTime">-->
<!--          <el-date-picker clearable v-model="form.payTime" type="date" style="width: 220px;" value-format="yyyy-MM-dd" placeholder="请选择支付日期">-->
<!--        </el-date-picker>-->
<!--          &lt;!&ndash; <el-input v-model="form.payTime" style="width: 220px;" placeholder="请输入支付时间" /> &ndash;&gt;-->
<!--        </el-form-item>-->
      <el-form-item label="买家留言" prop="buyerMemo">
        <el-input v-model="form.buyerMemo" type="textarea" placeholder="请输入买家留言信息" />
      </el-form-item>

        <el-form-item label="订单备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>

<!--        <el-form-item label="标签" prop="tag">-->
<!--          <el-input v-model="form.tag" placeholder="请输入标签" style="width: 220px;" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-left: 108px;">
        <el-button type="primary" @click="submitForm">创建订单</el-button>
        <!-- <el-button @click="cancel">取 消</el-button> -->
      </div>
  </div>
</template>

<script>
import { searchSku } from "@/api/offline/goodsSku";
// import { listShop } from "@/api/offline/shop";
import { addOrder } from "@/api/offline/order";
import { listShop } from "@/api/shop/shop";
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
        orderNum:null,
        shopId:null,
        goodsAmount:0.0,
        postage:0.0,
        sellerDiscount:0.0,
        receiverPhone:'',
        receiverName:'',
        buyerMemo:null,
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
        goodsAmount: [{ required: true, message: '请填写商品价格' }],
        postage: [{ required: true, message: '请填写运费' }],
        discountAmount: [{ required: true, message: '请填写折扣金额' }]
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
    listShop({type: 999}).then(response => {
        this.shopList = response.rows;
      });
  },
  methods: {
     parseAddress() {
       if (this.form.addressAll) {
         const nameRegex =/(?<![\u4e00-\u9fa5])[\u4e00-\u9fa5]{2,3}(?![\u4e00-\u9fa5])/gs
         const nameMatch = this.form.addressAll.match(nameRegex);
         const name = nameMatch ? nameMatch[0] : '';
         this.form.receiverName = name
         // console.log(nameMatch,name)

         let addressWithoutName = this.form.addressAll.replace(nameRegex, '').trim();
         // const phoneRegex = /(\b\d{11}(-\d{4})?\b)/;
         // const phoneRegex = /\d{11}\-\d{4}/;
         const phoneRegex = /(\b\d{11}(-\d{4})?\b)/gs;

         const phoneMatch = addressWithoutName.match(phoneRegex);
         let phone = phoneMatch ? phoneMatch[1] : '';
         if(!phone){
           phone = phoneMatch[0]
         }
         // console.log(phoneMatch,phone)
         this.form.receiverPhone = phone

         // let addressWithoutPhone = addressWithoutName.replace(phoneRegex, '').trim();
         const areaRegex = /(?<province>[\u4e00-\u9fa5]{1,5}[省/自治区/港/门])(?<city>[\u4e00-\u9fa5]+市)?(?<district>[\u4e00-\u9fa5]+[县/区])?(?<address>.*[\u4e00-\u9fa5/\d/\w])/
         const areaMatch = addressWithoutName.match(areaRegex);
         const province = areaMatch ? areaMatch[1] : '';
         const city = areaMatch ? areaMatch[2] : '';
         const district = areaMatch ? areaMatch[3] : '';
         const address = areaMatch ? areaMatch[4] : '';
         this.form.provinces = [];
         this.form.provinces.push(province)
         this.form.provinces.push(city)
         this.form.provinces.push(district)
         this.form.address = address
         console.log(areaMatch)
         // // 定义正则表达式
         // const phoneRegex = /(\d{11})/; // 假设电话号码是11位数字
         //
         // // 从地址中提取电话号码
         // const phoneMatch = this.form.addressAll.match(phoneRegex);
         // const phone = phoneMatch ? phoneMatch[1] : null;
         //
         // // 从地址中去除电话号码
         // let addressWithoutPhone = this.form.addressAll.replace(phoneRegex, '').trim();
         //
         // // 以逗号、空格或回车分隔地址部分
         // const addressParts = addressWithoutPhone.split(/[\s,]+/); // 按空格、逗号或回车分隔
         //
         // let province = null, city = null, district = null, address = null, name = null;
         // if (addressParts.length >= 3) {
         //   province = addressParts[0].trim();
         //   city = addressParts[1].trim();
         //   district = addressParts[2].trim();
         //   // 假设最后一部分为联系人
         //   address = addressParts[3] ? addressParts[3].trim() : null;
         //   name = addressParts[4] ? addressParts[4].trim() : null;
         // }
         // this.form.provinces = [];
         // this.form.provinces.push(province)
         // this.form.provinces.push(city)
         // this.form.provinces.push(district)
         // this.form.receiverPhone = phone
         // this.form.address = address
         // this.form.receiverName = name
         // console.log('-----省:', province)
         // console.log('-----市:', city)
         // console.log('-----区:', district)
         // console.log('-----电话:', phone)
         // console.log('-----详细地址:', address)
         // console.log('-----姓名:', name)
         // return {
         //   province,
         //   city,
         //   district,
         //   phone,
         //   name
         // };
       }
     },
    genOrderNum(){
      const timestamp = Date.now();
      // 可以使用随机数增加订单号的唯一性
      const randomNumber = Math.floor(Math.random() * 1000);
      const orderNum = `${timestamp}${randomNumber}`;
      this.form.orderNum = orderNum;
      console.log("======生成订单号=======",orderNum)
    },
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
      console.log('=====0000====',row)
      const spec = this.skuList.find(x => x.id === row.skuId);
      if (spec) {
        console.log('=======11111==', spec)
        row.skuId = spec.id
        row.salePrice = spec.salePrice
        // row.sku = spec.colorValue + ' ' + spec.sizeValue + ' ' + spec.styleValue
        row.skuName = spec.skuName
        row.goodsImg = spec.colorImage
        row.skuCode = spec.skuCode
        row.goodsName = spec.goodsName
        row.outerErpSkuId = spec.outerErpSkuId
        row.isGift = '0'
        row.quantity = 1
        row.itemAmount = row.salePrice * row.quantity

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
      row.itemAmount = row.salePrice * row.quantity
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
      obj.skuId = "";
      obj.skuCode = "";
      obj.goodsName = "";
      obj.goodsImg = "";
      obj.skuName = "";
      obj.outerErpSkuId = "";
      obj.goodsPrice = "";
      obj.itemAmount = "";
      obj.quantity = "";
      obj.isGift = "";
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
            for(var i=0;i<this.form.itemList.length;i++){
              if(!this.form.itemList[i].skuId || !this.form.itemList[i].quantity){
                this.$modal.msgError("请完善商品信息");
                return
              }
            }
            // this.form.itemList.forEach(x=>{
            //   if(!x.goodsId || !x.quantity){
            //     this.$modal.msgError("请完善商品信息");
            //     return
            //   }
            // })

            console.log('======创建订单=====',this.form)
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("订单创建成功");
              // 调用全局挂载的方法,关闭当前标签页
              this.$store.dispatch("tagsView/delView", this.$route);
              this.$router.push('/offline/order');
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
