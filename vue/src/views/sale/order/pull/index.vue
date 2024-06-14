<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="天猫" name="taoOrder">
        <order-tao></order-tao>

      </el-tab-pane>
      <el-tab-pane label="京东" name="jdOrder" lazy>
        <order-jd></order-jd>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="douOrder" lazy>
        <order-dou></order-dou>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="pddOrder" lazy>
        <order-pdd></order-pdd>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import OrderTao  from "@/views/shop/tao/order/index";
import OrderJd  from "@/views/shop/jd/order/index";
import OrderDou  from "@/views/shop/dou/order/index";
import OrderPdd  from "@/views/shop/pdd/order/index";
export default {
  name: "Order",
  components:{OrderTao,OrderJd,OrderDou,OrderPdd},
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
