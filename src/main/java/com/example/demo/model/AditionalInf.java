package com.example.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "aditional_inf")
@Entity
public class AditionalInf {
    @Id
    @GeneratedValue
    @Column
    private int id;

    @Column
    @NotEmpty(message= "tag can not be empty")
    @ManyToOne
    @Enumerated(EnumType.STRING)
    private Size size;

    @Column
    @NotEmpty(message= "tag can not be empty")
    @ManyToOne
    private Color color;
}
