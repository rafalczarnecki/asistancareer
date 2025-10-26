package com.interview.java_interview_prep;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;


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

    @GetMapping("/questions")
    public List<Question> getQuestions() {
        return List.of(
                new Question(1L, "Co to jest JWM?", "Java Virtuall Maschine - wirtualna maszyna która wykonuje kod Java"),
                new Question(2L, "Czym różni się JDK od JRE", "JDK to Java Development Kit (narzędzia + JRE), JRE to Java Runtime Environement (tylko uruchamianie)"),
                new Question(3L, "Co to jest enkapsulacja?", "Ukrywanie wewnętrznej implementacji i udostępnianie publicznego interfejsu")
        );
    }
}
