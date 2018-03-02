package com.example.demo.repository;


import com.example.demo.model.ProductPicture;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductPictureRepository extends JpaRepository<ProductPicture,Integer> {
}
