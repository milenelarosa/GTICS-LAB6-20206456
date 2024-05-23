package com.example.lab6_inventario.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "prestamos")
public class Prestamos {
    @EmbeddedId
    private PrestamosId id;

    @MapsId("idinventario") //nombre del atributo clase compuesta
    @ManyToOne
    @JoinColumn(name="idinventario") //nombre del campo de la tabla sede_farmacista
    private Inventario idinventario; //nombre del atributo del id de la clase que se relaciona con esa columna

    @MapsId("idusuario") //nombre del atributo clase compuesta
    @ManyToOne
    @JoinColumn(name="idusuario") //nombre del campo de la tabla sede_farmacista
    private Usuario idusuario;

    @Column(name = "fechainicio")
    private LocalDateTime fechainicio;
    @Column(name = "fechafin")
    private LocalDateTime fechafin;

}
