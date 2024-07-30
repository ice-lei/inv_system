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
    <h1>商品管理</h1>
    <hr>
    <el-button @click="addProduct" type="primary">添加商品</el-button>
    <el-input style="width: 200px" v-model="name" placeholder="请输入所要查找的商品名称"></el-input><el-button @click="selectProduct" type="primary">查询</el-button>
    <el-table
            border
            :data="tableData"
            style="width: 100%;"
            height="100%">
        <el-table-column
                fixed
                prop="productid"
                label="商品id"
                width="150">
        </el-table-column>
        <el-table-column
                prop="productname"
                label="商品名称"
                width="120">
        </el-table-column>
        <el-table-column
                prop="productspecification"
                label="商品特点"
                width="120">
        </el-table-column>
        <el-table-column
                prop="origin"
                label="商品归属地"
                width="120">
        </el-table-column>
        <el-table-column
                prop="manufacturer"
                label="制造者"
                width="120">
        </el-table-column>
        <el-table-column
                prop="brand"
                label="品牌"
                width="120">
        </el-table-column>
        <el-table-column
                prop="supplierid"
                label="供应商id"
                width="120">
        </el-table-column>
        <el-table-column
                label="操作"
                width="100">
            <template slot-scope="scope">
                <el-button @click="handleClick(scope.row)" type="text" size="small">删除</el-button>
                <el-button type="text" @click="edit(scope.row)" size="small">编辑</el-button>
            </template>
        </el-table-column>
    </el-table>
    <el-dialog title="商品信息" :visible.sync="visible" @close="handleCancle">
        <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="商品id">
                <el-input v-model="form.productid" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="商品名称">
                <el-input v-model="form.productname"></el-input>
            </el-form-item>
            <el-form-item label="商品特点">
                <el-input v-model="form.productspecification" disable="true"></el-input>
            </el-form-item>
            <el-form-item label="商品类别">
                <el-input v-model="form.producttype"></el-input>
            </el-form-item>
            <el-form-item label="供应商id">
                <el-input v-model="form.supplierid"></el-input>
            </el-form-item>
            <el-form-item label="品牌">
                <el-input v-model="form.brand"></el-input>
            </el-form-item>
            <el-form-item label="制造商">
                <el-input v-model="form.manufacturer"></el-input>
            </el-form-item>
            <el-form-item label="制造地">
                <el-input v-model="form.origin"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit">立即创建</el-button>
                <el-button>取消</el-button>
            </el-form-item>
        </el-form>
    </el-dialog>
</div>
</body>
<script>
    new Vue({
        el: '#app1',
        data() {
            return {
                tableData: [],
                visible: false,
                name: '',
                form: {
                    brand: '',
                    manufacturer: '',
                    origin: '',
                    productid: 0,
                    productname: '',
                    productspecification: '',
                    producttype: '',
                    supplierid: 0,
                }
            }
        },
        methods:{
            handleCancle () {
                this.$refs.form.resetFields() ;
                this.formd = Object.assign(this.form, this.$options.data().form)
            },
            selectProduct(){
                axios({
                    method: 'post',
                    url: 'http://localhost:8080/selectByPname',
                    params: {
                        name: this.name
                    }
                }).then(res => {
                    this.tableData=res.data.data
                    this.$message({
                        type: 'success',
                        message: '查询成功'
                    })
                })
            },
            edit(data){
                this.form = data
                this.form.mark=1
                this.visible =true
            },
            handleClick(data){
                axios({
                    method: 'post',
                    url: 'http://localhost:8080/deleteProducts',
                    params: {
                        id: data.productid
                    }
                }).then(res => {
                    this.$message({
                        type: 'success',
                        message: '删除成功',
                    })

                    this.getData()

                })
            },
            onSubmit () {
                axios({
                    method: 'post',
                    url: 'http://localhost:8080/addProduct',
                    params: {
                        brand: this.form.brand,
                        manufacturer: this.form.manufacturer,
                        origin: this.form.origin,
                        productid: this.form.productid,
                        productname: this.form.productname,
                        productspecification: this.form.productspecification,
                        producttype: this.form.producttype,
                        supplierid: this.form.supplierid
                    }
                }).then(res => {
                    this.$message({
                        type: 'success',
                        message: '添加成功',
                    })
                    this.getData()
                    this.visible=false

                })

            },
            addProduct () {
                this.visible = true
                console.log(this.form.mark)
            },
            getData(){
                axios({
                    method: 'get',
                    url: 'http://localhost:8080/getProducts'
                }).then(res => {
                    this.tableData = res.data.data
                })
            }
        },
        created() {
            this.getData()
        }
    })
</script>
</html>
