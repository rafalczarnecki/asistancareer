package com.interview.java_interview_prep;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:5173")
public class TestController {

    @GetMapping("/hello")
    public String hello() {

        return "Hello from Spring Boot!";
    }


    @GetMapping("/question")
    public Question getQuestion() {
        return new Question(1L, "Co to jest JVM", "Java Virtual Machine - wirtualna maszyna która wykonuje kod Java");
    }
}
