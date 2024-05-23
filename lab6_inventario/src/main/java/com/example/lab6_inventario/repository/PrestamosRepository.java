package com.example.lab6_inventario.repository;

import com.example.lab6_inventario.entity.Prestamos;
import com.example.lab6_inventario.entity.PrestamosId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PrestamosRepository extends JpaRepository<Prestamos, PrestamosId> {

    @Query(value = "SELECT * FROM inventario.prestamos p INNER JOIN inventario.usuario u WHERE p.usuario_idusuario = u.idusuario;",
            nativeQuery = true)
    List<Prestamos> obtenerListadoReservas();

}
