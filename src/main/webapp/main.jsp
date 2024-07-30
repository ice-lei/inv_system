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
        a{
            text-decoration:none;
            display: block;
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

        <a href="http://localhost:8080/products.jsp" class="accordion">商品管理</a>
        <a href="http://localhost:8080/stockin.jsp" class="accordion">入库管理</a>
        <a  href="http://localhost:8080/stockout.jsp" class="accordion">出库管理</a>


        <a href="http://localhost:8080/inventory.jsp" class="accordion">库存管理</a>

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
