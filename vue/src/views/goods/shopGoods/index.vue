<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="天猫" name="taoGoods">
        <goods-tao></goods-tao>
      </el-tab-pane>
      <el-tab-pane label="京东" name="jdGoods" lazy>
        <goods-jd></goods-jd>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="douOrder" lazy>
        <goods-dou></goods-dou>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="pddOrder" lazy>
        <goods-pdd></goods-pdd>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import GoodsTao  from "@/views/tao/goods/index";
import GoodsJd  from "@/views/jd/goods/index";
import GoodsDou  from "@/views/dou/goods/index";
import GoodsPdd  from "@/views/pdd/goods/index";
export default {
  name: "Goods",
  components:{GoodsTao,GoodsJd,GoodsDou,GoodsPdd},
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
