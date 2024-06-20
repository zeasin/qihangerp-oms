<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="天猫" name="taoOrder">
        <tao-refund></tao-refund>

      </el-tab-pane>
      <el-tab-pane label="京东" name="jdOrder" lazy>
        <jd-refund></jd-refund>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="douOrder" lazy>
        <dou-refund></dou-refund>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="pddOrder" lazy>
        <pdd-refund></pdd-refund>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import TaoRefund  from "@/views/shop/tao/refund/index";
import JdRefund  from "@/views/shop/jd/refund/index";
import DouRefund from "@/views/dou/refund/index.vue";
import PddRefund from "@/views/shop/pdd/refund/index.vue";

export default {
  name: "refund",
  components:{PddRefund, DouRefund, TaoRefund,JdRefund},
  data() {
    return {
      activeName: 'taoOrder'
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
