<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="视频号小店" name="ewaybillWei">
        <ewaybill-wei></ewaybill-wei>

      </el-tab-pane>
<!--      <el-tab-pane label="供应商代发货" name="supplierShip" lazy>-->
<!--        <supplier-ship></supplier-ship>-->
<!--      </el-tab-pane>-->
    </el-tabs>

  </div>
</template>

<script>
import ewaybillWei  from "@/views/shop/wei/ewaybill/index.vue";


export default {
  name: "ewaybillPrint",
  components:{ewaybillWei},
  data() {
    return {
      activeName: 'ewaybillWei'
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
