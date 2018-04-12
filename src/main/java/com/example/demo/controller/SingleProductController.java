package com.example.demo.controller;


import com.example.demo.model.BagIttem;
import com.example.demo.model.Product;
import com.example.demo.model.ProductComment;
import com.example.demo.model.Tag;
import com.example.demo.repository.*;
import com.example.demo.security.CurrentUser;
import org.hibernate.mapping.Bag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class SingleProductController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SecondaryCategoryRepository secondaryCategoryRepository;

    @Autowired
    private BrandRepository brandRepository;

    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private ProductPictureRepository productPictureRepository;

    @Autowired
    private ProductCommentRepository productCommentRepository;

    @Autowired
    private BagIttemRepository bagIttemRepository;


    @GetMapping(value = "/singleProduct")
    public String singleProduct(ModelMap map, @RequestParam("productid") int id) {
       map.addAttribute("product", productRepository.findOneById(id));
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("tags", tagRepository.findAll());
        map.addAttribute("productPictures",productPictureRepository.findAllByProductId(id));
        map.addAttribute("productComment",new ProductComment());
        map.addAttribute("productComments",productCommentRepository.findAllByProductId(id));
        map.addAttribute("bagIttem",new BagIttem());
        return "productsingle";
    }

    @PostMapping(value = "/addComment")
    public String addComment(@RequestParam("product")Product product,
                             @Valid @ModelAttribute("productComment") ProductComment productComment){
        productComment.setProduct(product);
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        productComment.setUser(principal.getUser());
        productCommentRepository.save(productComment);
        return "redirect:/home";
    }

    @PostMapping(value = "addToCart")
    public String addToCart(@Valid @ModelAttribute("bagittem") BagIttem bagIttem,
                            @RequestParam("products") Product product){
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        bagIttem.setUser(principal.getUser());
        bagIttem.setProduct(product);
        bagIttemRepository.save(bagIttem);
        return "redirect:/checkoutpage";
    }
}
