<%--
  Created by IntelliJ IDEA.
  User: 27292
  Date: 2024/7/26
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>库存管理系统</title>
    <style>
        .header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 8px;
        }
        .container{
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .left-nav{
            width: 20%;
            background-color: #d9d9d9;
            text-align: center;
        }
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: center;
            outline: none;
            font-size: 20px;
            transition: 0.4s;
        }

        .active, .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 30px;
            background-color: white;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
        }

        .panel a {
            text-decoration: none;
            color: #2196F3;
            display: block;
            padding: 10px;
            border-bottom: 1px solid #e5e5e5;
            width: 100%;
        }
        .panel a:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>库存管理系统</h1>
</div>
<div class="container">
    <div class="left-nav">
        <button class="accordion">用户管理</button>
        <div class="panel">
            <a href="/users/login.do">普通用户登录</a>
            <a href="/users/modify.do">用户修改信息</a>
            <a href="/users/query.do">用户查询信息</a>
        </div>

        <button class="accordion">供应商管理</button>
        <div class="panel">
            <a href="/supplier/add.do">添加供应商</a>
            <a href="/supplier/delete.do">删除供应商</a>
            <a href="/supplier/query.do">查询供应商</a>
        </div>

        <button class="accordion">商品管理</button>
        <div class="panel">
            <a href="/products/register.do">登记商品</a>
            <a href="/products/delete.do">删除商品</a>
            <a href="/products/query.do">查询商品</a>
            <a href="/products/type/add.do">添加商品类型</a>
            <a href="/products/type/delete.do">删除商品类型</a>
        </div>

        <button class="accordion">入库管理</button>
        <div class="panel">
            <a href="/stockin/register.do">登记入库商品</a>
            <a href="/stockin/modify.do">修改入库信息</a>
            <a href="/stockin/query.do">查询入库信息</a>
        </div>

        <button class="accordion">出库管理</button>
        <div class="panel">
            <a href="/stockout/register.do">登记出库商品</a>
            <a href="/stockout/cancel.do">取消商品出库</a>
            <a href="/stockout/modify.do">修改商品出库信息</a>
            <a href="/stockout/query.do">查询出库信息</a>
        </div>

        <button class="accordion">库存管理</button>
        <div class="panel">
            <a href="/inventory/statistics.do">统计库存</a>
            <a href="/inventory/query.do">查询库存</a>
        </div>
        <button class="accordion">系统管理</button>
        <div class="panel">
            <a href="/admins/add.do">添加普通用户</a>
            <a href="/admins/delete.do">删除普通用户</a>
            <a href="/admins/query.do">查询普通用户</a>
            <a href="/admins/modify_power.do">修改普通用户权限</a>
            <a href="/admins/login_log.do">查询管理员登录日志</a>
        </div>
    </div>
    <div class="right">
        <img src="/img/main.jpg" width="1200" height="600" />
    </div>
</div>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight){
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";
            }
        });
    }
</script>

</body>
</html>
