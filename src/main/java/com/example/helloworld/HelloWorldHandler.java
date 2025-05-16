package com.example.helloworld;

import org.springframework.stereotype.Component;
import java.util.function.Function;

@Component
public class HelloWorldHandler implements Function<String, String> {
    @Override
    public String apply(String input) {
        return "Hello, " + input + "!";
    }
}
