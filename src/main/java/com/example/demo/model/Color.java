package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "color")
@Entity
public class Color {

    @Id
    @GeneratedValue
    @Column
    private int id;

    @Column
    @NotEmpty(message = "name can not be empty")
    private String name;

//    @ManyToMany(mappedBy = "colors")
//    private Set<Product> products;


}
