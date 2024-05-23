package com.example.lab6_inventario.controller;

import com.example.lab6_inventario.repository.InventarioRepository;
import com.example.lab6_inventario.repository.UsuarioRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dispositivos")
public class DispositvosController {

    final UsuarioRepository usuarioRepository;
    final InventarioRepository inventarioRepository;

    public DispositvosController(UsuarioRepository usuarioRepository, InventarioRepository inventarioRepository) {
        this.usuarioRepository = usuarioRepository;
        this.inventarioRepository = inventarioRepository;
    }

    @GetMapping(value = {"", "/", "list"})
    public String listarDispositivos(Model model) {
        model.addAttribute("listaDispositivos", inventarioRepository.findAll());
        return "inventario";
    }
}
