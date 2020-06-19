package com.imu.service;

import com.imu.bean.Question;
import com.imu.dao.QuestionDatabase;

import java.util.List;

public class QuestionService {
    private QuestionDatabase questionDatabase = new QuestionDatabase();

    public List<Question> getAll() {
        return questionDatabase.getall();
    }

    public void setQuestionDatabase(QuestionDatabase questionDatabase) {
        this.questionDatabase = questionDatabase;
    }

    public void addQuestion(Question q) {
        questionDatabase.add(q);
    }

    public void deleteQuestion(Integer eid) {
        questionDatabase.delete(eid);
    }

    public void changeQuestion_des(String descibe, Integer eid) {
        questionDatabase.update_des(descibe, eid);
    }

    public void changeQuestion_key(String key, Integer eid) {
        questionDatabase.update_key(key, eid);
    }

    public List<Question> likeFind(String s) {
        return questionDatabase.like_find(s);
    }

    public Question findQuestionById(Integer id) {
        return questionDatabase.findQuestionById(id);
    }

    public void updateQuestion(Question question){
        questionDatabase.updateQuestion(question);
    }
}
