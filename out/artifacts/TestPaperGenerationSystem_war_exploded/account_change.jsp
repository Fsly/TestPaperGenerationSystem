<%@ page import="com.imu.bean.Teacher" %>
<%@ page import="com.imu.bean.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Fsly
  Date: 2020/5/30
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wedding Store A Ecommerce Category Flat Bootstarp Resposive Website Template | Account :: w3layouts</title>
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
<div class="container">
    <ol class="breadcrumb">
        <li><a href="index.jsp">Home</a></li>
        <li class="active">Account</li>
    </ol>
    <div class="registration">
        <div class="registration_left">
            <h2>修改教师信息</h2>
            <p><span style="color: #dc143c; ">${requestScope.errorMsg}</span></p>
            <!-- [if IE]
               < link rel='stylesheet' type='text/css' href='ie.css'/>
            [endif] -->

            <!-- [if lt IE 7]>
               < link rel='stylesheet' type='text/css' href='ie6.css'/>
            <! [endif] -->
            <script>
                (function() {

                    // Create input element for testing
                    var inputs = document.createElement('input');

                    // Create the supports object
                    var supports = {};

                    supports.autofocus   = 'autofocus' in inputs;
                    supports.required    = 'required' in inputs;
                    supports.placeholder = 'placeholder' in inputs;

                    // Fallback for autofocus attribute
                    if(!supports.autofocus) {

                    }

                    // Fallback for required attribute
                    if(!supports.required) {

                    }

                    // Fallback for placeholder attribute
                    if(!supports.placeholder) {

                    }

                    // Change text inside send button on submit
                    var send = document.getElementById('register-submit');
                    if(send) {
                        send.onclick = function () {
                            this.innerHTML = '...Sending';
                        }
                    }

                })();
            </script>
            <div class="registration_form">
                <!-- Form -->
                <%Teacher teacher= (Teacher) request.getAttribute("userTeacher");%>
                <form id="registration_form" action="${pageContext.request.contextPath}/saveChange" method="post">
                    <div>
                        <label>
                            <%out.print("<input placeholder=\"教师编号:\" type=\"number\" tabindex=\"1\" name=\"Tid\" value=\""+teacher.getTid()+"\" required autofocus>");%>
                        </label>
                    </div>
                    <div>
                        <label>
                            <%out.print("<input placeholder=\"姓名:\" type=\"text\" tabindex=\"2\" name=\"TName\" value=\""+teacher.getTname()+"\" required autofocus>");%>

                        </label>
                    </div>
                    <div>
                        <label>
                            <%out.print("<input placeholder=\"学院:\" type=\"text\" tabindex=\"3\" name=\"College\" value=\""+teacher.getCollege()+"\" required>");%>
                        </label>
                    </div>
                    <div>
                        <label>
                            <%out.print("<input placeholder=\"专业:\" type=\"text\" tabindex=\"4\" name=\"Speciality\" value=\""+teacher.getSpeciality()+"\" required>");%>
                        </label>
                    </div>
                    <div>
                        <label>
                            <%out.print("<input placeholder=\"电话:\" type=\"text\" tabindex=\"5\" name=\"Telephone\" value=\""+teacher.getTelephone()+"\" required>");%>
                        </label>
                    </div>
                    <div>
                        <label>
                            <%out.print("<input placeholder=\"地址:\" type=\"text\" tabindex=\"6\" name=\"Address\" value=\""+teacher.getAddress()+"\" required>");%>
                        </label>
                    </div>
                    <div>
                        <input type="submit" value="保存" id="register-submit">
                    </div>
                </form>
                <!-- /Form -->
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

</body>
</html>
