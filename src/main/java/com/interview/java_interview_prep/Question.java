package com.interview.java_interview_prep;

public class Question {
    private Long id;
    private String question;
    private String answer;

    public Question(long id, String question, String answer) {
        this.id = id;
        this.question = question;
        this.answer = answer;
    }

    public Long getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }
    public String getAnswer () {
    return answer;
    }
}