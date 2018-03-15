package com.example.demo.repository;

import com.example.demo.model.User;
import com.example.demo.model.UserType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {

    User findOneByEmail(String email);

    User findAllByUserType(UserType usertype);
}
