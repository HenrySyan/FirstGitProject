package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "product_picture")
@Entity
public class ProductPicture {
    @Id
    @GeneratedValue
    @Column
    private int id;

    @Column(name = "pic_url")
    private String picUrl;

    @ManyToOne
    private Product product;
}
