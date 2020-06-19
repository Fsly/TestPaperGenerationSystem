package com.imu.dao;

import com.imu.bean.Paper;
import com.imu.bean.Question;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class PaperDatabase {
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
    public List<Paper> getall() {
        SqlSession session = ssf.openSession();
        return session.selectList("PaperMapper.allPaper");
    }

    public Integer getnumber() {
        SqlSession session = ssf.openSession();
        return session.selectOne("PaperMapper.getnumber");
    }

    public void insert(Paper p, List<Question> qList) {
        SqlSession session = ssf.openSession();
        for (Question question : qList) {
            p.setEid(question.getEid());
            session.insert("PaperMapper.insertPaper", p);
        }
        session.commit();
    }
}
