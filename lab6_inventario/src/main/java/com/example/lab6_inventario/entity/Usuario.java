package com.example.lab6_inventario.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "usuario")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idusuario")
    private int idusuario;

    @Column(name = "rol_idrol")
    private Integer rol;

    @Column(nullable = false)
    private String nombre;

    @Column(nullable = false)
    private String apellido;


    @Size(max = 100)
    @NotNull
    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Size(max = 100)
    @NotNull
    @Column(name = "pwd", nullable = false, length = 100)
    private String pwd;

    @OneToOne
    @JoinColumn(name = "profesor")
    private Usuario profesor;



}
