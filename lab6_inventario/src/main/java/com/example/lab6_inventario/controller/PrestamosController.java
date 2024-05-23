package com.example.lab6_inventario.controller;

import com.example.lab6_inventario.repository.InventarioRepository;
import com.example.lab6_inventario.repository.PrestamosRepository;
import com.example.lab6_inventario.repository.UsuarioRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prestamos")
public class PrestamosController {

    final UsuarioRepository usuarioRepository;
    final InventarioRepository inventarioRepository;
    final PrestamosRepository prestamosRepository;

    public PrestamosController(UsuarioRepository usuarioRepository, InventarioRepository inventarioRepository, PrestamosRepository prestamosRepository) {
        this.usuarioRepository = usuarioRepository;
        this.inventarioRepository = inventarioRepository;
        this.prestamosRepository = prestamosRepository;
    }

    @GetMapping(value = {"", "/", "list"})
    public String listarDispositivos(Model model) {
        model.addAttribute("reservaslist", prestamosRepository.obtenerListadoReservas());
        return "reservas";
    }
}
