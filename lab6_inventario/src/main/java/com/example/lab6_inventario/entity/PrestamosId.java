package com.example.lab6_inventario.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Embeddable
public class PrestamosId implements Serializable {
    @Column(name = "inventario_idinventario")
    private Integer idinventario;

    @Column(name = "usuario_idusuario")
    private Integer idusuario;
}
