package com.example.demo.repository;

import com.example.demo.model.ProductComment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductCommentRepository extends JpaRepository<ProductComment,Integer> {

    List<ProductComment> findAllByProductId(int id);
}
