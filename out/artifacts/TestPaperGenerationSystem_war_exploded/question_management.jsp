<%@ page import="com.imu.bean.Teacher" %>
<%@ page import="com.imu.bean.Admin" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Fsly
  Date: 2020/5/31
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wedding Store A Ecommerce Category Flat Bootstarp Resposive Website Template | Cart :: w3layouts</title>
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
                    <li class="grid"><a href="${pageContext.request.contextPath}/getfixAll">试卷生成</a></li>
                    <li class="grid"><a href="${pageContext.request.contextPath}/getAll_question">管理题库</a></li>
                    <li class="grid"><a href="${pageContext.request.contextPath}/userManager">管理用户</a></li>
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
<div class="checkout">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="index.jsp">Home</a></li>
            <li class="active">Question Bank</li>
        </ol>
        <div class="col-md-9 product-price1">
            <div class="check-out">
                <div class=" cart-items">
                    <h3>题库</h3>
                    <p><span style="color: #dc143c; "><%
                        if(isLogin!=null&& (boolean) isLogin) {
                        }else{
                            out.print("请先登录");
                        }
                    %></span></p>
                    <script>$(document).ready(function(c) {
                        $('.close1').on('click', function(c){
                            $('.cart-header').fadeOut('slow', function(c){
                                $('.cart-header').remove();
                            });
                        });
                    });
                    </script>
                    <script>$(document).ready(function(c) {
                        $('.close2').on('click', function(c){
                            $('.cart-header1').fadeOut('slow', function(c){
                                $('.cart-header1').remove();
                            });
                        });
                    });
                    </script>

                    <div class="in-check" >
                        <ul class="unit">
                            <li><span>题号</span></li>
                            <li><span>学科</span></li>
                            <li><span>章节</span></li>
                            <li><span>难度</span></li>
                            <li> </li>
                            <div class="clearfix"> </div>
                        </ul>

                        <%
                            if(isLogin!=null&& (boolean) isLogin) {

                        %>

                        <c:forEach items="${qList}" var="i" varStatus="id" begin="0">
                            <ul class="cart-header">
                                <li class="ring-in"><span>${i.eid}</span></li>
                                <li><span>${i.subject}</span></li>
                                <li><span>${i.chapter}</span></li>
                                <li><span>${i.grade}</span></li>
                                <li> <a href="${pageContext.request.contextPath}/detail_question?Eid=${i.eid}" class="add-cart cart-check">修改题目</a>
                                <a href="${pageContext.request.contextPath}/delete_question?Eid=${i.eid}" class="add-cart cart-check">删除题目</a></li>
                                <div class="clearfix"> </div>
                            </ul>
                        </c:forEach>

                        <%
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>

        <%
            if(isLogin!=null&& (boolean) isLogin) {

        %>

        <div class="col-md-3 cart-total">
            <a class="continue" href="question_detail.jsp">添加试题</a>
            <div class="contact-form">
                <form method="post" action="${pageContext.request.contextPath}/like_find">
                    <div>
                        <span><input name="finding" type="text" class="textbox"></span>
                    </div>
                    <div>
                        <span><input type="submit" class="mybutton" value="查询试题"></span>
                    </div>
                </form>
            </div>
        </div>

        <%
            }
        %>

    </div>
</div>
</div>
<!---->

<!---->

<!---->

</body>
</html>
