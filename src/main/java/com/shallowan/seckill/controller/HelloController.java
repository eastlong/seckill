package com.shallowan.seckill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: eastlong
 * @Date 2020/2/13
 * @function:
 **/
@Controller

public class HelloController {

    @RequestMapping("/hello")
    @ResponseBody
    public String hello(){
      return "Hello World";
    }
}
