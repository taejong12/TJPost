package com.board.tjpost.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	// HTTP 보안 설정
	// SecurityFilterChain

	// 1.Spring Security 5.x+ 에서는 SecurityFilterChain을 사용하여 HTTP 보안 설정을 정의합니다.
	// http.build()를 사용하여 SecurityFilterChain을 반환해야 합니다.

	// 2.UserDetailsService 및 passwordEncoder
	// 사용자 인증을 위한 UserDetailsService와 PasswordEncoder를 각각 @Bean으로 등록하여 인메모리 인증을
	// 설정합니다.

	// 3.formLogin() 및 logout() 설정
	// 로그인 및 로그아웃 페이지를 설정합니다.

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

		// authorizeHttpRequests()는 **Spring Security 6.1+**에서 deprecated 되었지만, 여전히 사용할
		// 수 있으며,
		// 새로운 함수형 스타일을 통해 설정을 작성하는 것이 권장됩니다.
		// 즉, http.authorizeHttpRequests(requests -> requests...) 형태로 설정해야 합니다.
		// 이 방식은 향후 확장성과 유연성을 더 제공합니다. Spring Security의 다른 부분들도 함수형 스타일로 변환되고 있으니 참고

		// formLogin(), and(), logout() 메서드도 deprecated(사용 중지 예정)으로 함수형 스타일로 설정을 작성해야 하며,
		// formLogin()과 logout() 대신 HTTP 보안 구성을 더 세밀하게 처리하는 방법을 사용해야 합니다.
		// formLogin()과 logout() 메서드는 이제 체이닝 방식으로 사용되며,
		// 각 메서드에 람다 표현식을 사용하여 로그인 페이지 경로와 로그아웃 설정을 명시적으로 지정합니다.
		
		http.authorizeHttpRequests(requests -> requests
				// 로그인, 회원가입, 홈은 누구나 접근 가능
				.requestMatchers("/member/login", "/member/join", "/").permitAll()
				// /admin/** 경로는 ADMIN 권한을 가진 사용자만 접근 가능
				.requestMatchers("/admin/**").hasRole("ADMIN")
				// 나머지 경로는 인증된 사용자만 접근 가능
				.anyRequest().authenticated())

				// 로그인 설정
				.formLogin(form -> form
						// 로그인 페이지 경로 설정
						.loginPage("/member/login")
						// 로그인 성공 시 이동
						.defaultSuccessUrl("/", true)
						// 관리자
						.defaultSuccessUrl("/admin", true)						
						// 로그인 페이지는 누구나 접근 가능
						.permitAll())
				
				// 로그아웃 설정
				.logout(logout -> logout
						// 로그아웃 성공 시 해당 url로 이동
						.logoutSuccessUrl("/member/login")
						// 로그아웃은 누구나 가능
						.permitAll());
		// .build(): 설정한 정보를 바탕으로 객체를 생성
		return http.build();
	}
	
	// 비밀번호 암호화 (BCrypt 사용)
	// 예: "password" → $2a$10$E9F... 처럼 해시 값으로 저장됩니다.
	// Spring Security는 로그인 시 사용자가 입력한 비밀번호를 BCrypt 방식으로 암호화한 후 비교합니다.
	@Bean
	public PasswordEncoder passwordEncoder() {	
		return new BCryptPasswordEncoder();
	}
	
	// In-memory 사용자 설정
	
	// 1.InMemoryUserDetailsManager
	// Spring Security에서 메모리 내에 사용자 정보를 저장하고 관리하는 클래스입니다.
	// 애플리케이션 구동 시 메모리에 저장되며, DB 연동 없이 테스트나 간단한 애플리케이션에 주로 사용됩니다.
	// 서버 재시작 시 사용자 정보는 초기화됩니다.
	
	// InMemoryUserDetailsManager는 UserDetails 객체를 받아 사용자 인증에 사용합니다.
	// User.withUsername() 메서드를 사용해 사용자 정보(UserDetails)를 생성합니다.
	// BCrypt로 비밀번호를 암호화합니다.
	// roles() 메서드로 권한(Role)을 부여합니다.
	
//	@Bean
//	public UserDetailsService userDetailsService() {
//		// 사용자 이름, 비밀번호 설정
//		User.UserBuilder users = User.withUsername("user").password(passwordEncoder().encode("password")).roles("USER");
//		return new InMemoryUserDetailsManager(users.build());
//	}

	
	
}
