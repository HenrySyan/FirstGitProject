package com.example.demo.repository;


import com.example.demo.model.Product;

import com.example.demo.model.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findAllByCategoryId(int id);

    List<Product> findAllBySecondaryCategoryId(int id);

    List<Product> findAllByBrandId(int id);

    List<Product> findAllByCategoryIdAndSecondaryCategoryId(int firstId, int secondId);

    List<Product> findAllByTags(Tag tag);

    Product findOneById(int id);

    List<Product> findAllByNameLike(String name);
}

