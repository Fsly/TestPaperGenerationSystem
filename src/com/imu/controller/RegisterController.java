package com.imu.controller;

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

@Controller
public class RegisterController {

    private UserService us = new UserService();

    @RequestMapping(value = "/teacherRegister", method = RequestMethod.POST)
    public ModelAndView teacherRegister(HttpServletRequest request, HttpSession session) {

        ModelAndView mv = new ModelAndView();

        Integer tid = Integer.parseInt(request.getParameter("Tid"));
        String tname = request.getParameter("TName");
        String college = request.getParameter("College");
        String speciality = request.getParameter("Speciality");
        String telephone = request.getParameter("Telephone");
        String address = request.getParameter("Address");
        String password = request.getParameter("Password");
        String password2 = request.getParameter("Password2");

        //两次密码不同
        if (!password.equals(password2)) {
            mv.addObject("errorMsg", "两次密码不一致");
            mv.setViewName("account");
        }

        //封装对象
        Teacher t = new Teacher();
        t.setTid(tid);
        t.setTname(tname);
        t.setCollege(college);
        t.setSpeciality(speciality);
        t.setTelephone(telephone);
        t.setAddress(address);
        t.setPassword(password);

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        us = (UserService) wac.getBean("userService");

        boolean result = us.teacherRegister(t);

        if (result) {
            mv.addObject("errorMsg", "注册成功！");
            mv.setViewName("login");
        } else {
            mv.addObject("errorMsg", "注册失败");
            mv.setViewName("account");
        }
        return mv;
    }
}
