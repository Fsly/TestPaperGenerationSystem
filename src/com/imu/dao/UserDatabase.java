package com.imu.dao;

import com.imu.bean.Admin;
import com.imu.bean.Teacher;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class UserDatabase {
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

    public Teacher loginTeacher(Teacher teacher) {
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        //查询是否存在
        return session.selectOne("UserMapper.findTeacherByNP", teacher);
    }

    public Admin loginAdmin(Teacher teacher) {
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        //查询是否存在
        return session.selectOne("UserMapper.findAdminByNP", teacher);
    }

    public int register(Teacher teacher) {
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        //插入
        int result;
        try {
            result = session.insert("UserMapper.insertNewTeacher", teacher);
        } catch (Exception e) {
            result = -1;
        }
        session.commit();
        return result;
    }

    public List<Teacher> showAllTeacher(){
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        return session.selectList("UserMapper.showAllTeacher");
    }

    public List<Admin> showAllAdmin(){
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        return session.selectList("UserMapper.showAllAdmin");
    }

    public Teacher findTeacherById(Integer id){
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        return session.selectOne("UserMapper.findTeacherById", id);
    }

    public Admin findAdminById(Integer id){
        //生产一个sqlSession
        SqlSession session = ssf.openSession();

        return session.selectOne("UserMapper.findAdminById", id);
    }

    public void updateTeacher(Teacher teacher){
        //生产一个sqlSession
        SqlSession session = ssf.openSession();
        session.update("UserMapper.updateTeacher",teacher);
        session.commit();
    }

    public void deleteTeacherById(Integer id){
        //生产一个sqlSession
        SqlSession session = ssf.openSession();
        session.delete("UserMapper.deleteTeacherById",id);
        session.commit();
    }

}
