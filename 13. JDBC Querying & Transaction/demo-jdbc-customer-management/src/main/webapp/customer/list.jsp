<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách khách hàng</h1>
<a href="/customers?action=create">Tạo khách hàng mới</a>
<table>
    <tr>
        <td>Name</td>
        <td>Address</td>
        <td>Edit</td>
    </tr>
    <c:forEach var="customer" items="${requestScope['customers']}">
        <tr>
            <td>
                <c:out value="${customer.name}"/>
            </td>
            <td>
                <c:out value="${customer.address}"/>
            </td>
            <td>
                <a href="/customers?action=edit&id=${customer.id}">Edit</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
