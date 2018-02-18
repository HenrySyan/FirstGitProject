package com.example.demo.controller;


import com.example.demo.model.Author;
import com.example.demo.repository.AuthorRepository;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;


@Controller
public class AdminController {

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private BookRepository bookRepository;

    @RequestMapping(value = "/adminpage", method = RequestMethod.GET)
    public String maina(ModelMap map, @RequestParam(value = "message", required = false)String message) {
        map.addAttribute("author", new Author());
        map.addAttribute("message", message != null ? message : "Welcome");
        return "admin";
    }

    @PostMapping("/addAuthor")
    public String addAuthor(@Valid @ModelAttribute("author") Author author, BindingResult result, @RequestParam("picture") MultipartFile multipartFile) throws IOException {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/adminpage?message=" + sb.toString();
        }
        String picName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File("D:\\mvc\\" + picName);
        multipartFile.transferTo(file);
        author.setPicUrl(picName);
        authorRepository.save(author);
        return "redirect:/adminpage";

    }


}
