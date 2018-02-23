package com.example.demo.security;

import com.example.demo.model.Author;
import com.example.demo.model.UserType;

import org.springframework.security.core.authority.AuthorityUtils;



public class CurrentUser extends org.springframework.security.core.userdetails.User {

    private Author author;

    public CurrentUser(Author author) {
        super(author.getEmail(), author.getPassword(), AuthorityUtils.createAuthorityList(author.getUserType().name()));
        this.author = author;
    }

    public Author getUser() {
        return author;
    }

    public int getId() {
        return author.getId();
    }

    public UserType getRole() {
        return author.getUserType();
    }
}
