package com.example.demo.repository;


import com.example.demo.model.BagIttem;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BagIttemRepository extends JpaRepository<BagIttem,Integer> {


    List<BagIttem> findAllByUser(User user);
}
