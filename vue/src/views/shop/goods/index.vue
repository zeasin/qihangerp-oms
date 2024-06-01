<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="淘宝天猫" name="taoGoods">
        <goods-tao></goods-tao>
      </el-tab-pane>
      <el-tab-pane label="京东POP" name="jdGoods" lazy>
        <goods-jd></goods-jd>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="pddGoods" lazy>
        <goods-pdd></goods-pdd>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="douGoods" lazy>
        <goods-dou></goods-dou>
      </el-tab-pane>
      <el-tab-pane label="视频号小店" name="weiGoods" lazy>
        <goods-wei></goods-wei>
      </el-tab-pane>
<!--      <el-tab-pane label="快手小店" name="kwaiGoods" lazy>-->
<!--        开发中-->
<!--      </el-tab-pane>-->
<!--      <el-tab-pane label="小红书" name="xhsGoods" lazy>-->
<!--        开发中-->
<!--      </el-tab-pane>-->
    </el-tabs>

  </div>
</template>

<script>
import GoodsTao  from "@/views/shop/tao/goods/index";
import GoodsJd  from "@/views/shop/jd/goods/index";
import GoodsDou  from "@/views/shop/dou/goods/index";
import GoodsPdd  from "@/views/shop/pdd/goods/index";
import GoodsWei  from "@/views/shop/wei/goods/index";
export default {
  name: "ShopGoods",
  components:{GoodsTao,GoodsJd,GoodsDou,GoodsPdd,GoodsWei},
  data() {
    return {
      activeName: 'taoGoods'
    };
  },
  created() {

  },
  mounted() {

  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
};
</script>
