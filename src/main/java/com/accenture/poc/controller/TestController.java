package com.accenture.poc.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @RequestMapping("/health")
    public String healthCheck(){
        return "Controller is OK";
    }
}
