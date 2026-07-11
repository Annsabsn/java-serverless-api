package com.example.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class ApiController {

    @GetMapping("/")
    public Map<String, String> home() {

        return Map.of(
                "message", "Java API Version 1",
                "status", "Running"
        );
    }

    @GetMapping("/hello")
    public Map<String, String> hello() {

        return Map.of(
                "message", "Hello from AWS Lambda"
        );
    }
}