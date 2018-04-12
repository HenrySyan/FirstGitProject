package com.example.demo.controller;


import com.example.demo.model.*;
import com.example.demo.repository.*;
import com.example.demo.security.CurrentUser;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
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
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private TagRepository tagRepository;

    @Autowired
    private ColorRepository colorRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired

    private CategoryRepository categoryRepository;

    @Autowired
    private SizeRepository sizeRepository;

    @Autowired
    private ProductPictureRepository productPictureRepository;

    @Autowired
    private SecondaryCategoryRepository secondaryCategoryRepository;

    @Autowired

    private BrandRepository brandRepository;

    @Autowired

    private SliderInfoRepository sliderInfoRepository;

    @Autowired
    private NewReleaseRepository newReleaseRepository;



    @RequestMapping(value = "/adminpage", method = RequestMethod.GET)
    public String maina(ModelMap map, @RequestParam(value = "message", required = false) String message) {
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        map.addAttribute("currrentUser", principal);
        map.addAttribute("user", new User());
        map.addAttribute("message", message != null ? message : "Welcome");
        map.addAttribute("tag", new Tag());
        map.addAttribute("color",new Color());
        map.addAttribute("product",new Product());
        map.addAttribute("size",new Size());
        map.addAttribute("category",new Category());
        map.addAttribute("secondaryCategory",new SecondaryCategory());
        map.addAttribute("users", userRepository.findAll());
        map.addAttribute("categorys",categoryRepository.findAll());
        map.addAttribute("secondaryCategorys",secondaryCategoryRepository.findAll());
        map.addAttribute("tags",tagRepository.findAll());
        map.addAttribute("sizes",sizeRepository.findAll());
        map.addAttribute("colors",colorRepository.findAll());
        map.addAttribute("productPicture",new ProductPicture());
        map.addAttribute("products",productRepository.findAll());
        map.addAttribute("brands",brandRepository.findAll());
        map.addAttribute("brand",new Brand());
        map.addAttribute("sliderInfo",new SliderInfo());
        map.addAttribute("newRelease",new NewRelease());
        return "admin";
    }

    @PostMapping("/addSliderInfo")
    public String addUser(@Valid @ModelAttribute("sliderInfo") SliderInfo sliderInfo, BindingResult result) {
        StringBuilder sb = new StringBuilder();
        if (result.hasErrors()) {
            for (ObjectError objectError : result.getAllErrors()) {
                sb.append(objectError.getDefaultMessage() + "<br>");
            }
            return "redirect:/adminpage?message=" + sb.toString();
        }
        sliderInfoRepository.save(sliderInfo);
        return "redirect:/adminpage";

    }

    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream("D:\\mvc\\" + fileName);
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }


    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") int id) {
        userRepository.delete(id);
        return "redirect:/adminpage";
    }

    @PostMapping("/addTag")
    public String addTag(@Valid @ModelAttribute("tag") Tag tag){
        tagRepository.save(tag);
        return "redirect:/adminpage";
    }
    @PostMapping("/addColor")
    public String addColor(@Valid @ModelAttribute("color") Color color){
        colorRepository.save(color);
        return "redirect:/adminpage";
    }

    @PostMapping("/addBrand")
    public String addCategory(@Valid @ModelAttribute("brand") Brand brand){
        brandRepository.save(brand);
        return "redirect:/adminpage";
    }

    @PostMapping("/addSecondaryCategory")
    public String addSecondaryCategory(@Valid @ModelAttribute("secondaryCategory") SecondaryCategory secondaryCategory){
        secondaryCategoryRepository.save(secondaryCategory);
        return "redirect:/adminpage";
    }

    @PostMapping("/addProduct")
    public String addProduct(@Valid @ModelAttribute("product") Product product, @Valid @ModelAttribute("productPicture") ProductPicture productPicture,
                             BindingResult result, @RequestParam("picture") MultipartFile multipartFile) throws IOException {
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
        product.setPicUrl(picName);
        CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        product.setUser(principal.getUser());
        productRepository.save(product);
        return "redirect:/adminpage";
    }

    @PostMapping("/addPhotosToProduct")
    public String addPhotos(@Valid @ModelAttribute("productPicture") ProductPicture productPicture,
                            BindingResult result, @RequestParam("picture") MultipartFile multipartFile)throws IOException{

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
        productPicture.setPicUrl(picName);
        productPictureRepository.save(productPicture);
        return "redirect:/adminpage";
    }

@PostMapping("/addNewRelease")
    public String addNewRelease(@Valid @ModelAttribute("newRelease") NewRelease newRelease,
                                @RequestParam("picture") MultipartFile multipartFile) throws IOException {

    String picName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
    File file = new File("D:\\mvc\\" + picName);
    multipartFile.transferTo(file);
    newRelease.setPicUrl(picName);
    newReleaseRepository.save(newRelease);
    return "redirect:/adminpage";
}

}
