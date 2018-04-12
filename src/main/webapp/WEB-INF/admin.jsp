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
    <title>New Store </title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="New Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'><!--//fonts-->
    <!-- start menu -->
    <link href="/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="/js/memenu.js"></script>
    <script>$(document).ready(function(){$(".memenu").memenu();});</script>
    <script src="/js/simpleCart.min.js"> </script>
</head>
<body>
<div class="col1">
Welcome ${currrentUser.user.name}<br>
<a href="/home">home page</a><br>
Add Slider info:
<span style="color: red">${message}</span>
<spring:form action="/addSliderInfo" modelAttribute="sliderInfo" method="post" >
    <spring:label path="title">Title:</spring:label>
    <spring:input path="title" title="title"/><br>
    <spring:label path="description">Description:</spring:label>
    <spring:input path="description" title="description"/><br>
    <input type="submit" value="Save"/>
</spring:form>

Add Tag:
<spring:form action="/addTag" modelAttribute="tag" method="post">
    <spring:label path="name">Name:</spring:label>
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>

Add color:
<spring:form action="/addColor" modelAttribute="color" method="post">
    <spring:label path="name">Name:</spring:label>
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>

Add brand:
<spring:form action="/addBrand" modelAttribute="brand" method="post">
    <spring:label path="name">Name:</spring:label>
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>

Add secondary category:
<spring:form action="/addSecondaryCategory" modelAttribute="secondaryCategory" method="post">
    <spring:label path="name">Name:</spring:label>
    <spring:input path="name" title="name"/><br>
    <input type="submit" value="Save"/>
</spring:form>
Users:
<br>
<c:forEach items="${users}" var="user">
    <img src="/image?fileName=${user.picUrl}" width="30"/>
    <li>${user.name} ${user.surname}
        <a href="/deleteUser?id=${user.id}">x</a></li>
</c:forEach>

Add product:

<spring:form action="/addProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
    <spring:label path="name">Name:</spring:label>
    <spring:input path="name" title="name"/><br>
    <spring:label path="description">Description:</spring:label>
    <spring:input path="description" title="description"/><br>
    <spring:label path="price">Price:</spring:label>
    <spring:input path="price" title="price"/><br>
    <spring:label path="category">Category:</spring:label>
    <spring:radiobuttons path="category" items="${categorys}" itemLabel="name"/><br>
    <spring:label path="secondaryCategory">SecondaryCategoryes:</spring:label>
    <spring:radiobuttons path="secondaryCategory" items="${secondaryCategorys}" itemLabel="name"/><br>
    <spring:label path="tags">Tags:</spring:label>
    <spring:checkboxes path="tags" items="${tags}" itemLabel="name"/><br>
    <spring:label path="colors">Colors:</spring:label>
    <spring:checkboxes path="colors" items="${colors}" itemLabel="name"/><br>
    <spring:label path="brand">Brands:</spring:label>
    <spring:checkboxes path="brand" items="${brands}" itemLabel="name"/><br>
    <spring:label path="sizes">Size:</spring:label>
    <spring:checkboxes path="sizes" items="${sizes}" itemLabel="sizeVariations" /><br>
    <input type="file" name="picture"><br>
    <input type="submit" value="Save"/>
</spring:form>
add product picture:
<spring:form action="/addPhotosToProduct" modelAttribute="productPicture"  method="post" enctype="multipart/form-data">
    <spring:label path="product">Name:</spring:label>
    <spring:radiobuttons path="product" items="${products}" itemLabel="name"/>
    <input type="file" name="picture"><br>
    <input type="submit" value="Save"/>
</spring:form>

add new Release:
<spring:form action="/addNewRelease" modelAttribute="newRelease"  method="post" enctype="multipart/form-data">
    <spring:label path="name">Name:</spring:label>
    <spring:input path="name" title="name"/><br>
    <spring:label path="secondaryCategory">SecondaryCategoryes:</spring:label>
    <spring:radiobuttons path="secondaryCategory" items="${secondaryCategorys}" itemLabel="name"/><br>
    <input type="file" name="picture"><br>
    <input type="submit" value="Save"/>
</spring:form>
</div>
</body>
</html>
