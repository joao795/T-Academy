package br.com.projeto.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
    //método para validar requisições e rotas
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http 
        .httpBasic()
        .and()
        .authorizeHttpRequests().anyRequest().authenticated();

        return http.build();
    }

    //método para permitir acesso sem precisar de autenticação
    @Bean
    public webSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().antMatchers("/");
    }

    /* 
    //criação de crendenciais em memória
    @Bean
    public UserDetailsService users() {
        //criar usuário do tipo administrador
        UserDetails admin = User.builder()
        .username("admin")
        .password(passwordEncoder().encode("123"))
        .roles("ADMIN")
        .build();

        //criar usuário do tipo simples
        UserDetails user = User.builder()
        .username("user")
        .password(passwordEncoder().encode("abc"))
        .roles("USER")
        .build();

        new InMemoryUserDetailsManager(admin, user);
    }
    */
    //criptografat senha
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
