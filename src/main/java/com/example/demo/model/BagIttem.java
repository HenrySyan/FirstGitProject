package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "bag_ittem")
@Entity
public class BagIttem {


    @Id
    @GeneratedValue
    @Column
    private int id;

    @OneToOne
    User user;

    @OneToOne
    Product product;
}
