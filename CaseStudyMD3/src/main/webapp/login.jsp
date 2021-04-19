<%--
  Created by IntelliJ IDEA.
  User: Le Minh Duc
  Date: 09/04/2021
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap Simple Login Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        .login-form {
            width: 340px;
            margin: 50px auto;
            font-size: 15px;
        }
        .login-form form {
            margin-bottom: 15px;
            background: #f7f7f7;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
            padding: 30px;
        }
        .login-form h2 {
            margin: 0 0 15px;
        }
        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        .btn {
            font-size: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
    String message = "";
    try {
        message = request.getAttribute("message").toString();
        if(message.equals("loginFail")){
            ;%>
                <script type="text/javascript">
                    alert("Sai toàn khoản hoặc mật khẩu!");
                </script>
            <%;
        }
    }catch (Exception e){
        message = null;
    };

%>
<div class="login-form">
    <form action="/LoginServlet" method="post">
        <h2 class="text-center">Đăng nhập</h2>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Email" required="required" name="email">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Mật khẩu" required="required" name="passWord">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">đăng nhập</button>
        </div>
    </form>
    <p class="text-center"><a href="registerAcount.jsp">Đăng kí tài khoản</a></p>
</div>
</body>
</html>