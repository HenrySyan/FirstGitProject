package com.example.demo.repository;


import com.example.demo.model.ProductPicture;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductPictureRepository extends JpaRepository<ProductPicture,Integer> {

   List <ProductPicture> findAllByProductId(int id);
}
