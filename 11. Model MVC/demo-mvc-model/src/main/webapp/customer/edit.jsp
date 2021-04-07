<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/7/2021
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Tạo khách hàng mới</h1>
<form action="/customers?action=edit&id=${customer.id}" method="post">
    <table>
        <tr>
            <td>Id</td>
            <td><input type="text" name="id" value="${customer.id}"></td>
        </tr>
        <tr>
            <td>Họ tên</td>
            <td><input type="text" name="name" value="${customer.name}"></td>
        </tr>
        <tr>
            <td>Địa chỉ</td>
            <td><input type="text" name="address" value="${customer.address}"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Tạo mới"></td>
        </tr>
    </table>
</form>
</body>
</html>
