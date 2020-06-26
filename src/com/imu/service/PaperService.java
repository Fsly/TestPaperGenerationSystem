package com.imu.service;

import com.imu.bean.Paper;
import com.imu.bean.Question;
import com.imu.dao.PaperDatabase;
import com.imu.dao.QuestionDatabase;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class PaperService {
    private PaperDatabase paperDatabase = new PaperDatabase();

    private QuestionDatabase questionDatabase = new QuestionDatabase();

    public void setPaperDatabase(PaperDatabase paperDatabase) {
        this.paperDatabase = paperDatabase;
    }

    public void setQuestionDatabase(QuestionDatabase questionDatabase) {
        this.questionDatabase = questionDatabase;
    }

    public List<Paper> getAll() {
        return paperDatabase.getall();
    }

    public List<Question> create(Integer grade1, Integer grade2, Integer grade3) {
        List<Question> qList = QuestionDatabase.getRandom(grade1, "一");
        List<Question> temp1 = QuestionDatabase.getRandom(grade2, "二");
        qList.addAll(temp1);
        List<Question> temp2 = QuestionDatabase.getRandom(grade3, "三");
        qList.addAll(temp2);
        return qList;
    }

    public Integer getNumber() {
        return paperDatabase.getnumber();
    }

    public void insert(Integer pid, String pname, String subject, String tname, List<Question> qList) {
        Paper p = new Paper();
        p.setPid(pid);
        p.setPname(pname);
        p.setSubject(subject);
        p.setTname(tname);
        paperDatabase.insert(p, qList);
    }

    public void addDzPaper(Integer pid, String pname, String subject, String tname, List<Integer> subjects, List<Integer> chapters) {
        Paper p = new Paper();
        p.setPid(pid);
        p.setPname(pname);
        p.setSubject(subject);
        p.setTname(tname);
        List<Question> questions = questionDatabase.getall();

        Integer[] isUsed = new Integer[1000];

        Integer[] gradeNum = new Integer[1000];
        Integer[] chapterNum = new Integer[1000];

        for (int j = 0; j < questions.size(); j++) {
            isUsed[j] = 0;
            switch (questions.get(j).getChapter()) {
                case "第一章":
                    chapterNum[j] = 1;
                    break;
                case "第二章":
                    chapterNum[j] = 2;
                    break;
                case "第三章":
                    chapterNum[j] = 3;
                    break;
                case "第四章":
                    chapterNum[j] = 4;
                    break;
                case "第五章":
                    chapterNum[j] = 5;
                    break;
            }
            switch (questions.get(j).getGrade()) {
                case "一":
                    gradeNum[j] = 1;
                    break;
                case "二":
                    gradeNum[j] = 2;
                    break;
                case "三":
                    gradeNum[j] = 3;
                    break;
                case "四":
                    gradeNum[j] = 4;
                    break;
                case "五":
                    gradeNum[j] = 5;
                    break;
            }
        }

        List<Question> targetQuestion = new ArrayList<>();

        for (int i = 0; i < subjects.size(); i++) {
            List<Integer> isAllow = new ArrayList<>();
            for (int j = 0; j < questions.size(); j++) {
                if (gradeNum[j].equals(subjects.get(i))
                        && chapterNum[j].equals(chapters.get(i))
                        && isUsed[j] != 1) {
                    isAllow.add(j);
                }
            }
            if (isAllow.size() > 0) {
                Random r = new Random();
                int i1 = r.nextInt(isAllow.size());
                targetQuestion.add(questions.get(isAllow.get(i1)));
                isUsed[isAllow.get(i1)] = 1;
            }
        }

        paperDatabase.insert(p, targetQuestion);
    }

    public List<Question> findPaperByPid(Integer pid) {
        return paperDatabase.findPaperByPid(pid);
    }

    public Paper findPaperDetailByPid(Integer pid) {
        return paperDatabase.findPaperDetailByPid(pid).get(0);
    }
}
