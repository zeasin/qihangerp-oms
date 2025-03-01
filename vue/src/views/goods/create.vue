<template>
  <div class="app-container">
    <el-form ref="form" :model="form" :rules="rules" label-width="108px">

        <el-form-item label="商品分类" prop="categoryId">
          <treeselect :options="dataList" placeholder="请选择上级菜单" v-model="form.categoryId" style="width:220px" @select="categoryChange" />
        </el-form-item>
        <el-form-item label="供应商" prop="supplierId">
          <!-- <el-input v-model="form.supplierId" placeholder="请输入供应商id" /> -->
          <el-select v-model="form.supplierId" filterable  placeholder="请选择供应商名称">
            <el-option v-for="item in supplierList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
        </el-form-item>
        <el-form-item label="商品名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品图片1" prop="image">
           <image-upload v-model="form.image" :limit="1"/>
           <el-input v-model="form.image" placeholder="请输入商品图片" />
        </el-form-item>
        <el-form-item label="商品编号" prop="number" >
          <el-input v-model="form.number" placeholder="请输入商品编号" style="width:220px"/>
        </el-form-item>
      <el-form-item label="外部ERP商品ID" prop="outerErpGoodsId" >
        <el-input v-model="form.outerErpGoodsId" placeholder="请输入外部ERP商品ID" style="width:220px"/>
      </el-form-item>
         <el-form-item label="预计采购价格" prop="purPrice">
          <el-input type="number" v-model.number="form.purPrice" placeholder="请输入预计采购价格" style="width:220px"/>
        </el-form-item>
        <!-- <el-form-item label="建议批发价" prop="wholePrice">
          <el-input type="number" v-model.number="form.wholePrice" placeholder="请输入建议批发价" style="width:220px"/>
        </el-form-item>
        <el-form-item label="建议零售价" prop="retailPrice">
          <el-input type="number" v-model.number="form.retailPrice" placeholder="请输入建议零售价" style="width:220px"/>
        </el-form-item> -->
        <el-form-item label="单位名称" prop="unitName">
          <el-input v-model="form.unitName" placeholder="请输入单位名称" style="width:220px" />
        </el-form-item>
        <el-form-item label="条码" prop="barCode">
          <el-input v-model="form.barCode" placeholder="请输入条码" style="width:220px"/>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <!-- <el-form-item label="衣长/裙长/裤长" prop="length">
          <el-input v-model="form.length" placeholder="请输入衣长/裙长/裤长" />
        </el-form-item>
        <el-form-item label="高度/袖长" prop="height">
          <el-input v-model="form.height" placeholder="请输入高度/袖长" />
        </el-form-item>
        <el-form-item label="宽度/胸阔(围)" prop="width">
          <el-input v-model="form.width" placeholder="请输入宽度/胸阔(围)" />
        </el-form-item>
        <el-form-item label="肩阔" prop="width1">
          <el-input v-model="form.width1" placeholder="请输入肩阔" />
        </el-form-item>
        <el-form-item label="腰阔" prop="width2">
          <el-input v-model="form.width2" placeholder="请输入腰阔" />
        </el-form-item>
        <el-form-item label="臀阔" prop="width3">
          <el-input v-model="form.width3" placeholder="请输入臀阔" />
        </el-form-item>
        <el-form-item label="重量" prop="weight">
          <el-input v-model="form.weight" placeholder="请输入重量" />
        </el-form-item>
        <el-form-item label="0启用   1禁用" prop="disable">
          <el-input v-model="form.disable" placeholder="请输入0启用   1禁用" />
        </el-form-item>
        <el-form-item label="保质期" prop="period">
          <el-input v-model="form.period" placeholder="请输入保质期" />
        </el-form-item> -->

        <!-- <el-form-item label="单位成本" prop="unitCost">
          <el-input v-model="form.unitCost" placeholder="请输入单位成本" />
        </el-form-item> -->

       <!--  <el-form-item label="品牌id" prop="brandId">
          <el-input v-model="form.brandId" placeholder="请输入品牌id" />
        </el-form-item> -->
        <!-- <el-form-item label="属性1：季节" prop="attr1">
          <el-input v-model="form.attr1" placeholder="请输入属性1：季节" />
        </el-form-item>
        <el-form-item label="属性2：分类" prop="attr2">
          <el-input v-model="form.attr2" placeholder="请输入属性2：分类" />
        </el-form-item>
        <el-form-item label="属性3：风格" prop="attr3">
          <el-input v-model="form.attr3" placeholder="请输入属性3：风格" />
        </el-form-item>
        <el-form-item label="属性4：年份" prop="attr4">
          <el-input v-model="form.attr4" placeholder="请输入属性4：年份" />
        </el-form-item>
        <el-form-item label="属性5：面料" prop="attr5">
          <el-input v-model="form.attr5" placeholder="请输入属性5：面料" />
        </el-form-item> -->
        <el-form-item label="外链url" prop="linkUrl">
          <el-input v-model="form.linkUrl" placeholder="请输入内容" />
        </el-form-item>
       <!--  <el-form-item label="最低库存" prop="lowQty">
          <el-input v-model="form.lowQty" placeholder="请输入最低库存" />
        </el-form-item>
        <el-form-item label="最高库存" prop="highQty">
          <el-input v-model="form.highQty" placeholder="请输入最高库存" />
        </el-form-item> -->
        <el-form-item label="发货地" prop="provinces">
          <el-cascader style="width:250px"
            size="large"
            :options="pcaTextArr"
            v-model="form.provinces">
          </el-cascader>
        </el-form-item>
        <el-form-item label="商品规格">
          <el-row :gutter="10" class="mb8" >
            <el-col :span="1.5" style="width: 56px">颜色：</el-col>
            <el-col :span="20">
              <treeselect :options="colorList" placeholder="颜色" v-model="form.colorValues" :normalizer="normalizer"  @input="onSpecChange" :multiple="true" />
            </el-col>
          </el-row>
          <el-row :gutter="10" class="mb8" >

            <el-col :span="24" style="margin-left: 60px;">
              <ul style=" display: flex;list-style: none;padding: 0;">
                <li v-for="color in form.colorValues" :key="color" style="margin-left: 20px;">
                  <el-upload
                    class="avatar-uploader"
                    :action="uploadImgUrl"
                    :show-file-list="false"
                    :headers="headers"
                    :on-success="(response, file, fileList) =>
                handleUploadSuccess(
                  response,
                  file,
                  fileList,
                  color
                )
            "
                    :before-upload="handleBeforeUpload">
                    <img v-if="form.colorImages[color]" :src="form.colorImages[color]" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                  </el-upload>
                  <span>{{form.colorNames[color]}}</span>
                </li>
              </ul>

            </el-col>
          </el-row>
          <el-row :gutter="10" class="mb8" >
            <el-col :span="1.5" style="width: 60px">尺码：</el-col>
            <el-col :span="20">
              <treeselect :options="sizeList" placeholder="尺码" v-model="form.sizeValues" :normalizer="normalizer" @input="onSpecChange" :multiple="true" />
            </el-col>
          </el-row>
          <el-row :gutter="10" class="mb8" >
            <el-col :span="1.5" style="width: 60px">款式：</el-col>
            <el-col :span="20">
              <treeselect :options="styleList" placeholder="款式" v-model="form.styleValues" :normalizer="normalizer" @input="onSpecChange" :multiple="true" />
            </el-col>
          </el-row>

        </el-form-item>
        <!-- <el-divider content-position="center" style="margin-left: 98px;">商品信息</el-divider> -->

        <el-table style="margin-left: 108px;" :data="form.specList" :row-class-name="rowSShopOrderItemIndex" ref="sShopOrderItem">
          <el-table-column label="序号" align="center" prop="index" width="50"/>
          <el-table-column label="颜色" prop="color" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.colorValue" disabled placeholder="颜色" />
            </template>
          </el-table-column>
          <el-table-column label="尺码" prop="size" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.sizeValue" disabled placeholder="尺码" />
            </template>
          </el-table-column>
          <el-table-column label="款式" prop="style" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.styleValue" disabled placeholder="款式" />
            </template>
          </el-table-column>
          <el-table-column label="规格编码" prop="specNum" width="150">
            <template slot-scope="scope">
              <el-input v-model="scope.row.specNum" placeholder="规格编码" />
            </template>
          </el-table-column>
          <el-table-column label="预计采购价" prop="purPrice" width="150">
            <template slot-scope="scope">
              <el-input v-model.number="scope.row.purPrice" placeholder="预计采购价" />
            </template>
          </el-table-column>
          <el-table-column label="外部ERP商品Sku Id" prop="outerErpSkuId" width="200">
            <template slot-scope="scope">
              <el-input v-model.number="scope.row.outerErpSkuId" placeholder="外部ERP商品Sku Id" />
            </template>
          </el-table-column>
<!--          <el-table-column label="规格图片" prop="colorImage" width="150">-->
<!--            <template slot-scope="scope">-->
<!--&lt;!&ndash;              <image-upload v-model="scope.row.colorImage" :limit="1" style="width: 100px;height: 100px"/>&ndash;&gt;-->
<!--              <el-upload-->
<!--                class="avatar-uploader"-->
<!--                :action="uploadImgUrl"-->
<!--                :show-file-list="false"-->
<!--                :headers="headers"-->
<!--                :file-list="fileList"-->
<!--                :on-success="handleUploadSuccess"-->
<!--                :before-upload="handleBeforeUpload">-->
<!--                <img v-if="scope.row.colorImage" :src="scope.row.colorImage" class="avatar">-->
<!--                <i v-else class="el-icon-plus avatar-uploader-icon"></i>-->
<!--              </el-upload>-->
<!--            </template>-->

<!--          </el-table-column>-->
        </el-table>
      </el-form>
      <div slot="footer" class="dialog-footer" style="margin-left: 108px;margin-top:20px;margin-bottom: 50px;">
        <el-button type="primary" @click="submitForm">添加商品</el-button>
        <!-- <el-button @click="cancel">取 消</el-button> -->
      </div>
  </div>
</template>

<script>
import Treeselect from '@riophae/vue-treeselect'
import '@riophae/vue-treeselect/dist/vue-treeselect.css'
import { listCategory } from "@/api/goods/category";
import { listCategoryAttributeValue } from "@/api/goods/categoryAttributeValue";
import { addGoods } from "@/api/goods/goods";
import { getToken } from "@/utils/auth";
import {
  provinceAndCityData,
  pcTextArr,
  regionData,
  pcaTextArr,
  codeToText,
} from "element-china-area-data";
import {listSupplier} from "@/api/goods/supplier";
import {listCategoryAttribute} from "@/api/goods/categoryAttribute";
export default {
  name: "OrderCreate",
  components: { Treeselect },
  data() {
    return {
      uploadImgUrl: process.env.VUE_APP_BASE_API + "/api/oms-api/images/upload",
      headers: {
        Authorization: "Bearer " + getToken(),
      },
      // 文件类型, 例如['png', 'jpg', 'jpeg']
      fileType: ["png", "jpg", "jpeg"],
      uploadList: [],
      fileList: [],
      // 表单参数
      form: {
        province:undefined,
        city:undefined,
        town:undefined,
        colorValues:undefined,
        colorImages:{},
        colorNames:{},
        sizeValues:undefined,
        styleValues:undefined,
        outerErpGoodsId:undefined,
        number:'',
        specList:[],
        provinces: [],

      },
      supplierList: [],
      pcaTextArr,
      dataList:[{
          id: 'fruits',
          label: 'Fruits',
          children: [],
      }],
      // 表单校验
      rules: {
        categoryId: [{ required: true, message: '请选择分类' }],
        supplierId: [{ required: true, message: '请选择供应商' }],
        name: [{ required: true, message: '商品名不能为空' }],
        image: [{ required: true, message: '商品图片不能为空' }],
        number: [{ required: true, message: '商品编码不能为空' }],
        purPrice: [{ required: true, message: '请填写预计采购价' }],

      },
      // 子表选中数据
      checkedSShopOrderItem: [],
      // 颜色
      colorList:[],
      // 尺码
      sizeList:[],
      //款式
      styleList:[],
      privateData:{}
    };
  },
  created() {
    this.getCategoryList()
    listSupplier({pageNum: 1, pageSize: 100}).then(resp=>{
      this.supplierList = resp.rows
    })
    // listCategoryAttributeValue({categoryAttributeId:114}).then(resp=>{
    //   this.colorList = resp.rows
    // })
    // listCategoryAttributeValue({categoryAttributeId:115}).then(resp=>{
    //   this.sizeList = resp.rows
    // })
    // listCategoryAttributeValue({categoryAttributeId:116}).then(resp=>{
    //   this.styleList = resp.rows
    // })
  },
  methods: {
    categoryChange(node, instanceId){
      console.log("====分类边哈11111====",node,instanceId)
      console.log("====分类边哈====",this.form.categoryId)
      if(node){
        this.form.categoryId = node.id
        console.log("====分类边哈2====",this.form.categoryId)
        let topCategoryId = 0;
        if(node.parentId===0) topCategoryId=node.id;
        else topCategoryId = node.parentId
        console.log("====分类边哈22222====",topCategoryId)
        this.colorList = []
        this.sizeList = []
        this.styleList=[]
        listCategoryAttribute({categoryId:topCategoryId}).then(response => {
          this.categoryAttributeList = response.rows;
          if(response.rows){
            // 获取分类属性
            response.rows.forEach(x=>{
              listCategoryAttributeValue({categoryAttributeId:x.id}).then(resp=>{

                if(x.code==='color'){
                  this.colorList = resp.rows
                }else if(x.code==='size'){
                  this.sizeList = resp.rows
                }else if(x.code==='style'){
                  this.styleList = resp.rows
                }

              })
            })
          }
        });


        // 获取分类属性
        // listCategoryAttributeValue({categoryAttributeId:114}).then(resp=>{
        //   this.colorList = resp.rows
        // })
        // listCategoryAttributeValue({categoryAttributeId:115}).then(resp=>{
        //   this.sizeList = resp.rows
        // })
        // listCategoryAttributeValue({categoryAttributeId:116}).then(resp=>{
        //   this.styleList = resp.rows
        // })
      }
    },
    getRowDate(row){

    },
    // 上传前loading加载
    handleBeforeUpload(file) {
      let isImg = false;
      if (this.fileType.length) {
        let fileExtension = "";
        if (file.name.lastIndexOf(".") > -1) {
          fileExtension = file.name.slice(file.name.lastIndexOf(".") + 1);
        }
        isImg = this.fileType.some(type => {
          if (file.type.indexOf(type) > -1) return true;
          if (fileExtension && fileExtension.indexOf(type) > -1) return true;
          return false;
        });
      } else {
        isImg = file.type.indexOf("image") > -1;
      }

      if (!isImg) {
        this.$modal.msgError(`文件格式不正确, 请上传${this.fileType.join("/")}图片格式文件!`);
        return false;
      }
      if (this.fileSize) {
        const isLt = file.size / 1024 / 1024 < this.fileSize;
        if (!isLt) {
          this.$modal.msgError(`上传头像图片大小不能超过 ${this.fileSize} MB!`);
          return false;
        }
      }
      // this.$modal.loading("正在上传图片，请稍候...");
      // this.number++;
    },
    // 文件个数超出
    handleExceed() {
      this.$modal.msgError(`上传文件数量不能超过 ${this.limit} 个!`);
    },
    // 上传成功回调
    handleUploadSuccess(response, file,ty, color) {
      // console.log('====上传成功回调====',file,response)
      console.log('====上传成功回调====',color,response.url)
      this.$nextTick(()=>{
        this.form.colorImages[color] = response.url
        console.log('=====上传回调赋值=====',this.form.colorImages)
      })
      this.form = { ...this.form, colorImages: { ...this.form.colorImages, [color]: response.url } };
      // if (res.code ===   200) {
      //
      //   this.uploadList.push({ name: res.fileName, url: res.url });
      //   this.uploadedSuccessfully();
      // } else {
      //   this.number--;
      //   this.$modal.closeLoading();
      //   this.$modal.msgError(res.msg);
      //   this.$refs.imageUpload.handleRemove(file);
      //   this.uploadedSuccessfully();
      // }
    },
    // 删除图片
    handleDelete(file) {
      const findex = this.fileList.map(f => f.name).indexOf(file.name);
      if(findex > -1) {
        this.fileList.splice(findex, 1);
        this.$emit("input", this.listToString(this.fileList));
      }
    },
    // 上传失败
    handleUploadError() {
      this.$modal.msgError("上传图片失败，请重试");
      this.$modal.closeLoading();
    },
    // 上传结束处理
    uploadedSuccessfully() {
      if (this.number > 0 && this.uploadList.length === this.number) {
        this.fileList = this.fileList.concat(this.uploadList);
        this.uploadList = [];
        this.number = 0;
        this.$emit("input", this.listToString(this.fileList));
        this.$modal.closeLoading();
      }
    },
    normalizer(node) {
      return {
        id: node.id,
        label: node.value
      };
    },
    buildTree(list, parentId) {
      let tree = [];
      for (let i = 0; i < list.length; i++) {
        if (list[i].parentId === parentId) {
          let node = {
            id: list[i].id,
            parentId:list[i].parentId,
            label: list[i].name,
            children: this.buildTree(list, list[i].id)
          };
          tree.push(node);
        }
      }
      return tree;
    },
    /** 查询商品分类列表 */
    getCategoryList() {
      // this.loading = true;
      listCategory(this.queryParams).then(response => {
        this.dataList = this.buildTree(response.rows,0)
        // console.log("构建后的list",this.categoryList)
        // this.total = response.total;
        this.loading = false;
      });
    },
    onSpecChange(selected){
      // console.log('=====选择了=======',selected)
      // console.log('=======颜色：====',this.form.colorValues)
      // console.log('=======尺码：====',this.form.sizeValues)
      // console.log('=======款式：====',this.form.styleValues)

      //组合
      if(this.form.colorValues){
        this.form.specList = []
        // this.form.specList.push()
        if(this.form.sizeValues && this.form.styleValues){
          console.log('====颜色、尺码、款式===')
          this.form.colorValues.forEach(c=>{
              const color = this.colorList.find(x=>x.id === c)
              this.form.sizeValues.forEach(s=>{
                const size = this.sizeList.find(y=>y.id === s)
                this.form.styleValues.forEach(st=>{
                const style = this.styleList.find(z=>z.id === st)
                 const spec = {
                  colorId:c,
                  colorValue:color.value,
                  sizeId:s,
                  sizeValue:size.value,
                  styleId:st,
                  styleValue:style.value,
                  specNum:this.form.number+color.skuCode+size.skuCode+style.skuCode
                }
                this.form.specList.push(spec)
                })
              })
            })

        }else {
          // 有一个没有选择
          if(this.form.sizeValues){
            console.log('====颜色、尺码===')
            this.form.colorValues.forEach(c=>{
              const color = this.colorList.find(x=>x.id === c)
              this.form.sizeValues.forEach(s=>{
                const size = this.sizeList.find(y=>y.id === s)
                 const spec = {
                  colorId:c,
                  colorValue:color.value,
                  sizeId:s,
                  sizeValue:size.value,
                  styleId:null,
                  styleValue:'',
                  specNum:this.form.number+color.skuCode+size.skuCode
                }
                this.form.specList.push(spec)
              })
            })
          }else if(this.form.styleValues){
            // 选择了款式
            console.log('====颜色、款式===')

          }else{
            console.log('====颜色===')
            this.form.colorValues.forEach(x=>{
              const color = this.colorList.find(c=>c.id === x)
              const spec = {
                colorId:x,
                colorValue:color.value,
                sizeId:null,
                sizeValue:'',
                styleId:null,
                styleValue:'',
                specNum:this.form.number+color.skuCode
              }
              this.form.specList.push(spec)
            })
          }
        }

        this.form.colorNames = {}
        this.form.colorValues.forEach(c=>{
          const color = this.colorList.find(x=>x.id === c)
          this.form.colorNames[c] = color.value
        })
      }else{
        this.$modal.msgError("必须选择【颜色】")
        this.form.sizeValues = []
        this.form.styleValues = []
      }



    },
    /** ${subTable.functionName}序号 */
    rowSShopOrderItemIndex({ row, rowIndex }) {
      row.index = rowIndex + 1;
    },
    /** 提交按钮 */
    submitForm() {
      console.log('=====添加商品===',this.form)
      this.$refs["form"].validate(valid => {
        if (valid) {

          // 判断规格 specList
          if(!this.form.specList || this.form.specList.length === 0){
            this.$modal.msgError("请添加商品规格")
            return
          }else{
            for(let i=0;i<this.form.specList.length;i++){
              const sp = this.form.specList[i]
              if(!sp.specNum){
                this.$modal.msgError("商品规格编码不能为空")
                return
              }
            }

          }

          this.form.province = this.form.provinces[0]
          this.form.city = this.form.provinces[1]
          this.form.town = this.form.provinces[2]

          addGoods(this.form).then(response => {
            this.$modal.msgSuccess("商品添加成功");
            // 调用全局挂载的方法,关闭当前标签页
            this.$store.dispatch("tagsView/delView", this.$route);
            this.$router.push('/goods/goods_list');
          });



        }
      });
    }
  }
};

</script>
<style>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 78px;
  height: 78px;
  line-height: 78px;
  text-align: center;
}
.avatar {
  width: 78px;
  height: 78px;
  display: block;
}
</style>
