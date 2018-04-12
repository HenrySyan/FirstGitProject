package com.example.demo.repository;

import com.example.demo.model.SecondaryCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SecondaryCategoryRepository extends JpaRepository<SecondaryCategory, Integer> {
}
