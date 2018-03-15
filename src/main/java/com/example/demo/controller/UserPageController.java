package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserPageController {



    @RequestMapping(value = "/userpage", method = RequestMethod.GET)
    public  String message(ModelMap map){
        map.addAttribute("message","welcome");
        return "userpage";
    }
}
