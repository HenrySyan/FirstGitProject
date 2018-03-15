package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;


import javax.persistence.*;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "post")
@Entity
public class Post {
    @Id
    @GeneratedValue
    @Column
    private int id;
    @Column(name = "title")
    private String title;
    @Column
    private String description;
    @Column(name = "pic_url")
    private String picUrl;
    @ManyToOne
    private User user;

}
