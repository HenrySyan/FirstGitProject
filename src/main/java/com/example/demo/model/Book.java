package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "book")
@Entity
public class Book {
    @Id
    @GeneratedValue
    @Column
    private int id;
    @Column
    private String name;
    @Column
    private String description;
    @Column(name = "pic_url")
    private String picUrl;
    @ManyToOne
    private Author author;

}
