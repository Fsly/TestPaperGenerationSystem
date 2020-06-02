package com.imu.service;

import com.imu.bean.Admin;
import com.imu.bean.Teacher;
import com.imu.dao.UserDatabase;

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
}
