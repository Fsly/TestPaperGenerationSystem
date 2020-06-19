package com.imu.service;

import com.imu.bean.Paper;
import com.imu.bean.Question;
import com.imu.dao.PaperDatabase;
import com.imu.dao.QuestionDatabase;

import java.util.List;

public class PaperService {
    private PaperDatabase paperDatabase=new PaperDatabase();

    public void setPaperDatabase(PaperDatabase paperDatabase) {
        this.paperDatabase = paperDatabase;
    }

    public List<Paper> getAll() {
        return paperDatabase.getall();
    }

    public List<Question> create(Integer grade1, Integer grade2, Integer grade3) {
        List<Question> qList=QuestionDatabase.getRandom(grade1,"一");
        List<Question> temp1=QuestionDatabase.getRandom(grade2,"二");
        qList.addAll(temp1);
        List<Question> temp2=QuestionDatabase.getRandom(grade3,"三");
        qList.addAll(temp2);
        return qList;
    }

    public Integer getNumber() {
        return paperDatabase.getnumber();
    }

    public void insert(Integer pid, String pname, String subject, String tname, List<Question> qList) {
        Paper p=new Paper();
        p.setPid(pid);
        p.setPname(pname);
        p.setSubject(subject);
        p.setTname(tname);
        paperDatabase.insert(p,qList);
    }
}
