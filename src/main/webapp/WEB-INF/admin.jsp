<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: HENO
  Date: 2/15/2018
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Welcome ${currrentUser.user.name}<br>
<a href="/home">home page</a><br>
Add User:
<span style="color: red">${message}</span>
<spring:form action="/addUser" modelAttribute="user" method="post" enctype="multipart/form-data">
    <spring:input path="name" title="name"/><br>
    <spring:input path="surname" title="surname"/><br>
    <spring:input path="email" title="email"/><br>
    <spring:password path="password" title="password"/><br>
    <input type="file" name="picture">
    <input type="submit" value="Save"/>
</spring:form>

Add Tag:
<spring:form action="/addTag" modelAttribute="tag" method="post">
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>

Add color:
<spring:form action="/addColor" modelAttribute="color" method="post">
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>

Add category:
<spring:form action="/addCategory" modelAttribute="category" method="post">
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>
Users:
<br>
<c:forEach items="${users}" var="user">
    <img src="/image?fileName=${user.picUrl}" width="30"/>
    <li>${user.name} ${user.surname} <a href="/deleteUser?id=${user.id}">x</a></li>
</c:forEach>

Add product:

<spring:form action="/addProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
    name:<spring:input path="name" title="name"/><br>
    description:<spring:input path="description" title="description"/><br>
    price:<spring:input path="price" title="price"/><br>
    <spring:radiobuttons path="category" items="${categorys}"/><br>
    <spring:checkboxes path="tags" items="${tags}"/><br>
    <spring:checkboxes path="colors" items="${colors}"/><br>
    <spring:checkboxes path="sizes" items="${sizes}"/><br>
    <input type="hidden" value="${currrentUser}">
    <input type="file" name="picture"><br>
    <input type="submit" value="Save"/>
</spring:form>

</body>
</html>
