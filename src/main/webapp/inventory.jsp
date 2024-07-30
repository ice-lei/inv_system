<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="js/axios.min.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<div id="app1">
    <h1>库存统计</h1><hr>
    <el-input style="width: 200px" v-model="name" placeholder="请输入所要查询名称"></el-input>
    <el-button @click="selectByName">查询</el-button>
    <el-table
            border
            :data="tableData"
            style="width: 75%;"
            height="100%">
        <el-table-column
                fixed
                prop="inventoryid"
                label="库存id"
                width="150">
        </el-table-column>
        <el-table-column
                prop="productid"
                label="商品id"
                width="120">
        </el-table-column>
        <el-table-column
                prop="productname"
                label="商品名称"
                width="120">
        </el-table-column>
        <el-table-column
                prop="productspecification"
                label="商品属性"
                width="120">
        </el-table-column>
        <el-table-column
                prop="supplier"
                label="进货人"
                width="120">
        </el-table-column>
        <el-table-column
                prop="purchaser"
                label="供应商"
                width="120">
        </el-table-column>
        <el-table-column
                prop="notes"
                label="备注"
                width="120">
        </el-table-column>
        <el-table-column
                prop="quantity"
                label="商品数量"
                width="120">
        </el-table-column>
        <el-table-column
                prop="lastupdate"
                label="最后修改时间"
                width="120">
        </el-table-column>
    </el-table>

</div>
</body>
<script>
    new Vue({
        el: '#app1',
        data() {
            return {
                tableData: [],
                name: ''
            }
        },
        methods:{
            getData(){
                axios({
                    method: 'get',
                    url: 'http://localhost:8080/getInventory'
                }).then(res => {
                    this.tableData = res.data.data
                })
            },
            selectByName(){
                axios({
                    method: 'post',
                    url: 'selectByName',
                    params: {
                        name: this.name
                    }
                }).then(res => {
                    if (res.data.status === 200){
                        this.tableData = res.data.data
                        this.$message({
                            type: 'success',
                            message: '获取成功'
                        })
                    }else if (res.data.status === 500){
                        this.$message({
                            type: 'error',
                            message: '没有此人'
                        })
                    }
                })
            }
        },
        created() {
            this.getData()
        }
    })
</script>
</html>
