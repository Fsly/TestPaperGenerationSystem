package com.imu.controller;

import com.imu.bean.Admin;
import com.imu.bean.Teacher;
import com.imu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;


@Controller
public class LoginController {

    private UserService us = new UserService();

    @RequestMapping(value = "/userLogin",method = RequestMethod.POST)
    public ModelAndView userLogin(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        ModelAndView mv=new ModelAndView();

        String username = request.getParameter("TName");
        String password = request.getParameter("Password");

        //封装对象
        Teacher u = new Teacher();
        u.setTname(username);
        u.setPassword(password);

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        us = (UserService) wac.getBean("userService");

        Object user=us.getUserLogin(u);

        if(user instanceof Teacher){
            session.setAttribute("userTeacher",user);
            session.setAttribute("isLogin",true);
            session.setAttribute("isAdmin",false);
            mv.setViewName("index");
        }else if(user instanceof Admin){
            session.setAttribute("userAdmin",user);
            session.setAttribute("isLogin",true);
            session.setAttribute("isAdmin",true);
            mv.setViewName("index");
        }else {
            mv.addObject("errorMsg","用户名或密码错误");
            mv.setViewName("login");
        }

        return mv;
    }
}
