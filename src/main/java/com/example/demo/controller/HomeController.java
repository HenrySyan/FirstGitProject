package com.example.demo.controller;



import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@Controller
public class HomeController {


    @Autowired
    private BookRepository bookRepository;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public  String booksList(ModelMap map){

        return "home";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "redirect:/home";
    }



}
