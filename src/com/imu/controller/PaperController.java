package com.imu.controller;

import com.imu.bean.*;
import com.imu.service.PaperService;
import com.imu.service.QuestionService;
import com.imu.service.UserService;
import org.apache.taglibs.standard.lang.jstl.NullLiteral;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
@Controller
public class PaperController {
    private PaperService ps = new PaperService();

    @RequestMapping(value = "/getfixAll")
    public ModelAndView getFixAll(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        ps = (PaperService) wac.getBean("paperService");

        List<Paper> paperList = ps.getAll();
        session.setAttribute("pList", paperList);
        mv.setViewName("paper_generation");
        return mv;
    }

    @RequestMapping(value = "/createPaper")
    public ModelAndView createPaper(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");

        String s = request.getParameter("s");
        String Pname = request.getParameter("pname");
        String Subject = request.getParameter("pclass");
        String Tname = request.getParameter("tname");
//        s = s.replace("\"", "%22").replace("{", "%7b").replace("}", "%7d");

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        ps = (PaperService) wac.getBean("paperService");

        //拆分
        List<Integer> sint = new ArrayList<>();
        String[] the_split = s.split("\\.");
        for (String str : the_split) {
            sint.add(Integer.parseInt(str));
        }


        List<Question> qList = ps.create(sint.get(0), sint.get(1), sint.get(2));
        session.setAttribute("qList", qList);


        Integer Pid = ps.getNumber();


        ModelAndView mv = new ModelAndView();
        ps.insert(Pid + 1, Pname, Subject, Tname, qList);
        mv.addObject("pid",Pid + 1);
        mv.setViewName("redirect:paperShow");
        return mv;
    }

    @RequestMapping(value = "/dzSession", method = RequestMethod.POST)
    public ModelAndView dzSession(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        Integer eid = Integer.parseInt(request.getParameter("EID"));
        String Subject = request.getParameter("Subject");
        String Chapter = request.getParameter("Chapter");

        session.setAttribute("dzeid", eid);
        session.setAttribute("dzsubject", Subject);
        session.setAttribute("dzchapter", Chapter);

        ModelAndView mv = new ModelAndView();
        mv.addObject("errorMsg", "定制信息添加成功！");
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping(value = "/dzCreatePaper")
    public ModelAndView dzCreatePaper(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        String dzsubject = (String) session.getAttribute("dzsubject");

        if (dzsubject == null) {
            ModelAndView mv = new ModelAndView();
            mv.addObject("errorMsg", "您还没有定制信息！");
            mv.setViewName("index");
            return mv;
        }

        Integer dzeid = (Integer) session.getAttribute("dzeid");
        String dzchapter = (String) session.getAttribute("dzchapter");

        String Pname = request.getParameter("pname");
        String Subject = request.getParameter("pclass");
        String Tname = request.getParameter("tname");

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        ps = (PaperService) wac.getBean("paperService");

        //拆分
        List<Integer> subjects = new ArrayList<>();
        String[] the_split1 = dzsubject.split("\\.");
        for (String str : the_split1) {
            subjects.add(Integer.parseInt(str));
        }

        //拆分
        List<Integer> chapters = new ArrayList<>();
        String[] the_split2 = dzchapter.split("\\.");
        for (String str : the_split2) {
            chapters.add(Integer.parseInt(str));
        }

        ModelAndView mv = new ModelAndView();
        Integer Pid = ps.getNumber();
        ps.addDzPaper(Pid + 1, Pname, Subject, Tname, subjects, chapters);
        mv.addObject("pid",Pid + 1);
        mv.setViewName("redirect:paperShow");
        return mv;
    }

    @RequestMapping(value = "/paperShow")
    public ModelAndView paperShow(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        Integer pid = Integer.parseInt(request.getParameter("pid"));

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        ps = (PaperService) wac.getBean("paperService");

        ModelAndView mv = new ModelAndView();
        List<Question> questions=ps.findPaperByPid(pid);
        Paper paper=ps.findPaperDetailByPid(pid);
        mv.addObject("paperQuestion",questions);
        mv.addObject("paperDetail",paper);
        mv.setViewName("paper_browse");
        return mv;
    }
}
