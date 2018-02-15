package com.example.demo.controller;


import com.example.demo.model.Author;
import com.example.demo.repository.AuthorRepository;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;


@Controller
public class AdminController {

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private BookRepository bookRepository;

//    @PostMapping("/addAuthor")
//    public String addAuthor(@Valid @ModelAttribute("author") Author author, BindingResult result, @RequestParam("picture") MultipartFile multipartFile){
//
//
//    };


}
