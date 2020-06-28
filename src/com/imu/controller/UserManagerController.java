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
import java.util.List;

@Controller
public class UserManagerController {

    private UserService us = new UserService();

    @RequestMapping(value = "/userManager", method = RequestMethod.GET)
    public ModelAndView userManager(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        us = (UserService) wac.getBean("userService");

        List<Teacher> teachers = us.showTeacherUser();
        List<Admin> admins = us.showAdminUser();

        mv.addObject("userTeachers",teachers);
        mv.addObject("userAdmins",admins);
        mv.setViewName("user_management");

        return mv;
    }

    @RequestMapping(value = "/teacherChange",method = RequestMethod.GET)
    public ModelAndView teacherChange(HttpServletRequest request, HttpSession session){
        ModelAndView mv = new ModelAndView();

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        us = (UserService) wac.getBean("userService");

        Teacher teacher=us.findTeacherById(Integer.parseInt(request.getParameter("Tid")));

        mv.addObject("userTeacher",teacher);
        mv.setViewName("account_change");
        return mv;
    }

    @RequestMapping(value = "/saveChange",method = RequestMethod.POST)
    public ModelAndView saveTeacherChange(HttpServletRequest request) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        us = (UserService) wac.getBean("userService");

        request.setCharacterEncoding("UTF-8");

        Integer tid = Integer.parseInt(request.getParameter("Tid"));
        String tname = request.getParameter("TName");
        String college = request.getParameter("College");
        String speciality = request.getParameter("Speciality");
        String telephone = request.getParameter("Telephone");
        String address = request.getParameter("Address");

        //封装对象
        Teacher t = new Teacher();
        t.setTid(tid);
        t.setTname(tname);
        t.setCollege(college);
        t.setSpeciality(speciality);
        t.setTelephone(telephone);
        t.setAddress(address);

        us.updateTeacher(t);

        mv.addObject("errorMsg", "修改成功！");
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping(value = "/teacherDelete",method = RequestMethod.GET)
    public ModelAndView teacherDelete(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        us = (UserService) wac.getBean("userService");

        us.deleteTeacherById(Integer.parseInt(request.getParameter("Tid")));

        mv.addObject("errorMsg", "删除成功！");
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping(value = "/loginOff",method = RequestMethod.GET)
    public ModelAndView loginOff(HttpSession session){
        ModelAndView mv = new ModelAndView();
        session.setAttribute("isLogin",false);
        mv.addObject("errorMsg", "退出登录成功！");
        mv.setViewName("index");
        return mv;
    }
}
