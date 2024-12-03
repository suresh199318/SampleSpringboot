package com.example.helloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HelloWorldApplication {

    // Example of dead code that will generate a warning in SonarQube
    private void unusedMethod() {
        System.out.println("This method is never used!");
    }
    
    public static void main(String[] args) {
        SpringApplication.run(HelloWorldApplication.class, args);
    }

}
