package com.example.lab6_inventario.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "inventario")
public class Inventario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idinventario")
    private int idinventario;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    @Digits(integer = 10,fraction = 0)
    @Max(value = 32767)
    @Min(value = 0)
    private int cantidad;


}
