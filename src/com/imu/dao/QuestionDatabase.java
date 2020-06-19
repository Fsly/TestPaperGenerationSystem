package com.imu.dao;

import com.imu.bean.Question;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class QuestionDatabase {
    private static SqlSessionFactory ssf;
    static {
        try {
            //读取配置文件
            InputStream in = Resources.getResourceAsStream("sqlMapConfig.xml");
            //需要sqlSessionFactoryBuilder创建sqlSessionFactory
            ssf = new SqlSessionFactoryBuilder().build(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Question> getRandom(Integer grade, String s) {
        Question q=new Question();
        q.setGrade(s) ;
        q.setEid(grade) ;
        SqlSession session = ssf.openSession();
        return session.selectList("QuestionMapper.randomQuestion",q);
    }

    public List<Question> getall() {
        SqlSession session = ssf.openSession();
        return session.selectList("QuestionMapper.allQuestion");
    }

    public void add(Question q) {
        SqlSession session = ssf.openSession();
        session.insert("QuestionMapper.insertQuestion",q);
        session.commit();
    }

    public void delete(Integer eid) {
        SqlSession session = ssf.openSession();
        session.delete("QuestionMapper.deleteQuestion",eid);
        session.commit();
    }

    public void update_des(String descibe, Integer eid) {
        Question q=new Question();
        q.setEid(eid);
        q.setDescribe(descibe);
        SqlSession session = ssf.openSession();
        session.update("QuestionMapper.changeQuestion_Des",q);
        session.commit();
    }

    public void update_key(String key, Integer eid) {
        Question q=new Question();
        q.setEid(eid);
        q.setKey(key);
        SqlSession session = ssf.openSession();
        session.update("QuestionMapper.changeQuestion_Key",q);
        session.commit();
    }

    public List<Question> like_find(String s) {
        SqlSession session = ssf.openSession();
        Question q=new Question();
        q.setDescribe(s);
        return session.selectList("QuestionMapper.like_findQuestion",s);
    }

    public Question findQuestionById(Integer id){
        SqlSession session = ssf.openSession();
        return session.selectOne("QuestionMapper.findQuestionById",id);
    }

    public void updateQuestion(Question question){
        SqlSession session = ssf.openSession();
        session.update("QuestionMapper.changeQuestion",question);
        session.commit();
    }
}
