package com.board.tjpost;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

// Spring Boot 애플리케이션을 설정하는 기본적인 클래스
// @SpringBootApplication 애너테이션을 사용하여 애플리케이션을 시작하는데 필요한 설정을 자동으로 처리하고, SpringBootServletInitializer 클래스를 확장하여 WAR 파일로 배포할 때도 애플리케이션이 제대로 작동하도록 설정합니다. 
// @SpringBootApplication 는 Spring Boot 애플리케이션의 시작점을 나타냅니다.
// 여러 가지 주요 애너테이션을 결합한 것과 동일합니다.
// @EnableAutoConfiguration: Spring Boot의 자동 설정을 활성화합니다.
// @ComponentScan: 애플리케이션의 패키지 내에서 컴포넌트를 스캔하고, 이를 Spring 컨테이너에 자동으로 등록합니다.
// @Configuration: Java 기반의 설정 클래스를 정의합니다.
// SpringBootServletInitializer 를 상속받은 클래스는 WAR 파일로 배포할 때, 서블릿 컨테이너에 배포될 수 있도록 설정됩니다.
// WAR 파일로 배포할 때 필요한 설정입니다.
// 기본적으로 Spring Boot 애플리케이션은 JAR 파일로 배포되며, 내장 톰캣 서버를 사용합니다.
// 그러나 외부 톰캣 서버에 배포할 경우에는 WAR 파일로 배포해야 합니다.
// 이때 SpringBootServletInitializer 클래스를 상속받고 configure() 메서드를 오버라이드하여 WAR 파일로 배포할 수 있도록 설정합니다.

@SpringBootApplication
public class TJPostApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		// SpringApplication.run()을 사용하여 Spring Boot 애플리케이션을 실행하는 대신, configure() 메서드를
		// 통해 애플리케이션을 초기화하는 방식으로 동작합니다.
		SpringApplication.run(TJPostApplication.class, args);
		System.out.println("#### jar 내장 톰캣 사용 ####");
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		System.out.println("#### war 패키징 외장 톰캣 사용 ####");
		return builder.sources(TJPostApplication.class);
	}

}