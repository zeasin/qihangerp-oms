<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="淘宝天猫" name="printTao" >
        <print-tao></print-tao>
      </el-tab-pane>
      <el-tab-pane label="京东POP" name="printJd" lazy>
        <el-col style="color:red">京东POP电子面单打印暂不提供</el-col>
      </el-tab-pane>
      <el-tab-pane label="拼多多" name="printPdd" lazy>
        <el-col style="color:red">拼多多电子面单打印正在开发中</el-col>
      </el-tab-pane>
      <el-tab-pane label="抖店" name="printDou" lazy>
        <el-col style="color:red">抖店电子面单打印后续开放</el-col>
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


export default {
  name: "print",
  components:{printWei,printTao},
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
