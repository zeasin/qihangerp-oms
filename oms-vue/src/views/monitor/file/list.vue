<template>
  <div class="app-container">
    <avue-crud :option="option4"
               :data="data">
    </avue-crud>
  </div>
</template>

<script>
export default {
  name: "index",
  data(){
    return{
      data: [
        {
          rw: "这是一条工作任务",
          nr: "这是一条很长很长很长很长很长很长很长很长很长的工作内容",
          sj: "2019-01-01"
        },
        {
          rw: "这是一条工作任务",
          nr: "这是一条很长很长很长很长很长很长很长很长很长的工作内容",
          sj: "2019-01-01"
        },
        {
          rw: "这是一条工作任务",
          nr: "这是一条很长很长很长很长很长很长很长很长很长的工作内容",
          sj: "2019-01-01"
        },
        {
          rw: "这是一条工作任务",
          nr: "这是一条很长很长很长很长很长很长很长很长很长的工作内容",
          sj: "2019-01-01"
        }
      ]
    }
  },
  computed:{
    option4 () {
      return {
        index: true,
        column: [
          {
            label: '1',
            prop: "rw"
          },
          {
            width: 500,
            label: '2',
            prop: "nr",
            overHidden: true
          },
          {
            label:'3',
            prop: "sj"
          }
        ]
      };
    }
  }
}
</script>

<style scoped>

</style>
