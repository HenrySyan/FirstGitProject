package com.example.demo.controller;



import com.example.demo.model.Tag;
import com.example.demo.repository.BrandRepository;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.SecondaryCategoryRepository;
import com.example.demo.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;


@Controller
public class ProductPageController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private SecondaryCategoryRepository secondaryCategoryRepository;

    @Autowired
    private BrandRepository brandRepository;

    @Autowired

    private TagRepository tagRepository;


    @GetMapping(value = "/productpage")
    public String products(ModelMap map, @RequestParam("id") int id) {
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts",productRepository.findAllBySecondaryCategoryId(id));
        map.addAttribute("tags",tagRepository.findAll());
        return "products";
    }

    @GetMapping(value="/getProductsByBrand")
    public String productsByBrand(ModelMap map,@RequestParam("brandId") int brandId){
        map.addAttribute("curnetProducts",productRepository.findAllByBrandId(brandId));
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("tags",tagRepository.findAll());
        return "products";
    }

    @GetMapping(value="/getProductByTag")
    public String productsByTags(ModelMap map, @RequestParam("tag") Tag tag){
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("tags",tagRepository.findAll());
        map.addAttribute("curnetProducts",productRepository.findAllByTags(tag));
        return "products";
    }

    @GetMapping(value="/getMensProducts")
    public String men(ModelMap map,@RequestParam("id") int id){
        map.addAttribute("ManProducts", productRepository.findAllByCategoryId(4));
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts",productRepository.findAllByCategoryIdAndSecondaryCategoryId(4,id));
        map.addAttribute("tags",tagRepository.findAll());
        return "products";
    }

    @GetMapping(value="/getWomansProducts")
    public String women(ModelMap map,@RequestParam("id") int id){
        map.addAttribute("ManProducts", productRepository.findAllByCategoryId(5));
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts",productRepository.findAllByCategoryIdAndSecondaryCategoryId(5,id));
        map.addAttribute("tags",tagRepository.findAll());
        return "products";
    }

    @GetMapping(value="/getKidsProducts")
    public String kids(ModelMap map,@RequestParam("id") int id){
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts",productRepository.findAllByCategoryIdAndSecondaryCategoryId(6,id));
        map.addAttribute("tags",tagRepository.findAll());
        return "products";
    }

    @GetMapping(value="/getMainManProducts")
    public String MainMan(ModelMap map){
        map.addAttribute("tags",tagRepository.findAll());
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts", productRepository.findAllByCategoryId(4));
        return "products";
    }
    @GetMapping(value="/getMainWomanProducts")
    public String MainWoman(ModelMap map){
        map.addAttribute("tags",tagRepository.findAll());
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts", productRepository.findAllByCategoryId(5));
        return "products";
    }
    @GetMapping(value="/getMainKidsProducts")
    public String Mainkit(ModelMap map){
        map.addAttribute("tags",tagRepository.findAll());
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts", productRepository.findAllByCategoryId(6));
        return "products";
    }

    @PostMapping(value = "/searchProduct")
    public String search(ModelMap map, @Valid @ModelAttribute("name")String name){
        map.addAttribute("tags",tagRepository.findAll());
        map.addAttribute("secondCategoryes", secondaryCategoryRepository.findAll());
        map.addAttribute("brands", brandRepository.findAll());
        map.addAttribute("curnetProducts", productRepository.findAllByNameLike(name));
        return "products";
    }
}
