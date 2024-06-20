<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="淘宝天猫" name="printTao" lazy>
        <print-tao></print-tao>
      </el-tab-pane>
      <el-tab-pane label="京东POP" name="printJd" lazy>
        <print-jd></print-jd>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="printPdd" lazy>
        <print-pdd></print-pdd>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="printDou" lazy>
        <print-dou></print-dou>
      </el-tab-pane>
      <el-tab-pane label="视频号小店" name="printWei" lazy>
        <print-wei></print-wei>
      </el-tab-pane>

    </el-tabs>

  </div>
</template>

<script>
import printWei  from "@/views/shop/wei/ewaybill/index.vue";
import printTao from "@/views/shop/tao/ewaybill/index.vue";
import printPdd from "@/views/shop/pdd/ewaybill/index.vue";
import printDou from "@/views/shop/dou/ewaybill/index.vue";
import PrintJd from "@/views/shop/jd/ewaybill/index.vue";


export default {
  name: "print",
  components:{PrintJd, printWei,printTao,printPdd,printDou},
  data() {
    return {
      activeName: 'printTao'
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
