package com.imu.bean;

public class Teacher {
    private Integer tid;
    private String tname;
    private String College;
    private String Speciality;
    private String Telephone;
    private String Address;
    private String Password;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getCollege() {
        return College;
    }

    public void setCollege(String college) {
        College = college;
    }

    public String getSpeciality() {
        return Speciality;
    }

    public void setSpeciality(String speciality) {
        Speciality = speciality;
    }

    public String getTelephone() {
        return Telephone;
    }

    public void setTelephone(String telephone) {
        Telephone = telephone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "tid=" + tid +
                ", tname='" + tname + '\'' +
                ", College='" + College + '\'' +
                ", Speciality='" + Speciality + '\'' +
                ", Telephone='" + Telephone + '\'' +
                ", Address='" + Address + '\'' +
                ", Password='" + Password + '\'' +
                '}';
    }
}
