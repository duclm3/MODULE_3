<%--
  Created by IntelliJ IDEA.
  User: Le Minh Duc
  Date: 05/04/2021
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <style type="text/css">
      .login {
        height:180px; width:230px;
        margin:0;
        padding:10px;
        border:1px #CCC solid;
      }
      .login input {
        padding:5px; margin:5px
      }
    </style>
  </head>
  <body>
  <form method="post" action="/LoginServlet">
    <div class="login">
      <h2>Login</h2>
      <input type="text" name="username" size="30"  placeholder="username" />
      <input type="password" name="password" size="30" placeholder="password" />
      <input type="submit" value="Sign in"/>
    </div>
  </form>

  <form method="post" action="/convert" >
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
  </form>
  </body>
</html>
