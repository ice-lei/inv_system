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
    <h1>入库管理</h1><hr>
    <el-input style="width: 200px" v-model="selectId"></el-input><el-button @click="selectProduct" type="primary">根据入库id查询</el-button>
    <el-button @click="addProduct" type="primary">添加入库信息</el-button>
    <el-table
            border
            :data="tableData"
            style="width: 75%;"
            height="100%">
        <el-table-column
                fixed
                prop="stockInid"
                label="入库id"
                width="150">
        </el-table-column>
        <el-table-column
                prop="productid"
                label="商品id"
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
                prop="stockIntime"
                label="入库时间"
                width="120">
        </el-table-column>
        <el-table-column
                prop="remarks"
                label="标识"
                width="120">
        </el-table-column>
        <el-table-column
                fixed="right"
                label="操作"
                width="100">
            <template slot-scope="scope">
                <el-button type="text" @click="edit(scope.row)" size="small">编辑</el-button>
            </template>
        </el-table-column>
    </el-table>

    <el-dialog title="入库信息" :visible.sync="visible" @close="handleCancle">
        <el-form ref="form" :model="form" label-width="80px">
            <el-form-item label="入库id">
                <el-input v-model="form.stockInid" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item label="商品id">
                <el-input v-model="form.productid"></el-input>
            </el-form-item>
            <el-form-item label="入库时间">
                <el-col :span="11">
                    <el-date-picker type="date" placeholder="选择日期" v-model="form.stockIntime" style="width: 100%;"></el-date-picker>
                </el-col>
            </el-form-item>
            <el-form-item label="备注">
                <el-input v-model="form.notes" disable="true"></el-input>
            </el-form-item>
            <el-form-item label="商品数量">
                <el-input v-model="form.quantity"></el-input>
            </el-form-item>
            <el-form-item label="供应商">
                <el-input v-model="form.purchaser"></el-input>
            </el-form-item>
            <el-form-item label="进货人">
                <el-input v-model="form.supplier"></el-input>
            </el-form-item>
            <el-form-item label="标注">
                <el-input v-model="form.remarks"></el-input>
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
                selectId: 0,
                tableData: [],
                visible: false,
                selectid: 0,
                form: {
                    stockInid: 0,
                    productid: 0,
                    quantity: 0,
                    notes: '',
                    purchaser: '',
                    stockIntime: '',
                    remarks: '',
                    supplier: ''
                },
                form1: this.form
            }
        },
        methods:{
            handleCancle () {
                this.$refs.form.resetFields() ;
                this.formd = Object.assign(this.form, this.$options.data().form)
            },
            selectProduct() {
                axios({
                    method: 'get',
                    url: 'http://localhost:8080/getInmsg',
                    params: {
                        id: this.selectId
                    }
                }).then(res => {
                    if (res.data.status === 200){
                        this.tableData = res.data.data
                        this.$message({
                            type: 'success',
                            message: '查询成功',
                        })
                    }else{
                        alert("获取失败")
                    }
                })
            },
            edit(data){
                this.form = data
                this.visible =true
            },
            onSubmit () {
                axios({
                    method: 'post',
                    url: 'http://localhost:8080/addStockIn',
                    params: {
                        stockInid: this.form.stockInid,
                        productid: this.form.productid,
                        notes: this.form.notes,
                        purchaser: this.form.purchaser,
                        quantity: this.form.quantity,
                        remarks: this.form.remarks,
                        stockIntime: this.form.stockIntime,
                        supplier: this.form.supplier
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
                this.$refs['form'].resetFields();
            },
            getData(){
                axios({
                    method: 'get',
                    url: 'http://localhost:8080/getIn'
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
