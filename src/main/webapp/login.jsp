<%--
  Created by IntelliJ IDEA.
  User: 27292
  Date: 2024/7/25
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>库存管理系统</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d9d9d9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>库存管理系统-登录</h2>
    <form id="loginForm" action="/users/login.do" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="登录">
    </form>
    <div class="error-message" id="errorMessage" style="display:none;">
        用户名或密码错误，请重新输入！
    </div>
</div>
<script>
    // Optional: JavaScript to display error message if login fails
    // const form = document.getElementById('loginForm');
    // const errorMessage = document.getElementById('errorMessage');
    //
    // form.addEventListener('submit', function(event) {
    //     // Simulate login failure (replace with actual backend validation)
    //     event.preventDefault();
    //     const username = form.username.value;
    //     const password = form.password.value;
    //
    //     // Example of backend validation (replace with actual backend call)
    //     if (username === 'username' && password === 'password') {
    //         // Successful login
    //         window.location.href = 'inventory_dashboard.php';
    //     } else {
    //         // Failed login
    //         errorMessage.style.display = 'block';
    //     }
    // });
</script>
</body>
</html>

