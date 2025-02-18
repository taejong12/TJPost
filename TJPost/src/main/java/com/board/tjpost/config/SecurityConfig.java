package com.board.tjpost.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import jakarta.servlet.DispatcherType;

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

		// formLogin(), and(), logout() 메서드도 deprecated(사용 중지 예정)으로 함수형 스타일로 설정을 작성해야
		// 하며,
		// formLogin()과 logout() 대신 HTTP 보안 구성을 더 세밀하게 처리하는 방법을 사용해야 합니다.
		// formLogin()과 logout() 메서드는 이제 체이닝 방식으로 사용되며,
		// 각 메서드에 람다 표현식을 사용하여 로그인 페이지 경로와 로그아웃 설정을 명시적으로 지정합니다.

		http.authorizeHttpRequests(requests -> requests
						//index가 보안 문제에 걸림 이걸로 해결
						.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
						// 페이지 접근 경로
						.requestMatchers( new AntPathRequestMatcher("/")
									,new AntPathRequestMatcher("/member/join")
									,new AntPathRequestMatcher("/member/login")
									,new AntPathRequestMatcher("/member/logout")									
									,new AntPathRequestMatcher("/board/list")
									,new AntPathRequestMatcher("/member/memberIdCheck")
									,new AntPathRequestMatcher("/resources/**")).permitAll()
						// /admin/** 경로는 ADMIN 권한을 가진 사용자만 접근 가능
						.requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("ADMIN")
						// 나머지 경로는 인증된 사용자만 접근 가능
						.anyRequest().authenticated())

				// 로그인 설정
				.formLogin(form -> form
						// 로그인 페이지 경로 설정
						.loginPage("/member/login")
						.usernameParameter("memberId")
						.passwordParameter("memberPassword")
						// 로그인 성공 시 이동
						.defaultSuccessUrl("/", true)
						// 로그인 페이지는 누구나 접근 가능
						.permitAll())

				// 로그아웃 설정
				.logout(logout -> logout
						.logoutRequestMatcher(new AntPathRequestMatcher("/member/logout", "GET"))
						// 로그아웃 성공 시 해당 url로 이동
			            .logoutSuccessUrl("/member/login")
			            .deleteCookies("JSESSIONID")
						// 로그아웃은 누구나 가능
						.permitAll());

		// .build(): 설정한 정보를 바탕으로 객체를 생성
		return http.build();
	}

	// 비밀번호 암호화 (BCrypt 사용)
	// 예: "password" → $2a$10$E9F... 처럼 해시 값으로 저장됩니다.
	// Spring Security는 로그인 시 사용자가 입력한 비밀번호를 BCrypt 방식으로 암호화한 후 비교합니다.
	// 회원 가입 시
	// 사용자가 입력한 비밀번호를 PasswrdEncoder로 인코딩합니다.
	// 인코딩된 비밀번호를 DB에 저장합니다.

	// 로그인 시
	// 사용자가 입력한 비밀번호를 다시 인코딩합니다.
	// DB에 저장된 인코딩된 비밀번호와 비교하여 인증합니다.
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// AuthenticationManager 는 사용자의 인증을 담당하는 Spring Security의 핵심 컴포넌트입니다.
	// Spring Security에 커스터마이징한 인증 로직을 적용하기 위해 AuthenticationManager를 Bean으로 등록하고
	// 있습니다.
	// AuthenticationManager 가 하는 역할은?
	// 사용자의 아이디와 비밀번호가 올바른지 검증합니다.
	// UserDetailsService에서 사용자 정보를 가져와 인증합니다.
	// 비밀번호가 올바른 경우 인증된 사용자 객체(Authentication)를 반환합니다.
	// UserDetailsService와 DB 연동
	// AuthenticationManager 는 직접 DB에서 사용자 정보를 가져오는 게 아니라, UserDetailsService를
	// 통해가져옵니다
	// UserDetailsService는 DB에서 사용자 정보를 조회하고, UserDetails 객체로 반환합니다.

	// 작동 순서
	// 사용자가 로그인 시도 (member 와 password 입력)
	// AuthenticationManager 가 UserDetailsService 호출
	// UserDetailsService는 DB에서 사용자 정보를 조회합니다.
	// UserDetailsService는 조회한 사용자 정보를 UserDetails 객체에 저장하여 반환
	// AuthenticationManager는 UserDetails 객체의 비밀번호화 사용자가 입력한 비밀번호를 비교
	// 비밀번호가 일치하면 인증 성공
	// 인증된 사용자 정보가 SecurityContextHolder에 저장됩니다.
	// 비밀번호가 일치하지 않으면 인증 실패

	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
		return authConfig.getAuthenticationManager();
	}

}
