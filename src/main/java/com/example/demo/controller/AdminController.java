package com.example.demo.controller;


import com.example.demo.model.Author;
import com.example.demo.model.Book;
import com.example.demo.repository.AuthorRepository;
import com.example.demo.repository.BookRepository;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;


@Controller
public class AdminController {

    @Autowired
    private AuthorRepository authorRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/adminpage", method = RequestMethod.GET)
    public String maina(ModelMap map, @RequestParam(value = "message", required = false) String message) {
        map.addAttribute("author", new Author());
        map.addAttribute("book", new Book());
        map.addAttribute("message", message != null ? message : "Welcome");
        map.addAttribute("authors",authorRepository.findAll());
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
        author.setPassword(passwordEncoder.encode(author.getPassword()));
        authorRepository.save(author);
        return "redirect:/adminpage";

    }

    @PostMapping("/addBook")
    public String addBook(@Valid @ModelAttribute("book") Book book, @RequestParam("picture") MultipartFile multipartFile) throws IOException {
        String picName = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();
        File file = new File("D:\\mvc\\" + picName);
        multipartFile.transferTo(file);
        book.setPicUrl(picName);
        bookRepository.save(book);
        return "redirect:/adminpage";

    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream("D:\\mvc\\"+fileName);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }


}
