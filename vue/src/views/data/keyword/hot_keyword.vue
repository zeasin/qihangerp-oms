<template>
  <div class="app-container">
    <avue-crud :data="data" @row-save="save" :page="page" :option="option0" @on-load="onLoad" @search-change="search" @row-del="deleteData" @row-update="updateData"></avue-crud>
  </div>
</template>
<script>

import {listAll,saveData,delData,updateData} from "@/api/keyword/keyword";

// /dev-api/system/dict/type/11
export default {
  name: "keyword_list",
  data() {
    return {
      page: {
          pageSize: 20,
          total:0
      },
      queryParams:{
        currentPage:1,
        pageSize:20
      },
      data: [],
      showBorder:true,
      showStripe:true,
      showPage:true
    }
  },
  computed: {
    option0() {
      return {
        searchMenuSpan: 8,
        border: this.showBorder,
        stripe: this.showStripe,
        showHeader: this.showHeader,
        index: true,
        indexLabel:'序号',
        size: this.sizeValue,
        selection: this.showCheckbox,
        page: this.showPage,
        align: "center",
        menuAlign: "center",
        column: [

          {
            label: "来源",
            prop: "source",
            search: true,
            type:'select',
            dicData:[{
                label:'拼多多PC',
                value:'PDD-PIFA'
              },{
                label:'拼多多',
                value:'PDD-YKD'
              },{
                label:'淘宝',
                value:'TAOBAO'
              }],
            // props: {
            //       label: 'dictLabel',
            //       value: 'dictValue'
            // },
            // dicUrl:'/system/dict/data/list?pageNum=1&pageSize=10&dictType=keyword_source',
            rules: [{
              required: true,
              message: "请选择来源",
              trigger: "blur"
            }]
          },
          {
            label: "关键词",
            prop: "word",
            search: true,
            rules: [{
              required: true,
              message: "请输入关键词",
              trigger: "blur"
            }]
          },
          {
            label: "备注",
            prop: "remark"
          },
          {
            label: "日期",
            prop: "date",
            type:'date',
            format:'yyyy-MM-dd',
            search: true,
            rules: [{
              required: true,
              message: "请选择日期",
              trigger: "blur"
            }]
          },
          {
            label: "创建日期",
            prop: "createTime",
            type:'date',
            format:'yyyy-MM-dd HH:mm:ss',
            display:false
          }
        ]
      };
    }
  },
  created() {
    // this.getList()
  },
  methods: {
    search(params,done){

      params.currentPage = 1
      params.pageSize = 20
      if(params.date){
        const year = params.date.getFullYear().toString().padStart(4, '0');
        const month = (params.date.getMonth() + 1).toString().padStart(2, '0');
        const day = params.date.getDate().toString().padStart(2, '0');
        // const hour = params.date.getHours().toString().padStart(2, '0');
        // const minute = date.getMinutes().toString().padStart(2, '0');
        // const second = date.getSeconds().toString().padStart(2, '0');
        // console.log(`${year}-${month}-${day}`)
        params.date = `${year}-${month}-${day}`
      }
      console.log('搜索=-==========',params)
      listAll(params).then(res => {
        this.data = res.records
        this.page.total = res.total
        console.log('========',res)
        done()
      });
    },
    onLoad(page) {
        // this.$message.success('分页信息:' + JSON.stringify(page))
      if(page) {
        this.queryParams.currentPage = page.currentPage
      }
      listAll(this.queryParams).then(res => {
        this.data = res.records
        this.page.total = res.total
        console.log('========',res)
      });
    },
    save(row,done,loading){
      console.log('aass',row,done,loading)
      saveData(row).then(res => {
        console.log('===save=====',res)
        if(res.code === 200){
          this.$message({
            message: '恭喜你，添加成功',
            type: 'success'
          });
          // done(row)
          this.onLoad()
          // row.word = ''
          loading()
        }else{
          this.$message.error('发生错误：'+ res.msg)
        }
      });
    },
    deleteData(row,index){
      console.log('=========删除-==========',row.id,index)

      delData(row.id).then(res =>{
        this.data.splice(index, 1);
      })
    },
    updateData(row,index,done,loading){
      console.log('=========update-==========',row,index)
      updateData(row).then(res => {
        console.log('======修改完成======',res)
        done(row)
      })
    }
  }
}
</script>
