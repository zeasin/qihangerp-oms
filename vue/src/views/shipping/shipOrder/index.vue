<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="仓库发货" name="stockShip">
        <wms-ship></wms-ship>

      </el-tab-pane>
      <el-tab-pane label="供应商代发货" name="supplierShip" lazy>
        <supplier-ship></supplier-ship>
      </el-tab-pane>
    </el-tabs>

  </div>
</template>

<script>
import supplierShip  from "@/views/shipping/shipOrder/supplierShip.vue";
import wmsShip  from "@/views/shipping/shipOrder/wmsShip.vue";

export default {
  name: "stocking",
  components:{supplierShip,wmsShip},
  data() {
    return {
      activeName: 'stockShip'
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
