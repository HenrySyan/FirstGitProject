<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: HENO
  Date: 2/15/2018
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/adminpage">admin page</a>

<ul>
    <c:forEach items="${books}" var="book">
        <img src="/image?fileName=${book.picUrl}" width="30"/>
        <li>${book.name} ${book.description} </li>
        <li>${book.author.name}</li>
    </c:forEach>
</ul>
</body>
</html>
