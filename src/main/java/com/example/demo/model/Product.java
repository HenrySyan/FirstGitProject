package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "product")
@Entity
public class Product {

    @Id
    @GeneratedValue
    @Column
    private int id;

    @Column
    @NotEmpty(message = "name can not be empty")
    private String name;

    @Column
    @NotEmpty(message = "description can not be empty")
    private String description;

    @Column
    @NotEmpty(message= "category can not be empty")
    @ManyToOne
    private Category category;

    @Column
    @NotEmpty(message= "tag can not be empty")
    @ManyToOne
    private Tag tag;

    @Column
    @ManyToOne
    private ProductPicture productPicture;

    @Column
    @NotEmpty(message= "aditional information can not be empty")
    @ManyToOne
    private AditionalInf aditionalInf;

}

