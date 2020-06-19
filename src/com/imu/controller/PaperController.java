package com.imu.controller;

import com.imu.bean.*;
import com.imu.service.PaperService;
import com.imu.service.QuestionService;
import com.imu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
@Controller
public class PaperController {
    private PaperService ps = new PaperService();

    @RequestMapping(value = "/getfixAll")
    public ModelAndView getFixAll(HttpServletRequest request, HttpSession session){
        ModelAndView mv=new ModelAndView();
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        ps = (PaperService) wac.getBean("paperService");

        List<Paper> paperList=ps.getAll();
        session.setAttribute("pList",paperList);
        mv.setViewName("paper_generation");
        return mv;
    }

    @RequestMapping(value = "/createPaper")
    public ModelAndView createPaper(HttpServletRequest request, HttpSession session){
        ModelAndView mv=new ModelAndView();
        //容器获取service
        String s = request.getParameter("s");
        s = s.replace("\"", "%22").replace("{", "%7b").replace("}", "%7d");
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        ps = (PaperService) wac.getBean("paperService");

        //拆分
        List<Integer> sint=new ArrayList<>();
        String[] the_split = s.split("\\.");
        for (String str : the_split) {
            sint.add(Integer.parseInt(str));
        }
        List<Question> qList=ps.create(sint.get(0),sint.get(1),sint.get(2));
        session.setAttribute("qList",qList);

        String Pname = request.getParameter("pname");
        String Subject = request.getParameter("subject");
        String Tname = request.getParameter("tname");
        Integer Pid=ps.getNumber();
        ps.insert(Pid+1,Pname,Subject,Tname,qList);
        //mv.setViewName("question_management");
        return mv;
    }
}
