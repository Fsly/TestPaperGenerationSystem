package com.imu.bean;

public class Question {
    private Integer eid;
    private String Des;
    private String Keyy;
    private String Subject;
    private String Chapter;
    private String Grade;

    @Override
    public String toString() {
        return "Question{" +
                "eid=" + eid +
                ", Des='" + Des + '\'' +
                ", Keyy='" + Keyy + '\'' +
                ", Subject='" + Subject + '\'' +
                ", Chapter='" + Chapter + '\'' +
                ", Grade='" + Grade + '\'' +
                '}';
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public void setDescribe(String describe) {
        Des = describe;
    }

    public void setKey(String key) {
        Keyy = key;
    }

    public void setSubject(String subject) {
        Subject = subject;
    }

    public void setChapter(String chapter) {
        Chapter = chapter;
    }

    public void setGrade(String grade) {
        Grade = grade;
    }

    public Integer getEid() {
        return eid;
    }

    public String getDescribe() {
        return Des;
    }

    public String getKey() {
        return Keyy;
    }

    public String getSubject() {
        return Subject;
    }

    public String getChapter() {
        return Chapter;
    }

    public String getGrade() {
        return Grade;
    }
}
