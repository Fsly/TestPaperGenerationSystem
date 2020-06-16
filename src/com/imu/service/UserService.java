package com.imu.service;

import com.imu.bean.Admin;
import com.imu.bean.Teacher;
import com.imu.dao.UserDatabase;

import java.util.List;

public class UserService {
    private UserDatabase userDatabase;

    public void setUserDatabase(UserDatabase userDatabase) {
        this.userDatabase = userDatabase;
    }

    public Object getUserLogin(Teacher teacher) {
        Teacher loginTeacher = userDatabase.loginTeacher(teacher);
        Admin loginAdmin = userDatabase.loginAdmin(teacher);
        if (loginTeacher != null) {
            return loginTeacher;
        } else {
            return loginAdmin;
        }
    }

    public boolean teacherRegister(Teacher teacher) {
        int result = userDatabase.register(teacher);
        return result != -1;
    }

    public List<Teacher> showTeacherUser() {
        return userDatabase.showAllTeacher();
    }

    public List<Admin> showAdminUser() {
        return userDatabase.showAllAdmin();
    }

    public Teacher findTeacherById(Integer id) {
        return userDatabase.findTeacherById(id);
    }

    public Admin findAdminById(Integer id) {
        return userDatabase.findAdminById(id);
    }

    public void updateTeacher(Teacher teacher){
        userDatabase.updateTeacher(teacher);
    }

    public void deleteTeacherById(Integer id){
        userDatabase.deleteTeacherById(id);
    }
}
