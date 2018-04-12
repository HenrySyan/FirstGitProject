package com.example.demo.controller;

import com.example.demo.model.BagIttem;
import com.example.demo.model.User;
import com.example.demo.model.UserType;
import com.example.demo.repository.BrandRepository;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.SecondaryCategoryRepository;
import com.example.demo.repository.TagRepository;
import com.example.demo.security.CurrentUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @Autowired
    private BrandRepository brandRepository;

    @Autowired

    private SecondaryCategoryRepository secondaryCategoryRepository;

    @Autowired

    private TagRepository tagRepository;

    @RequestMapping(value = "/loginpage", method = RequestMethod.GET)
    public String login(ModelMap map) {
        map.addAttribute("user", new User());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("tags", tagRepository.findAll());
        return "login";
    }


    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSuccess() {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal.getUser().getUserType() == UserType.ADMIN) {
            return "redirect:/adminpage";
        }
        return "redirect:/userpage";
    }
}
