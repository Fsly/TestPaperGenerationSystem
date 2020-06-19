package com.imu.controller;

import com.imu.bean.Question;
import com.imu.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.UnsupportedEncodingException;
import java.util.List;
@Controller
public class QuestionController {
    private QuestionService qs = new QuestionService();

    @RequestMapping(value = "/getAll_question")
    public ModelAndView getAllQuestion(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");

        List<Question> questionList = qs.getAll();
        session.setAttribute("qList", questionList);
        mv.setViewName("question_management");
        return mv;
    }

    @RequestMapping(value = "/add_question")
    public ModelAndView addQuestion(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();

        request.setCharacterEncoding("UTF-8");
        Integer eid = Integer.parseInt(request.getParameter("EID"));
        String descibe = request.getParameter("Des");
        String key = request.getParameter("Keyy");
        String subject = request.getParameter("Subject");
        String chapter = request.getParameter("Chapter");
        String grade = request.getParameter("Grade");

//        descibe = new String(descibe.getBytes("iso-8859-1"),"utf-8");
//        key = new String(key.getBytes("iso-8859-1"),"utf-8");
//        subject = new String(subject.getBytes("iso-8859-1"),"utf-8");
//        chapter = new String(chapter.getBytes("iso-8859-1"),"utf-8");
//        grade = new String(grade.getBytes("iso-8859-1"),"utf-8");

        Question q = new Question();
        q.setEid(eid);
        q.setDescribe(descibe);
        q.setKey(key);
        q.setSubject(subject);
        q.setChapter(chapter);
        q.setGrade(grade);
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");

        qs.addQuestion(q);
        List<Question> questionList = qs.getAll();
        session.setAttribute("qList", questionList);
        mv.setViewName("question_management");
        return mv;
    }

    @RequestMapping(value = "/delete_question")
    public ModelAndView deleteQuestion(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        Integer eid = Integer.parseInt(request.getParameter("Eid"));
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");
        qs.deleteQuestion(eid);
        mv.addObject("errorMsg", "删除成功！");
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping(value = "/update_question_des")
    public ModelAndView updateQuestion_des(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String descibe = request.getParameter("Descibe");
        Integer eid = Integer.parseInt(request.getParameter("Eid"));
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");
        qs.changeQuestion_des(descibe, eid);
        mv.setViewName("question_management");
        return mv;
    }

    @RequestMapping(value = "/update_question_key")
    public ModelAndView updateQuestion_key(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        String key = request.getParameter("Key");
        Integer eid = Integer.parseInt(request.getParameter("Eid"));
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");
        qs.changeQuestion_key(key, eid);
        mv.setViewName("question_management");
        return mv;
    }

    @RequestMapping(value = "/like_find")
    public ModelAndView LikeFind(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();

        request.setCharacterEncoding("UTF-8");
        String s = request.getParameter("finding");

        //s = new String(s.getBytes("iso-8859-1"), "utf-8");

        System.out.println(s);
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");
        List<Question> questionList = qs.likeFind(s);
        for (Question question : questionList) {
            System.out.println(question.getDescribe());
        }
        session.setAttribute("qList", questionList);
        mv.setViewName("question_management");
        return mv;
    }

    //fs

    @RequestMapping(value = "/detail_question")
    public ModelAndView questionDetail(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");

        Integer eid = Integer.parseInt(request.getParameter("Eid"));
        Question question = qs.findQuestionById(eid);
        mv.addObject("question", question);
        mv.setViewName("question_detail");
        return mv;
    }

    @RequestMapping(value = "/update_question")
    public ModelAndView questionUpdate(HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();

        //容器获取service
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        qs = (QuestionService) wac.getBean("questionService");

        request.setCharacterEncoding("UTF-8");

        Integer eid = Integer.parseInt(request.getParameter("EID"));
        String Des=request.getParameter("Des");
        String Keyy=request.getParameter("Keyy");
        String Subject=request.getParameter("Subject");
        String Chapter=request.getParameter("Chapter");
        String Grade=request.getParameter("Grade");

        Question question=new Question();
        question.setEid(eid);
        question.setDescribe(Des);
        question.setKey(Keyy);
        question.setGrade(Grade);
        question.setChapter(Chapter);
        question.setSubject(Subject);

        qs.updateQuestion(question);

        mv.addObject("errorMsg", "修改成功！");
        mv.setViewName("index");
        return mv;
    }
}
