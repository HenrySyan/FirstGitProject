package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "category")
@Entity
public class Category {

    @Id
    @GeneratedValue
    @Column
    private int id;

    @Column
    @NotEmpty(message = "name can not be empty")
    private String name;

}
