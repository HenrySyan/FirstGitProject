<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: HENO
  Date: 3/25/2018
  Time: 12:30 PM
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
    <script src="/js/main.js"></script>
    <script src="/js/simpleCart.min.js"> </script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="header-top">
        <div class="container">
            <div class="search">
                <form>
                    <input type="text" value="Search " onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
                    <input type="submit" value="Go">
                </form>
            </div>
            <div class="header-left">
                <ul>
                    <li ><a class="lock"  href="/loginpage"  >Login</a></li>
                    <li><a class="lock" href="/checkoutpage"  >Checkout</a></li>
                    <li>
                    </li>

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
                    <li><a class="color1" href="#">Shop</a>
                        <div class="mepanel">
                            <div class="row">
                                <div class="col1">
                                    <div class="h_nav">
                                        <ul>
                                            <ul>
                                                <c:forEach items="${secondCategoryes}" var="secondCategory">
                                                    <li><a href="/productpage?id=${secondCategory.id}">${secondCategory.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col1">
                                    <div class="h_nav">

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


<!--content-->
<!---->
<div class="product">
    <div class="container">
        <div class="col-md-3 product-price">

            <div class=" rsidebar span_1_of_left">
                <div class="of-left">
                    <h3 class="cate">Categories</h3>
                </div>
                <ul class="menu">
                    <li class="item1"><a href="#">Men </a>
                        <ul class="cute">
                            <c:forEach items="${secondCategoryes}" var="secondCategory">
                                <li><a href="/getMensProducts?id=${secondCategory.id}">${secondCategory.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="item2"><a href="#">Women </a>
                        <ul class="cute">
                            <c:forEach items="${secondCategoryes}" var="secondCategory">
                                <li><a href="/getWomansProducts?id=${secondCategory.id}">${secondCategory.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="item3"><a href="#">Kids</a>
                        <ul class="cute">
                            <c:forEach items="${secondCategoryes}" var="secondCategory">
                                <li><a href="/getKidsProducts?id=${secondCategory.id}">${secondCategory.name}</a></li>
                            </c:forEach>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--initiate accordion-->
            <script type="text/javascript">
                $(function() {
                    var menu_ul = $('.menu > li > ul'),
                        menu_a  = $('.menu > li > a');
                    menu_ul.hide();
                    menu_a.click(function(e) {
                        e.preventDefault();
                        if(!$(this).hasClass('active')) {
                            menu_a.removeClass('active');
                            menu_ul.filter(':visible').slideUp('normal');
                            $(this).addClass('active').next().stop(true,true).slideDown('normal');
                        } else {
                            $(this).removeClass('active');
                            $(this).next().stop(true,true).slideUp('normal');
                        }
                    });

                });
            </script>
            <!---->
            <div class="product-middle">

                <div class="fit-top">
                    <h6 class="shop-top">Lorem Ipsum</h6>
                    <a href="single.html" class="shop-now">SHOP NOW</a>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="sellers">
                <div class="of-left-in">
                    <h3 class="tag">Tags</h3>
                </div>
                <div class="tags">
                    <ul>

                        <c:forEach items="${tags}" var="tag">
                            <li><a href="/getProductByTag?tag=${tag.id}">${tag.name}</a></li>
                        </c:forEach>

                        <div class="clearfix"> </div>
                    </ul>

                </div>

            </div>
            <!---->
            <div class="product-bottom">
                <div class="of-left-in">
                    <h3 class="best">Best Sellers</h3>
                </div>
                <div class="product-go">
                    <div class=" fashion-grid">
                        <a href="single.html"><img class="img-responsive " src="images/p1.jpg" alt=""></a>

                    </div>
                    <div class=" fashion-grid1">
                        <h6 class="best2"><a href="single.html" >Lorem ipsum dolor sit
                            amet consectetuer  </a></h6>

                        <span class=" price-in1"> $40.00</span>
                    </div>

                    <div class="clearfix"> </div>
                </div>
                <div class="product-go">
                    <div class=" fashion-grid">
                        <a href="single.html"><img class="img-responsive " src="images/p2.jpg" alt=""></a>

                    </div>
                    <div class="fashion-grid1">
                        <h6 class="best2"><a href="single.html" >Lorem ipsum dolor sit
                            amet consectetuer </a></h6>

                        <span class=" price-in1"> $40.00</span>
                    </div>

                    <div class="clearfix"> </div>
                </div>

            </div>
            <div class=" per1">
                <a href="single.html" ><img class="img-responsive" src="images/pro.jpg" alt="">
                    <div class="six1">
                        <h4>DISCOUNT</h4>
                        <p>Up to</p>
                        <span>60%</span>
                    </div></a>
            </div>

        </div>
        <div class="col-md-9 product-price1">
            <div class="col-md-5 single-top">
                <div class="flexslider">
                    <ul class="slides">
                        <c:forEach items="${productPictures}" var="picture">
                        <li data-thumb="/image?fileName=${picture.picUrl}">
                            <img src="/image?fileName=${picture.picUrl}" />
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- FlexSlider -->
                <script defer src="/js/jquery.flexslider.js"></script>
                <link rel="stylesheet" href="/css/flexslider.css" type="text/css" media="screen" />

                <script>
                    // Can also be used with $(document).ready()
                    $(window).load(function() {
                        $('.flexslider').flexslider({
                            animation: "slide",
                            controlNav: "thumbnails"
                        });
                    });
                </script>
            </div>
            <div class="col-md-7 single-top-in simpleCart_shelfItem">
                <div class="single-para ">
                    <h4>${product.name}</h4>
                    <div class="star-on">
                        <ul class="star-footer">
                            <li><a href="#"><i> </i></a></li>
                            <li><a href="#"><i> </i></a></li>
                            <li><a href="#"><i> </i></a></li>
                            <li><a href="#"><i> </i></a></li>
                            <li><a href="#"><i> </i></a></li>
                        </ul>
                        <div class="review">
                            <a href="#"> </a>

                        </div>
                        <div class="clearfix"> </div>
                    </div>

                    <h5 class="item_price">$ ${product.price}</h5>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed
                        diam nonummy nibh euismod tincidunt ut laoreet dolore
                        magna aliquam erat </p>
                    <div class="available">
                        <ul>
                            <li>Color
                                <select>
                                    <c:forEach items="${product.colors}" var="color">
                                    <option>${color.name}</option>
                                    </c:forEach>
                                </select></li>
                            <li class="size-in">Size<select>
                                <c:forEach items="${product.sizes}" var="size">
                                <option>${size.sizeVariations}</option>
                                </c:forEach>
                            </select></li>
                            <div class="clearfix"> </div>
                        </ul>
                    </div>
                    <ul class="tag-men">
                        <li><span>TAG</span>
                            <span class="women1">
                                <c:forEach items="${product.tags}" var="tag">
                                    ${tag.name}
                                </c:forEach>
                            </span></li>
                    </ul>
                    <%--<a href="/addToCart?product=${product.id}" class="add-cart item_add" >ADD TO CART</a>--%>
                    <spring:form action="/addToCart?products=${product.id}" modelAttribute="bagIttem" method="post" class="add-cart item_add" >
                        <input type="submit" value="ADD TO CART"/>
                    </spring:form>
                </div>
            </div>
            <div class="clearfix"> </div>
            <!---->
            <div class="cd-tabs">
                <nav>
                    <ul class="cd-tabs-navigation">
                        <li><a data-content="fashion"  href="#0">Description </a></li>
                        <li><a data-content="cinema" href="#0" >Addtional Informatioan</a></li>
                        <li><a data-content="television" href="#0" class="selected ">Reviews </a></li>

                    </ul>
                </nav>
                <ul class="cd-tabs-content">
                    <li data-content="fashion" >
                        <div class="facts">
                            <p > ${product.description} </p>
                            <ul>
                                <li>Research</li>
                                <li>Design and Development</li>
                                <li>Porting and Optimization</li>
                                <li>System integration</li>
                                <li>Verification, Validation and Testing</li>
                                <li>Maintenance and Support</li>
                            </ul>
                        </div>

                    </li>
                    <li data-content="cinema" >
                        <div class="facts1">

                            <div class="color"><p>Color</p>
                                <span >  <c:forEach items="${product.colors}" var="color">
                                    ${color.name}
                                </c:forEach></span>
                                <div class="clearfix"></div>
                            </div>
                            <div class="color">
                                <p>Size</p>
                                <span >  <c:forEach items="${product.sizes}" var="size">
                                    ${size.sizeVariations}
                                </c:forEach></span>
                                <div class="clearfix"></div>
                            </div>

                        </div>

                    </li>
                    <c:forEach items="${productComments}"  var="pc">
                    <li data-content="television" class="selected">
                        <div class="comments-top-top">
                            <div class="top-comment-left">
                                <img class="img-responsive" src="/image?fileName=${pc.user.picUrl}" alt="">
                            </div>
                            <div class="top-comment-right">
                                <h6><a href="#">${pc.user.name}</a> ${pc.date}</h6>
                                <p>${pc.description}</p>
                            </div>
                            <div class="clearfix"> </div>
                            </c:forEach>
                        </div>
                        <spring:form action="/addComment?product=${product.id}" modelAttribute="productComment" method="post">
                            <a class="add-re" >ADD REVIEW</a>
                            <spring:input path="description" title="Description"/>
                            <input type="submit" value="Save"/>
                        </spring:form>
                    </li>


                    <div class="clearfix"></div>
                </ul>
            </div>
            <div class=" bottom-product">
                <div class="col-md-4 bottom-cd simpleCart_shelfItem">
                    <div class="product-at ">
                        <a href="#"><img class="img-responsive" src="images/pi3.jpg" alt="">
                            <div class="pro-grid">
                                <span class="buy-in">Buy Now</span>
                            </div>
                        </a>
                    </div>
                    <p class="tun">It is a long established fact that a reader</p>
                    <a href="#" class="item_add"><p class="number item_price"><i> </i>$500.00</p></a>
                </div>
                <div class="col-md-4 bottom-cd simpleCart_shelfItem">
                    <div class="product-at ">
                        <a href="#"><img class="img-responsive" src="images/pi1.jpg" alt="">
                            <div class="pro-grid">
                                <span class="buy-in">Buy Now</span>
                            </div>
                        </a>
                    </div>
                    <p class="tun">It is a long established fact that a reader</p>
                    <a href="#" class="item_add"><p class="number item_price"><i> </i>$500.00</p></a>					</div>
                <div class="col-md-4 bottom-cd simpleCart_shelfItem">
                    <div class="product-at ">
                        <a href="#"><img class="img-responsive" src="images/pi4.jpg" alt="">
                            <div class="pro-grid">
                                <span class="buy-in">Buy Now</span>
                            </div>
                        </a>
                    </div>
                    <p class="tun">It is a long established fact that a reader</p>
                    <a href="#" class="item_add"><p class="number item_price"><i> </i>$500.00</p></a>					</div>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="clearfix"> </div>
    </div>
</div>
<!--//content-->
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
