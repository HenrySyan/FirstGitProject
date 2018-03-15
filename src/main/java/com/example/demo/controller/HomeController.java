package com.example.demo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@Controller
public class HomeController {


    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String messaage(ModelMap map) {
        map.addAttribute("message", "new message");
        return "home";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "redirect:/home";
    }


}
