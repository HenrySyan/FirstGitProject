package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "size")
@Entity
public class Size {

    @Id
    @GeneratedValue
    @Column
    private int id;


    @Column(name = "size")
    @Enumerated(EnumType.STRING)
    private SizeVariations sizeVariations;

//    @ManyToMany(mappedBy = "sizes")
//    private Set<Product> products;


}
