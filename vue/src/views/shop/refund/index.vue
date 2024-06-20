<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="淘宝天猫" name="taoRefund">
        <tao-refund></tao-refund>
      </el-tab-pane>
      <el-tab-pane label="京东POP" name="jdRefund" lazy>
        <refund-jd></refund-jd>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="pddOrder" lazy>
        <pdd-refund></pdd-refund>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="douOrder" lazy>
        <dou-refund></dou-refund>
      </el-tab-pane>
      <el-tab-pane label="视频号小店" name="weiRefund" lazy>
        <refund-wei></refund-wei>
      </el-tab-pane>


    </el-tabs>

  </div>
</template>

<script>
import TaoRefund  from "@/views/shop/tao/refund/index";
import RefundJd  from "@/views/shop/jd/refund/index";
import RefundWei  from "@/views/shop/wei/refund/index";
import DouRefund from "@/views/dou/refund/index.vue";
import PddRefund from "@/views/shop/pdd/refund/index.vue";

export default {
  name: "refund",
  components:{PddRefund, DouRefund, TaoRefund,RefundJd,RefundWei},
  data() {
    return {
      activeName: 'taoRefund'
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
