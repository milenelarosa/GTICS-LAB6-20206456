package com.example.lab6_inventario.repository;

import com.example.lab6_inventario.entity.Prestamos;
import com.example.lab6_inventario.entity.PrestamosId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservasRepository extends JpaRepository<Prestamos, PrestamosId> {

}
