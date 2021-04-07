<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <td>Id</td>
        <td>Họ tên</td>
        <td>Địa chỉ</td>
    </tr>
    <c:forEach var="customer" items="${requestScope['listCustomer']}">
        <tr>
            <td><c:out value="${customer.id}"/></td>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.address}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
