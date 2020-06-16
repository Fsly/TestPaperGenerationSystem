<%@ page import="com.imu.bean.Admin" %>
<%@ page import="com.imu.bean.Teacher" %><%--
  Created by IntelliJ IDEA.
  User: Fsly
  Date: 2020/5/29
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Wedding Store A Ecommerce Category Flat Bootstarp Resposive Website Template | Login :: w3layouts</title>
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
              if (isAdmin != null && (boolean) isAdmin) {
                out.print("管理员");
              } else {
                out.print(((Teacher) userTeacher).getSpeciality());
              }
            }
          %></a></li>
        </ul>
      </div>
      <div class="top_left">
        <ul>
          <li class="top_link">Phone:<a href="mailto:info@example.com"><%
            if(isLogin!=null&& (boolean) isLogin) {
              if (isAdmin != null && (boolean) isAdmin) {
                out.print(((Admin) userAdmin).getTelephone());
              } else {
                out.print(((Teacher) userTeacher).getTelephone());
              }
            }
          %></a></li>|
          <li class="top_link"><a href="login.jsp"><%
            if(isLogin!=null&& (boolean) isLogin) {
              if (isAdmin != null && (boolean) isAdmin) {
                out.print(((Admin) userAdmin).getName());
              } else {
                out.print(((Teacher) userTeacher).getTname());
              }
            }else {
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
<div class="login_sec">
  <div class="container">
    <ol class="breadcrumb">
      <li class="active">Home</li>
    </ol>
    <h2>欢迎进入试卷生成系统！</h2>
    <div class="col-md-6 log">
      <p>Welcome to the test paper generation system!</p>
      <p>如果你还没有账号，<span><a href="account.jsp"> 点击这里</a></span></p>
      <h5>用户名:
      <%
        if(isLogin!=null&& (boolean) isLogin) {
          if (isAdmin != null && (boolean) isAdmin) {
            out.print(((Admin) userAdmin).getName());
          } else {
            out.print(((Teacher) userTeacher).getTname());
          }
        }
      %>
      </h5>
      <h5>用户等级:
        <%
          if(isLogin!=null&& (boolean) isLogin) {
            if (isAdmin != null && (boolean) isAdmin) {
              out.print("管理员");
            } else {
              out.print("教师");
            }
          }
        %>
      </h5>

    </div>

    <div class="clearfix"></div>
  </div>
</div>
</body>
</html>
