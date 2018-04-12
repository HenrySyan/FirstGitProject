package com.example.demo.controller;

import com.example.demo.model.BagIttem;
import com.example.demo.model.Color;
import com.example.demo.model.Product;
import com.example.demo.model.Size;
import com.example.demo.repository.BagIttemRepository;
import com.example.demo.repository.BrandRepository;
import com.example.demo.repository.SecondaryCategoryRepository;
import com.example.demo.repository.TagRepository;
import com.example.demo.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CheckoutController {

    @Autowired
    private BagIttemRepository bagIttemRepository;
    @Autowired
    private SecondaryCategoryRepository secondaryCategoryRepository;
    @Autowired
    private BrandRepository brandRepository;
    @Autowired
    private TagRepository tagRepository;

    @RequestMapping(value = "/checkoutpage", method = RequestMethod.GET)
    public  String message(ModelMap map) {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("bagIttems",bagIttemRepository.findAllByUser(principal.getUser()));
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("tags",tagRepository.findAll());
        return "checkout";
    }
}
