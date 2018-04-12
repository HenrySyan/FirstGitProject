package com.example.demo.controller;


import com.example.demo.repository.*;
import com.example.demo.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@Controller
public class HomeController {

    @Autowired
    private SecondaryCategoryRepository secondaryCategoryRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private BrandRepository brandRepository;

    @Autowired
    private SliderInfoRepository sliderInfoRepository;

    @Autowired
    private NewReleaseRepository newReleaseRepository;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "redirect:/home";
    }


    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String messaage(ModelMap map) {
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("categorys", categoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("sliderInfo", sliderInfoRepository.findAll());
        map.addAttribute("newReleases",newReleaseRepository.findAll());
        return "home";
    }



}
