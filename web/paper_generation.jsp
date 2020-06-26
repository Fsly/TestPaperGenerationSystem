<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.imu.bean.Admin" %>
<%@ page import="com.imu.bean.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: Fsly
  Date: 2020/5/31
  Time: 10:06
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
            <li class="active">Paper</li>
        </ol>

        <%if(isLogin!=null&& (boolean) isLogin) {%>

        <div class="col-md-9 product-price1">
            <div class="check-out">
                <div class=" cart-items">
                    <h3>试卷生成器</h3>
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
                            <li><span>卷子号</span></li>
                            <li><span>卷子名</span></li>
                            <li><span>学科</span></li>
                            <li><span>出题人</span></li>
                            <li> </li>
                            <div class="clearfix"> </div>
                        </ul>
                        <c:forEach items="${pList}" var="i" varStatus="id" begin="0">
                            <ul class="cart-header">
                                <%--<div class="close1"> </div>--%>
                                <li class="ring-in"><span>${i.pid}</span></li>
                                <li><span>${i.pname}</span></li>
                                <li><span>${i.subject}</span></li>
                                <li><span>${i.tname}</span></li>
                                <li> <a href="${pageContext.request.contextPath}/paperShow?pid=${i.pid}" class="add-cart cart-check">查看题目</a></li>
                                <div class="clearfix"> </div>
                            </ul>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 cart-total">
            <div class="total-item">
                <form name="myform">
                <h3>生成科目:</h3>
                <input type="text" name="Speciality" value="<%
                if(isLogin!=null&& (boolean) isLogin&&isAdmin!=null&&!(boolean)isAdmin){
                %><%=((Teacher)userTeacher).getSpeciality()%><%}%>">
                <input type="text" name="Tname" value="<%
                if(isLogin!=null&& (boolean) isLogin&&isAdmin!=null&&!(boolean)isAdmin){
                %><%=((Teacher)userTeacher).getTname()%><%}%>" hidden>
                </form>
            </div>
            <script type="text/javascript">
                function tishi()
                {
                    var t=prompt("请输入试卷的名字","模拟试卷")
                    if (t!=null && t!=="")
                    {
                        var name=myform.Speciality.value;
                        var tname=myform.Tname.value;
                        window.location.href='${pageContext.request.contextPath}/createPaper?s=6.3.1&pname='+t+'&pclass='+name+'&tname='+tname
                    }
                }
            </script>
            <a class="continue" href="#" onclick="tishi()">固定模式生成</a>
            <div class="price-details">
                <h3>试题数据</h3>
                <span>难度1-2</span>
                <span class="total">6道</span>
                <span>难度3-4</span>
                <span class="total">3道</span>
                <span>难度5</span>
                <span class="total">1道</span>
                <div class="clearfix"></div>
            </div>
            <h4 class="last-price">TOTAL</h4>
            <span class="total final">10道</span>
            <div class="clearfix"></div>

            <%
                Object dzeid= session.getAttribute("dzeid");
                Object dzsubject= session.getAttribute("dzsubject");
                Object dzchapter= session.getAttribute("dzchapter");
            %>
            <form name="dzform">
                <input type="text" name="dzeid" value="<%if(dzeid!=null){%><%=dzeid%><%}%>" hidden>
            </form>
            <script type="text/javascript">
                function dingzhi()
                {
                    var t=prompt("请输入试卷的名字","模拟试卷")

                    var dze=dzform.dzeid.value;
                    var name=myform.Speciality.value;
                    var tname=myform.Tname.value;
                    if (t!=null && t!==""&&dze!=null)
                    {
                        window.location.href='${pageContext.request.contextPath}/dzCreatePaper?pname='+t+'&pclass='+name+'&tname='+tname
                    }
                }
            </script>
            <a class="order" href="#" onclick="dingzhi()">定制模式生成</a>
            <div class="total-item">
                <h3>设置题目内容</h3>
                <% if(dzeid==null){%><h4>暂无定制信息</h4>
                <%}else{%><h4>已有定制信息</h4>
                <%}%>
                <a class="cpns" href="custom_management.jsp">修改定制</a>

                <p><a href="#">注意：</a>根据定制生成您所需试卷</p>
            </div>
        </div>
        <%
            }else{
                out.print("<p><span style=\"color: #dc143c; \">请先登录</span></p>");
            }
        %>
    </div>
</div>
<!---->

<!---->

<!---->

</body>
</html>