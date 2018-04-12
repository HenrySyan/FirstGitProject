package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "product_coment")
@Entity
public class ProductComment {

    @Id
    @GeneratedValue
    @Column
    private int id;

    @OneToOne
    private Product product;

    @OneToOne
    private User user;

    @Column(name = "timestamp")
    private Date date;

    @Column
    private String description;


}
