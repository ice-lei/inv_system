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
        <h1>出库管理</h1><hr>
        <el-button @click="addProduct" type="primary">添加商品</el-button>
        <el-input style="width: 200px" v-model="selectId"></el-input><el-button @click="selectProduct" type="primary">出库id查询</el-button>
        <el-table
                border
                :data="tableData"
                style="width: 75%;"
                height="100%">
            <el-table-column
                    fixed
                    prop="stockoutid"
                    label="出货id"
                    width="150">
            </el-table-column>
            <el-table-column
                    prop="productid"
                    label="商品id"
                    width="120">
            </el-table-column>
            <el-table-column
                    prop="outgoingperson"
                    label="出货人"
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
                    prop="stockouttime"
                    label="出货时间"
                    width="120">
            </el-table-column>
            <el-table-column
                    fixed="right"
                    label="操作"
                    width="100">
                <template slot-scope="scope">
                    <el-button @click="handleClick(scope.row)" type="text" size="small">删除</el-button>
                    <el-button type="text" @click="edit(scope.row)" size="small">编辑</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-dialog title="出库信息" :visible.sync="visible" @close="handleCancle">
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="出库id">
                    <el-input v-model="form.stockoutid" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item label="商品id">
                    <el-input v-model="form.productid"></el-input>
                </el-form-item>
                <el-form-item label="出货时间">
                    <el-col :span="11">
                        <el-date-picker type="date" placeholder="选择日期" v-model="form.stockouttime" style="width: 100%;"></el-date-picker>
                    </el-col>
                </el-form-item>
                <el-form-item label="备注">
                     <el-input v-model="form.notes" disable="true"></el-input>
                </el-form-item>
                <el-form-item label="商品数量">
                    <el-input v-model="form.quantity"></el-input>
                </el-form-item>
                <el-form-item label="出货人">
                    <el-input v-model="form.outgoingperson"></el-input>
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
                selectId: 0,
                form: {
                    stockoutid: 0,
                    productid: 0,
                    quantity: 0,
                    outgoingperson: '',
                    notes: '',
                    stockouttime: ''
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
                    url: 'http://localhost:8080/findId',
                    params: {
                        id: this.selectId
                    }
                }).then(res => {
                    this.tableData=res.data.data
                    console.log(this.tableData)
                })
            },
            edit(data){
                this.form = data
                this.visible =true
                // axios({
                //     method: 'post',
                //     url: 'http://localhost:8080/addStockOut',
                //     params: {
                //         stockoutid: this.form.stockoutid,
                //         productid: this.form.productid,
                //         notes: this.form.notes,
                //         quantity: this.form.quantity,
                //         stockouttime: this.form.stockouttime
                //     }
                // }).then(res => {
                //     this.$message({
                //         type: 'success',
                //         message: '添加成功',
                //     })
                //     this.getData()
                // })
            },
            handleClick(data){
                axios({
                    method: 'post',
                    url: 'http://localhost:8080/deleteStock',
                    params: {
                        id: data.stockoutid
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
                    url: 'http://localhost:8080/addStockOut',
                    params: {
                        stockoutid: this.form.stockoutid,
                        productid: this.form.productid,
                        notes: this.form.notes,
                        outgoingperson: this.form.outgoingperson,
                        quantity: this.form.quantity,
                        stockouttime: this.form.stockouttime
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
            },
            getData(){
                axios({
                    method: 'get',
                    url: 'http://localhost:8080/getOut'
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
