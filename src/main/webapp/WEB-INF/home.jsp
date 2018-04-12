<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>

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

<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="search">
                <form>
                    <spring:form action="/searchProduct"  method="post">
                        <input type="text" value="Search " onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                        <input type="submit" value="Go"/>
                    </spring:form>

                </form>
            </div>
            <div class="header-left">
                <ul>
                    <li ><a href="/loginpage"  >Login</a></li>
                    <li><a  href="/registerpage"  >Register</a></li>

                </ul>
                <div class="cart box_1">
                    <a href="/checkoutpage">
                        <h3> <div class="total">
                            <span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>
                            <img src="images/cart.png" alt=""/></h3>
                    </a>
                    <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>

                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="container">
        <div class="head-top">
            <div class="logo">
                <a href="/home"><img src="images/logo.png" alt=""></a>
            </div>
            <div class=" h_menu4">
                <ul class="memenu skyblue">
                    <li class="active grid"><a class="color8" href="/home">Home</a></li>
                    <li><a class="color1" href="/getMainManProducts">Men</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                                <c:forEach items="${secondCategoryes}" var="secondCategory">
                                                    <li><a href="/getMensProducts?id=${secondCategory.id}">${secondCategory.name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Popular Brands</h4>
                                        <ul>
                                            <c:forEach items="${brands}" var="brand">
                                                <li><a href="/getProductsByBrand?brandId=${brand.id}">${brand.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="grid"><a class="color2" href="/getMainWomanProducts">	Women</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <c:forEach items="${secondCategoryes}" var="secondCategory">
                                                <li><a href="/getWomansProducts?id=${secondCategory.id}">${secondCategory.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Popular Brands</h4>
                                        <ul>
                                            <c:forEach items="${brands}" var="brand">
                                                <li><a href="/getProductsByBrand?brandId=${brand.id}">${brand.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="grid"><a class="color2" href="/getMainKidsProducts">	Kids</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <c:forEach items="${secondCategoryes}" var="secondCategory">
                                                <li><a href="/getKidsProducts?id=${secondCategory.id}">${secondCategory.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>

                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">
                                        <h4>Popular Brands</h4>
                                        <ul>
                                            <c:forEach items="${brands}" var="brand">
                                                <li><a href="/getProductsByBrand?brandId=${brand.id}">${brand.name}</a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a class="color6" href="/userpage">UserPage</a></li>
                </ul>
            </div>

            <div class="clearfix"> </div>
        </div>
    </div>

</div>

<div class="banner">
    <div class="container">
        <script src="js/responsiveslides.min.js"></script>
        <script>
            $(function () {
                $("#slider").responsiveSlides({
                    auto: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    pager: true,
                });
            });
        </script>
        <div  id="top" class="callbacks_container">
            <ul class="rslides" id="slider">
               <c:forEach items="${sliderInfo}" var="slider">
                <li>
                    <div class="banner-text">
                        <h3>${slider.title} </h3>
                        <p>${slider.description}</p>
                        <a href="single.html">Learn More</a>
                    </div>
                </li>
               </c:forEach>
            </ul>
        </div>

    </div>
</div>

<!--content-->
<div class="content">
    <div class="container">
        <div class="content-top">
            <h1>NEW RELEASED</h1>


             <div class="grid-in">
                <c:forEach items="${newReleases}" var="release">
                <div class="col-md-4 grid-top">

                    <a href="/productpage?id=${release.secondaryCategory.id}" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="/image?fileName=${release.picUrl}" alt="">
                        <div class="b-wrapper">
                            <h3 class="b-animate b-from-left    b-delay03 ">
                                <span>${release.secondaryCategory.name}</span>
                            </h3>
                        </div>
                    </a>
                    <p><a href="/productpage?id=${release.secondaryCategory.id}">${release.name}</a></p>

                </div>

                 </c:forEach>
                <div class="clearfix"> </div>

            </div>

        </div>

        <!----->

        <div class="content-top-bottom">
            <h2>Featured Collections</h2>
            <div class="col-md-6 men">
                <a href="single.html" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t1.jpg" alt="">
                    <div class="b-wrapper">
                        <h3 class="b-animate b-from-top top-in   b-delay03 ">
                            <span>Lorem</span>
                        </h3>
                    </div>
                </a>


            </div>
            <div class="col-md-6">
                <div class="col-md1 ">
                    <a href="single.html" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t2.jpg" alt="">
                        <div class="b-wrapper">
                            <h3 class="b-animate b-from-top top-in1   b-delay03 ">
                                <span>Lorem</span>
                            </h3>
                        </div>
                    </a>

                </div>
                <div class="col-md2">
                    <div class="col-md-6 men1">
                        <a href="single.html" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t3.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                    <span>Lorem</span>
                                </h3>
                            </div>
                        </a>

                    </div>
                    <div class="col-md-6 men2">
                        <a href="single.html" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/t4.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-top top-in2   b-delay03 ">
                                    <span>Lorem</span>
                                </h3>
                            </div>
                        </a>

                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <!---->
    <div class="content-bottom">
        <ul>
            <li><a href="#"><img class="img-responsive" src="images/lo.png" alt=""></a></li>
            <li><a href="#"><img class="img-responsive" src="images/lo1.png" alt=""></a></li>
            <li><a href="#"><img class="img-responsive" src="images/lo2.png" alt=""></a></li>
            <li><a href="#"><img class="img-responsive" src="images/lo3.png" alt=""></a></li>
            <li><a href="#"><img class="img-responsive" src="images/lo4.png" alt=""></a></li>
            <li><a href="#"><img class="img-responsive" src="images/lo5.png" alt=""></a></li>
            <div class="clearfix"> </div>
        </ul>
    </div>
</div>
<div class="footer">
    <div class="container">
        <div class="footer-top-at">

            <div class="col-md-4 amet-sed">
                <h4>MORE INFO</h4>
                <ul class="nav-bottom">
                    <li><a href="#">How to order</a></li>
                    <li><a href="#">FAQ</a></li>
                    <li><a href="contact.html">Location</a></li>
                    <li><a href="#">Shipping</a></li>
                    <li><a href="#">Membership</a></li>
                </ul>
            </div>
            <div class="col-md-4 amet-sed ">
                <h4>CONTACT US</h4>

                <p>
                    Contrary to popular belief</p>
                <p>The standard chunk</p>
                <p>office:  +12 34 995 0792</p>
                <ul class="social">
                    <li><a href="#"><i> </i></a></li>
                    <li><a href="#"><i class="twitter"> </i></a></li>
                    <li><a href="#"><i class="rss"> </i></a></li>
                    <li><a href="#"><i class="gmail"> </i></a></li>

                </ul>
            </div>
            <div class="col-md-4 amet-sed">
                <h4>Newsletter</h4>
                <p>Sign Up to get all news update
                    and promo</p>
                <form>
                    <input type="text" value="" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}">
                    <input type="submit" value="Sign up">
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <div class="footer-class">
        <p >© 2015 New store All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
    </div>
</div>

</body>
</html>
