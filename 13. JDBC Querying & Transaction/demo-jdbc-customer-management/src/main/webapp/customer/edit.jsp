<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Cập nhật thông tin khách hàng</h1>
<c:if test="${message != null}">
    <p>
            ${message}
    </p>
</c:if>
<form method="post">
    <table>
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
            <td><input type="submit" value="Cập nhật"/></td>
        </tr>
    </table>
</form>
</body>
</html>
