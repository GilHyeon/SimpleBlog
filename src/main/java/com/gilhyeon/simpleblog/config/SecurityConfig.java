package com.gilhyeon.simpleblog.config;

import com.gilhyeon.simpleblog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.header.writers.StaticHeadersWriter;

/**
 * Created by gilhyeon on 2017. 5. 19..
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
    @Autowired
    private UserRepository userRepository;

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        //h2-console에 접속하기 위한 설정
        /*
        http
                .headers()
                    .frameOptions().disable();
        http
                .csrf()
                    .ignoringAntMatchers("/h2-console*//**");
        */
        // 기본 블로그는 누구나 접속할 수 있게한다
        // 권한체크가 필요한 url은 Controller에서 @Secured 어노테이션으로 관리한다.
        http
                .authorizeRequests()
                    .antMatchers("/").permitAll();

        // 로그인페이지를 설정한다.
        http
                .formLogin()
                    .loginPage("/login")
                    .failureUrl("/login?error=true")
        ;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(new UserDetailsService() {
            @Override
            public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
                return userRepository.findOne(username);
            }
        });
    }
}
