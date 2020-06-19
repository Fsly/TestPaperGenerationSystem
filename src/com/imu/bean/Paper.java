package com.imu.bean;

public class Paper {
    private Integer pid;
    private String pname;
    private String Date;
    private String Subject;
    private Integer eid;

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    private String tname;

    @Override
    public String toString() {
        return "Paper{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", Date='" + Date + '\'' +
                ", Subject='" + Subject + '\'' +
                ", eid=" + eid +
                ", tname='" + tname + '\'' +
                '}';
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String subject) {
        Subject = subject;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }
}
