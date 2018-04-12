package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "slider_info")
@Entity
public class SliderInfo {

    @Id
    @GeneratedValue
    @Column
    private int id;
    @Column

    private String title;

    @Column
    private String description;
}
