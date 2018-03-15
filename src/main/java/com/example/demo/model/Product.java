package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Set;

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
    @NotNull
    private int price;

    @ManyToOne
    private Category category;

    @ManyToMany
    @JoinTable(name = "temp_tag", joinColumns = @JoinColumn(name = "first_id",referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "second_id", referencedColumnName = "id"))
    private Set<Tag> tags;


    @ManyToMany
    @JoinTable(name = "temp_size", joinColumns = @JoinColumn(name = "first_id",referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "second_id", referencedColumnName = "id"))
    private Set<Size> sizes;


    @ManyToMany
    @JoinTable(name = "temp_color", joinColumns = @JoinColumn(name = "first_id",referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "second_id", referencedColumnName = "id"))
    private Set<Color> colors;

    @ManyToOne
    private User user;

}

