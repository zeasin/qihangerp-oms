<template>
  <div class="app-container">
    <el-form :model="printParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="108px">

      <el-form-item label="快递公司" prop="deliver">
        <el-select v-model="printParams.deliver" placeholder="请选择快递公司" clearable>
          <el-option
            v-for="item in deliverList"
            :key="item.delivery_id"
            :label="item.delivery_name"
            :value="item.delivery_id">
          </el-option>
        </el-select>
        <el-button  @click="getDeliverList"> 获取 </el-button>
      </el-form-item>
      <el-form-item label="打印机" prop="printer">
        <el-select v-model="printParams.printer" placeholder="请选择打印机" clearable>
         <el-option
            v-for="item in printerList"
            :key="item.name"
            :label="item.name"
            :value="item.name">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->

      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handlePrintEwaybill"
        >打印电子面单</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="55" align="center" /> -->
<!--      <el-table-column label="ID" align="center" prop="id" />-->
      <el-table-column label="商品ID" align="center" prop="wareId" />
      <el-table-column label="Sku Id" align="center" prop="skuId" />
      <el-table-column label="sku名称" align="center" prop="skuName" />
      <el-table-column label="图片" align="center" prop="logo" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.logo" :width="50" :height="50"/>
        </template>
      </el-table-column>

<!--      <el-table-column label="店铺" align="center" prop="categoryId" >-->
<!--        <template slot-scope="scope">-->
<!--          <el-tag size="small">{{categoryList.find(x=>x.id === scope.row.categoryId).name}}</el-tag>-->
<!--        </template>-->
<!--      </el-table-column>-->
       <el-table-column label="商家编码" align="center" prop="outerId" />
      <el-table-column label="京东价" align="center" prop="jdPrice" />
      <el-table-column label="ERP SKU ID" align="center" prop="erpSkuId" />
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-tag size="small" v-if="scope.row.status === 1">销售中</el-tag>
          <el-tag size="small" v-if="scope.row.status === 2">已下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleLink(scope.row)"
          >关联ERP</el-button>

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


    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="ERP商品SkuId" prop="erpSkuId">
          <el-input v-model.number="form.erpSkuId" placeholder="请输入ERP商品SkuId" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import '@riophae/vue-treeselect/dist/vue-treeselect.css'

import {listShop} from "@/api/shop/shop";
import {getDeliverList} from "@/api/wei/ewaybill";

export default {
  name: "printTao",
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
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null
      },
      // 打印参数
      printParams: {
        deliver: null,
        printer: null
      },
      // 表单参数
      form: {},
      orderList: [],
      printerList: [],
      deliverList: [],
      // 表单校验
      rules: {}
    };
  },
  created() {
    this.openWs()
    // listShop({platform:3}).then(response => {
    //   this.shopList = response.rows;
    // });
    // this.getList();
    this.loading = false;
  },
  methods: {
    /** getDeliverList获取开通的快递公司 */
    getDeliverList(){
      getDeliverList({shopId:2}).then(response => {
        this.deliverList = response.data;
      });

    },
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listGoodsSku(this.queryParams).then(response => {
        this.orderList = response.rows;
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
        erpSkuId: null
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
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleLink(row) {
      this.reset();
      const id = row.id || this.ids
      getGoodsSku(id).then(response => {
        console.log('=====00000000============',response)
        this.form = response.data;
        this.open = true;
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          linkErpGoodsSkuId(this.form).then(response => {
            this.$modal.msgSuccess("关联成功");
            this.open = false;
            this.getList();
          });
        }
      });
    },
    openWs() {
      const ws = new WebSocket('ws://127.0.0.1:13528');
      ws.onopen = () => {
        console.log('与打印组件建立连接成功: ');
        // 或打印机
        ws.send(JSON.stringify({
          requestID: '12345',
          cmd: 'getPrinters',
          "version": "1.0"
        }))
      };
      let obj = this.$modal;
      ws.onmessage = (e) => {
        const resp = JSON.parse(e.data || '{}')
        if (resp.cmd === 'getPrinters') {
          this.printerList = resp.printers
          obj.msgSuccess("打印组件连接成功！");
          console.log('打印机列表: ', resp.printers);
        }
      };
      // 当发生错误时触发
      ws.onerror = function(error) {
        obj.msgError("打印组件连接失败！请安装并启动菜鸟云打印打印组件！");
        console.error('WebSocket error:', error);
        // alert('WebSocket error occurred. Check the console for more details.');
      };
    },
    handlePrintEwaybill() {
      // if (!this.ws) {
      //   this.$modal.msgError('打印组件连接失败！请安装并启动微信视频号小单打印组件！');
      //   this.openWs()
      // }
      // if(!this.printParams.deliver){
      //   this.$modal.msgError('请选择快递公司！');
      //   return
      // }
      if(!this.printParams.printer){
        this.$modal.msgError('请选择打印机！');
        return
      }
      const ws = new WebSocket('ws://127.0.0.1:13528');
      ws.onopen = () => {
        console.log('开始打印: ');
        // 打印
        ws.send(JSON.stringify({
          "cmd": "print",
          "requestID": "123458976",
          "version": "1.0",
          "task": {
            "taskID": "7293666",
            "preview": false,
            "printer": this.printParams.printer,
            "previewType": "pdf",
            "firstDocumentNumber": 10,
            "totalDocumentCount": 100,
            "documents": [{
              "documentID": "0123456789",
              "contents": [{
                "data": {
                  "_dataFrom": "waybill",
                  "_page_config": {
                    "REQUEST_LAYERED_IMAGE": false
                  },
                  "adsInfo": {
                    "adId": "3",
                    "advertisementType": "DEFAULT",
                    "bannerUrl": "https://ad-cdn.cainiao.com/img/3/1672122736541.png",
                    "miniBannerUrl": "https://ad-cdn.cainiao.com/img/3/1672122733813.png",
                    "useCustomArea": false
                  },
                  "cpCode": "CP446881",
                  "extraInfo": {
                    "appKey": "12175777",
                    "encryptWaybillCode": "zG7MEOejeVDcuQt6QsjCsA%3D%3D",
                    "templateAdDisplayUp": true
                  },
                  "needEncrypt": false,
                  "orderChannelLogo": "https://cdn-cloudprint.cainiao.com/waybill-print/templateImages/tao.png",
                  "orderChannelsType": "TB",
                  "packageInfo": {
                    "goodValue": 34.3,
                    "goodsDescription": "服装",
                    "height": 50,
                    "id": "1",
                    "items": [
                      {
                        "count": 1,
                        "name": "衣服"
                      }
                    ],
                    "length": 30,
                    "packagingDescription": "5纸3木2拖",
                    "totalPackagesCount": 10,
                    "volume": 1,
                    "weight": 1,
                    "width": 30
                  },
                  "parent": false,
                  "realCpCode": "CP446881",
                  "recipient": {
                    "address": {
                      "city": "北京市",
                      "detail": "AES:RomTZ9FHeg4LOQTx2lyM17d9fJHmOF3PGgsIV0mH13Eb0dd50rNzcNYT4ypTQzqghI04MdngeEM6JEDwnSFgHA==",
                      "district": "朝阳区",
                      "province": "北京",
                      "town": "望京街道"
                    },
                    "caid": "As268woscee",
                    "mobile": "13260469442-4846",
                    "name": "李*",
                    "secretConsigneeMobile": "13260469442-4846",
                    "tid": "3719055060544802021"
                  },
                  "routingExtraInfo": {},
                  "routingInfo": {
                    "consolidation": {},
                    "origin": {
                      "code": "660605",
                      "name": "南海区站点"
                    },
                    "receiveBranch": {},
                    "sortation": {},
                    "startCenter": {},
                    "terminalCenter": {}
                  },
                  "secretWaybillType": "recipientSecret",
                  "sender": {
                    "address": {
                      "city": "佛山市",
                      "detail": "九江镇九江大道珠银库房A1栋（京东仓）",
                      "district": "南海区",
                      "province": "广东省"
                    },
                    "mobile": "1326443654",
                    "name": "Bar",
                    "phone": "057123222"
                  },
                  "shippingOption": {
                    "code": "STANDARD_EXPRESS",
                    "title": "标准快递"
                  },
                  "waybillCode": "700059605746"
                },
                "signature": "MD:Aznc5rkMLD16KZwMbdWBtQ==",
                "templateURL": "http://cloudprint.cainiao.com/template/standard/101",
                "ver": "waybill_print_secret_version_1"
              }]
            }]
          }
        }))
      };
      let obj = this.$modal;
      ws.onmessage = (e) => {
        const resp = JSON.parse(e.data || '{}')
        if (resp.command === 'print') {
          console.log('打印结果: ', resp);
          obj.msgError("打印结果！"+JSON.stringify(resp));
        }
      };


      // 当发生错误时触发
      ws.onerror = function(error) {
        obj.msgError("打印失败！");
        console.error('WebSocket error:', error);
        // alert('WebSocket error occurred. Check the console for more details.');
      };

    }
  }
};
</script>
