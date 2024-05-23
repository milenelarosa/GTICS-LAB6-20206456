package com.example.lab6_inventario.config;

import com.example.lab6_inventario.repository.UsuarioRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
public class SecurityConfig {

    final DataSource dataSource;
    final
    UsuarioRepository usuarioRepository;

    public SecurityConfig(DataSource dataSource, UsuarioRepository usuarioRepository) {
        this.dataSource = dataSource;
        this.usuarioRepository = usuarioRepository;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/processLogin")
                .usernameParameter("email")
                .passwordParameter("contrasenia")
                .successHandler((request, response, authentication) -> {

                    HttpSession session = request.getSession();
                    session.setAttribute("usuario",usuarioRepository.findByEmail(authentication.getName()));

                    String rol = "";
                    for(GrantedAuthority role : authentication.getAuthorities()){
                        rol = role.getAuthority();
                        break;
                    }

                    if(rol.equals("ADMIN")){
                        response.sendRedirect("/dispositivos");
                    }else{
                        response.sendRedirect("/dispositivos");
                    }

                });

        http.authorizeHttpRequests()
                .requestMatchers("/dispositivos", "/dispositivos/**").hasAnyAuthority("ADMIN", "ALUMNO", "PROFESOR")
                .requestMatchers("/prestamos", "/prestamos/**").hasAnyAuthority("PROFESOR")
                .requestMatchers("/reservas", "/reservas/**").hasAnyAuthority("ALUMNO")
                .anyRequest().permitAll();

        http.logout().logoutSuccessUrl("/").deleteCookies("JSESSIONID")
                .invalidateHttpSession(true);

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsManager users(DataSource dataSource) {
        JdbcUserDetailsManager jdbc = new JdbcUserDetailsManager(dataSource);

        String sql1 = "SELECT correo, contrasena  FROM inventario.usuario WHERE correo = ?";
        String sql2 = "SELECT u.correo, r.nombre FROM inventario.usuario u INNER JOIN inventario.rol r ON (u.rol_idrol = r.idrol) WHERE u.correo = ?";

        jdbc.setUsersByUsernameQuery(sql1);
        jdbc.setAuthoritiesByUsernameQuery(sql2);
        return jdbc;
    }
}
