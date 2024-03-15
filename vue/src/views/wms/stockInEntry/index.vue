<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="单据编号" prop="no">
        <el-input
          v-model="queryParams.no"
          placeholder="请输入单据编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="来源单号" prop="sourceNo">
        <el-input
          v-model="queryParams.sourceNo"
          placeholder="请输入来源单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="入库人" prop="stockInOperator">
        <el-input
          v-model="queryParams.stockInOperator"
          placeholder="请输入操作入库人"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="入库时间" prop="stockInTime">
        <el-date-picker clearable
          v-model="queryParams.stockInTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择入库时间">
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
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['wms:WmsStockInEntry:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="WmsStockInEntryList" @selection-change="handleSelectionChange">
<!--      <el-table-column type="selection" width="55" align="center" />-->
      <el-table-column label="主键ID" align="center" prop="id" />
      <el-table-column label="单号" align="center" prop="no" />
      <el-table-column label="来源单号" align="center" prop="sourceNo" />
      <el-table-column label="来源单id" align="center" prop="sourceId" />
      <el-table-column label="来源类型" align="center" prop="sourceType" >
        <template slot-scope="scope">
        <el-tag size="small" v-if="scope.row.sourceType ===1 ">采购订单</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="采购订单商品数" align="center" prop="sourceGoodsUnit" />
      <el-table-column label="采购订单总件数" align="center" prop="sourceSpecUnitTotal" />
      <el-table-column label="采购订单商品规格数" align="center" prop="sourceSpecUnit" />
      <el-table-column label="备注" align="center" prop="remark" />
<!--      <el-table-column label="操作入库人id" align="center" prop="stockInOperatorId" />-->
      <el-table-column label="操作入库人" align="center" prop="stockInOperator" />
      <el-table-column label="最后入库时间" align="center" prop="stockInTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.stockInTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" >
        <template slot-scope="scope">
         <el-tag size="small" v-if="scope.row.status === 0">待入库</el-tag>
         <el-tag size="small" v-if="scope.row.status === 1">部分入库</el-tag>
         <el-tag size="small" v-if="scope.row.status === 2">完全入库</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.status === 0 || scope.row.status === 1"
            size="mini"
            type="primary"
            icon="el-icon-edit"
            @click="handleStockIn(scope.row)"
            v-hasPermi="['wms:WmsStockInEntry:edit']"
          >入库</el-button>
          <el-button
            v-if="scope.row.status ===1 "
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleStockInComplete(scope.row)"
            v-hasPermi="['api:goodsInventory:remove']"
          >入库完成</el-button>
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

    <!-- 添加或修改入库单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" inline>
        <el-descriptions title="表单信息">
          <el-descriptions-item label="ID">{{form.id}}</el-descriptions-item>
          <el-descriptions-item label="入库单号">{{form.no}}</el-descriptions-item>
          <el-descriptions-item label="来源单号">{{form.sourceNo}}</el-descriptions-item>
          <el-descriptions-item label="类型">
            <el-tag size="small" v-if="form.sourceType ===1 ">采购订单</el-tag>
          </el-descriptions-item>

          <el-descriptions-item label="备注">
            {{form.remark}}
          </el-descriptions-item>
          <el-descriptions-item label="状态">
            <el-tag size="small" v-if="form.status ===0 ">待入库</el-tag>
            <el-tag size="small" v-if="form.status ===1 ">部分入库</el-tag>
            <el-tag size="small" v-if="form.status ===2 ">完全入库</el-tag>
          </el-descriptions-item>

          <el-descriptions-item label="创建时间">
            {{ form.createTime }}
          </el-descriptions-item>
        </el-descriptions>
        <el-descriptions title="商品统计">
          <el-descriptions-item label="商品数"> {{ form.sourceGoodsUnit }}</el-descriptions-item>
          <el-descriptions-item label="商品规格数"> {{ form.sourceSpecUnit }}</el-descriptions-item>
          <el-descriptions-item label="总件数"> {{ form.sourceSpecUnitTotal }}</el-descriptions-item>
        </el-descriptions>


        <el-divider content-position="center">入库单明细信息</el-divider>

        <el-table style="margin-bottom: 10px;" :data="wmsStockInEntryItemList" :row-class-name="rowWmsStockInEntryItemIndex" ref="wmsStockInEntryItem">
<!--          <el-table-column type="selection" width="50" align="center" />-->
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="商品图片" width="80">
            <template slot-scope="scope">
              <el-image style="width: 70px; height: 70px" :src="scope.row.colorImage"></el-image>
            </template>
          </el-table-column>
          <el-table-column label="商品标题" prop="goodsName" ></el-table-column>
          <el-table-column label="规格"  width="150">
            <template slot-scope="scope">
              <el-tag size="small">{{scope.row.colorValue}} {{scope.row.sizeValue}} {{scope.row.styleValue}}</el-tag>
            </template>
          </el-table-column>
<!--          <el-table-column label="sku编码" prop="specNum"></el-table-column>-->
          <el-table-column label="数量" prop="originalQuantity"></el-table-column>
          <el-table-column label="已入库数量" prop="inQuantity"></el-table-column>
<!--          <el-table-column label="来源类型" prop="sourceType" width="150">-->
<!--            <template slot-scope="scope">-->
<!--              <el-select v-model="scope.row.sourceType" placeholder="请选择来源类型">-->
<!--                <el-option label="请选择字典生成" value="" />-->
<!--              </el-select>-->
<!--            </template>-->
<!--          </el-table-column>-->
          <el-table-column label="入库数量" prop="inQuantity" width="110">
            <template slot-scope="scope">
              <el-input v-model.number="scope.row.quantity" placeholder="入库数量" @input="qtyChange(scope.row)"/>
            </template>
          </el-table-column>
          <el-table-column label="入库仓位编码" prop="locationId" width="150">
            <template slot-scope="scope">
              <el-select v-model="scope.row.locationId" filterable remote reserve-keyword placeholder="搜索仓位编码"
                         :remote-method="searchLocation" :loading="locationLoading" @change="locationChanage(scope.row)">
                <el-option v-for="item in locationList" :key="item.id"
                           :label="item.name"
                           :value="item.id">
                  <span style="float: left">{{ item.name }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ item.number }}</span>
                </el-option>
              </el-select>
<!--              <el-input v-model="scope.row.locationNum" placeholder="请输入入库仓位编码" />-->
            </template>
          </el-table-column>
          <el-table-column label="总入库数量" prop="totalQuantity"></el-table-column>
        </el-table>

<!--        <el-form-item label="操作入库人id" prop="stockInOperatorId">-->
<!--          <el-input v-model="form.stockInOperatorId" placeholder="请输入操作入库人id" />-->
<!--        </el-form-item>-->
        <el-form-item label="入库人" prop="stockInOperator">
          <el-input v-model="form.stockInOperator" placeholder="请输入操作入库人" />
        </el-form-item>
        <el-form-item label="入库时间" prop="stockInTime">
          <el-date-picker clearable
                          v-model="form.stockInTime"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          placeholder="请选择入库时间">
          </el-date-picker>
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
import { listWmsStockInEntry, getWmsStockInEntry, stockIn } from "@/api/wms/WmsStockInEntry";
import { searchLocation } from "@/api/wms/location";
import {complete} from "../../../api/wms/WmsStockInEntry";
export default {
  name: "WmsStockInEntry",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 子表选中数据
      checkedWmsStockInEntryItem: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 入库单表格数据
      WmsStockInEntryList: [],
      // 入库单明细表格数据
      wmsStockInEntryItemList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        no: null,
        sourceNo: null,
        sourceId: null,
        sourceType: null,
        sourceGoodsUnit: null,
        sourceSpecUnitTotal: null,
        sourceSpecUnit: null,
        stockInOperatorId: null,
        stockInOperator: null,
        stockInTime: null,
      },
      // 表单参数
      form: {},
      // 仓库列表
      locationList:[],
      locationLoading:false,
      // 表单校验
      rules: {
        stockInOperator: [
          { required: true, message: "不能为空", trigger: "blur" }
        ],
        stockInTime: [
          { required: true, message: "不能为空", trigger: "change" }
        ],
        inQuantity: [
          { required: true, message: "不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    searchLocation(query){
      this.locationLoading = true;
      const qw = {
        number: query
      }
      searchLocation(qw).then(res => {
        this.locationList = res.rows;
        this.locationLoading = false;
      })
    },
    locationChanage(row){
      const selection = this.locationList.find(x => x.id === row.locationId);
      if (selection) {
        row.locationNum = selection.number
      }
    },
    qtyChange(row) {
      console.log('======值变化=====', row)
      if(row.quantity){
        row.totalQuantity = parseInt(row.inQuantity) + parseInt(row.quantity)
      }else {
        row.totalQuantity = row.inQuantity
      }

    },
    /** 查询入库单列表 */
    getList() {
      this.loading = true;
      listWmsStockInEntry(this.queryParams).then(response => {
        this.WmsStockInEntryList = response.rows;
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
        stockInOperator: null,
        stockInTime: null,
      };
      this.wmsStockInEntryItemList = [];
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
    handleStockInComplete(row){
      this.$modal.confirm('确认完成之后就不能再入库了！您确定吗？').then(function() {
        return complete(row.id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("状态修改成功");
      }).catch(() => {});
    },
    /** 修改按钮操作 */
    handleStockIn(row) {
      this.reset();
      const id = row.id || this.ids
      getWmsStockInEntry(id).then(response => {
        this.form = response.data;
        this.wmsStockInEntryItemList = response.data.wmsStockInEntryItemList;
        this.wmsStockInEntryItemList.forEach(x=>{
          x.quantity = null
          x.totalQuantity = x.inQuantity
          x.locationId = null
        })
        this.open = true;
        this.title = "入库操作";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.wmsStockInEntryItemList = this.wmsStockInEntryItemList;
          // 验证数据
          let isValid = false
          for(let i = 0;i<this.form.wmsStockInEntryItemList.length;i++){
            const x = this.form.wmsStockInEntryItemList[i]
            if(x.quantity && !x.locationId){
                isValid = false;
                break
            }else if(x.locationId && !x.quantity){
              isValid = false;
              break
            }else isValid = true
          }
          // this.form.wmsStockInEntryItemList.forEach(x=>{
          //   if(x.quantity){
          //     if(!x.locationId){
          //       isValid = false;
          //       break
          //     }
          //   }
          // })
          if(isValid){
            console.log('=======验证通过了========')
            stockIn(this.form).then(response => {
              this.$modal.msgSuccess("入库操作成功");
              this.open = false;
              this.getList();
            });
          }else{
            this.$modal.msgError("请填写入库数量和仓位编码");
          }
        }
      });
    },
	/** 入库单明细序号 */
    rowWmsStockInEntryItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('wms/WmsStockInEntry/export', {
        ...this.queryParams
      }, `WmsStockInEntry_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
