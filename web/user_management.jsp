<%@ page import="com.imu.bean.Teacher" %>
<%@ page import="com.imu.bean.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Fsly
  Date: 2020/5/31
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wedding Store A Ecommerce Category Flat Bootstarp Resposive Website Template | Products :: w3layouts</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Wedding Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- start menu -->
    <script src="js/simpleCart.min.js"> </script>
    <!-- start menu -->
    <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="js/memenu.js"></script>
    <script>$(document).ready(function(){$(".memenu").memenu();});</script>
    <!-- /start menu -->
    <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />

</head>
<body>
<!--header-->
<div class="top_bg">
    <div class="container">
        <div class="header_top-sec">
            <div class="top_right">
                <ul>
                    <li><a href="#">内蒙古大学</a></li>|
                    <li><a href="#">计算机学院</a></li>|
                    <li><a href="#"><%
                        Object isLogin= session.getAttribute("isLogin");
                        Object isAdmin= session.getAttribute("isAdmin");
                        Object userAdmin = session.getAttribute("userAdmin");
                        Object userTeacher = session.getAttribute("userTeacher");
                        if(isLogin!=null&& (boolean) isLogin) {
                            if (isAdmin!=null&&(boolean)isAdmin) {
                                out.print("管理员");
                            } else {
                                out.print(((Teacher)userTeacher).getSpeciality());
                            }
                        }
                    %></a></li>
                </ul>
            </div>
            <div class="top_left">
                <ul>
                    <li class="top_link">Phone:<a href="mailto:info@example.com"><%
                        if(isLogin!=null&& (boolean) isLogin) {
                            if (isAdmin!=null&&(boolean)isAdmin) {
                                out.print(((Admin)userAdmin).getTelephone());
                            } else {
                                out.print(((Teacher)userTeacher).getTelephone());
                            }
                        }
                    %></a></li>|
                    <li class="top_link"><a href="login.jsp"><%
                        if(isLogin!=null&& (boolean) isLogin) {
                            if (isAdmin!=null&&(boolean)isAdmin) {
                                out.print(((Admin)userAdmin).getName());
                            } else {
                                out.print(((Teacher)userTeacher).getTname());
                            }
                        }else{
                            out.print("登录");
                        }
                    %></a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="header-top">
    <div class="header-bottom">
        <div class="container">
            <div class="logo">
                <a href="index.jsp"><h1>试卷生成系统</h1></a>
            </div>
            <!---->

            <div class="top-nav">
                <ul class="memenu skyblue"><li class="active"><a href="index.jsp">主页</a></li>
                    <li class="grid"><a href="paper_generation.jsp">试卷生成</a></li>
                    <li class="grid"><a href="question_management.jsp">管理题库</a></li>
                    <li class="grid"><a href="user_management.jsp">管理用户</a></li>
                    <li class="grid"><a href="#">退出登录</a></li>
                </ul>
                <div class="clearfix"> </div>
            </div>
            <!---->
            <div class="cart box_1">
                <div class="clearfix"> </div>
            </div>
            <div class="clearfix"> </div>
            <!---->
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!---->
<!--header//-->
<div class="product-model">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="index.jsp">Home</a></li>
            <li class="active">User Management</li>
        </ol>
        <h2>用户管理</h2>
        <p align="center"><span style="color: #dc143c; "><%
            if(isLogin!=null&& (boolean) isLogin) {
                if (isAdmin!=null&&(boolean)isAdmin) {
                } else {
                    out.print("若想管理用户，请联系管理员");
                }
            }else{
                out.print("若想查看用户，请先登录");
            }
        %></span></p>
        <div class="col-md-9 product-model-sec">
            <a href="single.html">
                <div class="product-grid love-grid">
                    <div class="more-product"></div>
                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <img src="images/userPhoto.png" class="img-responsive" alt=""/>
                        <div class="b-wrapper">
                            <h4 class="b-animate b-from-left  b-delay03">
                                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
                            </h4>
                        </div>
                    </div></a>
            <div class="product-info simpleCart_shelfItem">
                <div class="product-info-cust prt_name">
                    <h4>王老师</h4>
                    <p>15866668888</p>
                    <span class="item_price">计算机学院 | 软件工程</span>					<input type="button" class="item_add items" value="修改">
                    <input type="button" class="item_add items" value="删除">
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <a href="single.html">
            <div class="product-grid love-grid">
                <div class="more-product"></div>
                <div class="product-img b-link-stripe b-animate-go  thickbox">
                    <img src="images/userPhoto.png" class="img-responsive" alt=""/>
                    <div class="b-wrapper">
                        <h4 class="b-animate b-from-left  b-delay03">
                            <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
                        </h4>
                    </div>
                </div>
        </a>
        <div class="product-info simpleCart_shelfItem">
            <div class="product-info-cust prt_name">
                <h4>李老师</h4>
                <p>18888886666</p>
                <span class="item_price">计算机学院 | 软件工程</span>
                <input type="button" class="item_add items" value="修改">
                <input type="button" class="item_add items" value="删除">
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <a href="single.html">
        <div class="product-grid love-grid">
            <div class="more-product"></div>
            <div class="product-img b-link-stripe b-animate-go  thickbox">
                <img src="images/userPhoto.png" class="img-responsive" alt=""/>
                <div class="b-wrapper">
                    <h4 class="b-animate b-from-left  b-delay03">
                        <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
                    </h4>
                </div>
            </div>
    </a>
    <div class="product-info simpleCart_shelfItem">
        <div class="product-info-cust prt_name">
            <h4>管理员</h4>
            <p>18844446666</p>
            <span class="item_price">计算机学院 | 软件工程</span>
            <input type="button" class="item_add items" value="修改">
            <input type="button" class="item_add items" value="删除">
        </div>
        <div class="clearfix"> </div>
    </div>
</div>




<a href="single.html"><div class="product-grid love-grid">
    <div class="more-product"></div>
    <div class="product-img b-link-stripe b-animate-go  thickbox">
        <img src="images/p7.jpg" class="img-responsive" alt=""/>
        <div class="b-wrapper">
            <h4 class="b-animate b-from-left  b-delay03">
                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
            </h4>
        </div>
    </div></a>
<div class="product-info simpleCart_shelfItem">
    <div class="product-info-cust">
        <h4>Wedding Flowers</h4>
        <p>ID: SR4598</p>
        <span class="item_price">$187.95</span>
        <input type="text" class="item_quantity" value="1" />
        <input type="button" class="item_add items" value="ADD">
    </div>
    <div class="clearfix"> </div>
</div>
</div>
<a href="single.html"><div class="product-grid love-grid">
    <div class="more-product"></div>
    <div class="product-img b-link-stripe b-animate-go  thickbox">
        <img src="images/p8.jpg" class="img-responsive" alt=""/>
        <div class="b-wrapper">
            <h4 class="b-animate b-from-left  b-delay03">
                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
            </h4>
        </div>
    </div></a>
<div class="product-info simpleCart_shelfItem">
    <div class="product-info-cust">
        <h4>Suits</h4>
        <p>ID: S4BJ87</p>
        <span class="item_price">$187.95</span>
        <input type="text" class="item_quantity" value="1" />
        <input type="button" class="item_add items" value="ADD">
    </div>
    <div class="clearfix"> </div>
</div>
</div>
<a href="single.html"><div class="product-grid love-grid">
    <div class="more-product"></div>
    <div class="product-img b-link-stripe b-animate-go  thickbox">
        <img src="images/p9.jpg" class="img-responsive" alt=""/>
        <div class="b-wrapper">
            <h4 class="b-animate b-from-left  b-delay03">
                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
            </h4>
        </div>
    </div></a>
<div class="product-info simpleCart_shelfItem">
    <div class="product-info-cust">
        <h4>Sherwani</h4>
        <p>ID: SR4598</p>
        <span class="item_price">$187.95</span>
        <input type="text" class="item_quantity" value="1" />
        <input type="button" class="item_add items" value="ADD">
    </div>
    <div class="clearfix"> </div>
</div>
</div>
<a href="single.html"><div class="product-grid love-grid">
    <div class="more-product"></div>
    <div class="product-img b-link-stripe b-animate-go  thickbox">
        <img src="images/p10.jpg" class="img-responsive" alt=""/>
        <div class="b-wrapper">
            <h4 class="b-animate b-from-left  b-delay03">
                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
            </h4>
        </div>
    </div></a>
<div class="product-info simpleCart_shelfItem">
    <div class="product-info-cust">
        <h4>Ethnic Wear</h4>
        <p>ID: SR4598</p>
        <span class="item_price">$187.95</span>
        <input type="text" class="item_quantity" value="1" />
        <input type="button" class="item_add items" value="ADD">
    </div>
    <div class="clearfix"> </div>
</div>
</div>
<a href="single.html"><div class="product-grid love-grid">
    <div class="more-product"></div>
    <div class="product-img b-link-stripe b-animate-go  thickbox">
        <img src="images/p11.jpg" class="img-responsive" alt=""/>
        <div class="b-wrapper">
            <h4 class="b-animate b-from-left  b-delay03">
                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
            </h4>
        </div>
    </div></a>
<div class="product-info simpleCart_shelfItem">
    <div class="product-info-cust">
        <h4>Watches</h4>
        <p>ID: S4BJ87</p>
        <span class="item_price">$187.95</span>
        <input type="text" class="item_quantity" value="1" />
        <input type="button" class="item_add items" value="ADD">
    </div>
    <div class="clearfix"> </div>
</div>
</div>
<a href="single.html"><div class="product-grid love-grid">
    <div class="more-product"></div>
    <div class="product-img b-link-stripe b-animate-go  thickbox">
        <img src="images/p12.jpg" class="img-responsive" alt=""/>
        <div class="b-wrapper">
            <h4 class="b-animate b-from-left  b-delay03">
                <button class="btns"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
            </h4>
        </div>
    </div></a>
<div class="product-info simpleCart_shelfItem">
    <div class="product-info-cust">
        <h4>Jewellery #1</h4>
        <p>ID: SR4598</p>
        <span class="item_price">$187.95</span>
        <input type="text" class="item_quantity" value="1" />
        <input type="button" class="item_add items" value="ADD">
    </div>
    <div class="clearfix"> </div>
</div>
</div>
</div>
<div class="rsidebar span_1_of_left">


</div>
</div>
</div>
</body>
</html>