<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
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
<a href="/home">home page</a><br>
Add User:
<span style="color: red">${message}</span>
<spring:form action="/addAuthor" modelAttribute="author" method="post" enctype="multipart/form-data">
    <spring:input path="name" title="name"/><br>
    <spring:input path="surname" title="surname"/><br>
    <spring:input path="email" title="email"/><br>
    <spring:password path="password" title="password"/><br>
    <input type="file" name="picture">
    <input type="submit" value="Save"/>
</spring:form>

</body>
</html>
