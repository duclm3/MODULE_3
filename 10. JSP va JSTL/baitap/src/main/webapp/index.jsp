<%@ page import="com.entity.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%
    List<Customer> customers = new ArrayList<>();
    customers.add(new Customer("Quan", "20/06/99","HN",""));
    customers.add(new Customer("Quan", "20/06/99","HN",""));
    customers.add(new Customer("Quan", "20/06/99","HN",""));
    customers.add(new Customer("Quan", "20/06/99","HN",""));
    customers.add(new Customer("Quan", "20/06/99","HN",""));
    customers.add(new Customer("Quan", "20/06/99","HN",""));

    pageContext.setAttribute("listCustomer",customers);
%>
<h1>Danh sách khách hàng</h1>
<table>
    <tr>
        <td>Họ tên</td>
        <td>Ngày sinh</td>
        <td>Địa chỉ</td>
        <td>Ảnh</td>
    </tr>
    <c:forEach var="student" items="#{listCustomer}">
        <tr>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.address}"/></td>
            <td><c:out value="${student.birthday}"/></td>
            <td><c:out value="${student.images}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>