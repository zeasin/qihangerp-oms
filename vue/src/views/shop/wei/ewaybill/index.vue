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

    <el-table v-loading="loading" :data="goodsList" @selection-change="handleSelectionChange">
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
  name: "ewaybillWei",
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
        this.goodsList = response.rows;
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
      const ws = new WebSocket('ws://127.0.0.1:12705');
      ws.onopen = () => {
        console.log('与打印组件建立连接成功: ');
        // 或打印机
        ws.send(JSON.stringify({
          requestID: '12345',
          command: 'getPrinterList'
        }))
      };
      let obj = this.$modal;
      ws.onmessage = (e) => {
        const resp = JSON.parse(e.data || '{}')
        if (resp.command === 'getPrinterList') {
          this.printerList = resp.printerList
          obj.msgSuccess("打印组件连接成功！");
          console.log('打印机列表: ', resp.printerList);
        }
      };
      // 当发生错误时触发
      ws.onerror = function(error) {
        obj.msgError("打印组件连接失败！请安装并启动微信视频号小单打印组件！");
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
      const ws = new WebSocket('ws://127.0.0.1:12705');
      ws.onopen = () => {
        console.log('开始打印: ');
        // 打印
        this.ws.send(JSON.stringify({
          command: 'print',
          version: '2.0', // 必传
          requestID: '1234', // String, 调用方保证唯一
          taskList: [{
            taskID: '1234', // String, 调用方保证唯一
            printInfo: 'JTdCJTIycHJpbnREYXRhJTIyJTNBJTdCJTIyd2F5YmlsbElkJTIyJTNBJTIyNzM2MTE0NjI1MzgzODUlMjIlMkMlMjJwcmludFRpbWUlMjIlM0ElMjIyMDI0JTJGMDYlMkYwMyUyMDE4JTNBNDUlMjIlMkMlMjJzZXJ2aWNlcyUyMiUzQSU1QiU1RCUyQyUyMnJlY2VpdmVyTmFtZSUyMiUzQSUyMiVFNSVBRSVBMyoqJTIyJTJDJTIycmVjZWl2ZXJQaG9uZSUyMiUzQSUyMjEzNyoqKiozODQwJTIyJTJDJTIycmVjZWl2ZXJBZGRyZXNzJTIyJTNBJTIyJUU0JUI4JThBJUU2JUI1JUI3JUU1JUI4JTgyJUU0JUI4JThBJUU2JUI1JUI3JUU1JUI4JTgyJUU2JUI1JUE2JUU0JUI4JTlDJUU2JTk2JUIwJUU1JThDJUJBJUU1JUJDJUEwJUU2JUIxJTlGJUU5JTk1JTg3JUU1JUFEJTk5JUU2JUExJUE1JUU4JUI3JUFGMjM4JUU1JUJDJTg0MzAlRTUlOEYlQjcyMDIlRTUlQUUlQTQlMjIlMkMlMjJzZW5kZXJOYW1lJTIyJTNBJTIyJUU0JUI4JTgzJUU5JTg3JThDJUU1JTlEJUFBJTIyJTJDJTIyc2VuZGVyUGhvbmUlMjIlM0ElMjIxNTgxODU5MDExOSUyMiUyQyUyMnNlbmRlckFkZHJlc3MlMjIlM0ElMjIlRTUlQjklQkYlRTQlQjglOUMlRTclOUMlODElRTYlQjclQjElRTUlOUMlQjMlRTUlQjglODIlRTUlQUUlOUQlRTUlQUUlODklRTUlOEMlQkF4eHh4eDElRTUlOEYlQjclRTUlOEMlOTclRTklOTclQTglMjIlMkMlMjJzaXRlQ29kZSUyMiUzQSUyMjU1ODMwJTIyJTJDJTIyZXdheWJpbGxPcmRlcklkJTIyJTNBJTIyMzQ4NjYxMzA5Mzg5ODE0MTY5OSUyMiUyQyUyMmJhZ0FkZHIlMjIlM0ElMjIlRTYlQjIlQUElRTQlQjglOUMlMjIlMkMlMjJtYXJrJTIyJTNBJTIyMzEwLSUyMFA2JTIwMDMxJTIwJTVCQjMxJTVEJTIyJTJDJTIyc3RvcmVOYW1lJTIyJTNBJTIyJUU5JUFBJTg0JUU5JUI5JUJGJUU2JTlDJTlCJUU1JUIxJUIxJUU0JUI4JTkzJUU1JThEJTk2JUU1JUJBJTk3JTIyJTJDJTIyY3VzdG9tZXJOb3RlcyUyMiUzQSUyMiUyMiUyQyUyMm1lcmNoYW50Tm90ZXMlMjIlM0ElMjIlMjIlMkMlMjJvcmRlcklkJTIyJTNBJTIyMzcyMDI5MzQxNTUwOTk1NDgxNiUyMiU3RCUyQyUyMnRlbXBsYXRlJTIyJTNBJTdCJTIydGVtcGxhdGVJZCUyMiUzQSUyMnNpbmdsZSUyMiUyQyUyMnRlbXBsYXRlTmFtZSUyMiUzQSUyMiVFOSVCQiU5OCVFOCVBRSVBNCVFNyVBOSVCQSVFNiVBOCVBMSVFNiU5RCVCRiUyMiUyQyUyMnRlbXBsYXRlRGVzYyUyMiUzQSUyMiVFNCVCOCU4MCVFOCU4MSU5NCVFNSU4RCU5NSVFNiVBMCU4NyVFNSU4NyU4NiVFNiVBOCVBMSVFNiU5RCVCRiUyMiUyQyUyMnRlbXBsYXRlVHlwZSUyMiUzQSUyMnNpbmdsZSUyMiUyQyUyMm9wdGlvbkxpc3QlMjIlM0ElN0IlN0QlMkMlMjJvcHRpb25zJTIyJTNBJTVCJTVEJTJDJTIyY29kZSUyMiUzQTAlMkMlMjJkZWxpdmVyeUlkJTIyJTNBJTIyWlRPJTIyJTJDJTIydGVtcGxhdGVVcmwlMjIlM0ElMjJodHRwcyUzQSUyRiUyRm1tZWMtc2hvcC0xMjU4MzQ0NzA3LmNvcy5hcC1zaGFuZ2hhaS5teXFjbG91ZC5jb20lMkZzaG9wJTJGcHVibGljJTJGMjAyMy0xMC0yNSUyRjNlY2JiM2FhLTViY2YtNDA0ZC05NzJhLThhMDhhODE2MjIzYy5odG1sJTIyJTJDJTIyY3VzdG9tQ29uZmlnJTIyJTNBJTdCJTIyd2lkdGglMjIlM0E2NTYlMkMlMjJoZWlnaHQlMjIlM0EzMDAlMkMlMjJsZWZ0JTIyJTNBNjAlMkMlMjJ0b3AlMjIlM0E5MzAlN0QlMkMlMjJ3aWR0aCUyMiUzQTc2JTJDJTIyaGVpZ2h0JTIyJTNBMTMwJTdEJTdE', // String, [获取打印报文]接口返回的print_info
            printNum: {
              curNum: 1, // 打印计数-当前张数
              sumNum: 2, // 打印计数-总张数
            },
            splitControl: 0 ,// 可不传， 默认为0， 根据自定义内容自动分页；1，禁止分页；2；强制分页， 内容打印在第二页
            showDeliveryLogo: 0, // 可不传， 默认为1， 传0时不展示快递公司logo
            // 自定义模板信息，没有自定义模板需求可不传

            // 面单补充信息，用来覆盖寄件人信息，没有这种需求可以不传

          }],
          printType: 1, // Number 打印类型，默认为 1，打印固定高度的面单；如果为2，则打印任意自定义内容，需要传递 size 参数指定纸张尺寸，printInfo 改为传递 base64 格式的 html
          size: {
            width: 76, // 纸张尺寸，单位毫米，printType 为 2 时必传
            height: 130
          },
          printer: this.printParams.printer, // 选中的打印机，printer.name
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
