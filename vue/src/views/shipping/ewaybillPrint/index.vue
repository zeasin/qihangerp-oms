<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="淘宝天猫" name="printTao" >
        <print-tao></print-tao>
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
