2025.1.20(월) ~ 메이븐 환경설정 시작(라이브러리 추가(오라클 JDBC/Mybatis))

스프링부트를 사용하지 않고 스프링프레임워크로 구현할 예정(나중에는 스프링부트도 사용할 예정)

main/resources/xsd/spring-beans.xsd 설정하는 방법
문제: spring-beans.xsd 파일을 인터넷에서 불러오지 못해서 에러발생

해당 spring-beans를 추가하는 이유
1.DB 연동을 하기 위한 Bean 생성
2.Mybatis 사용하기 위한 설정

해당 에러를 해결하는 방법
1.Maven 의존성 추가 확인 spring-beans/spring-context 2개 라이브러리 의존성 추가
2.인터넷에서 다운로드를 차단한 환경에서는 로컬 경로를 사용. 로컬 경로로 XSD를 설정하려면 file:을 사용해야 함
file:/C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/xsd/spring-beans.xsd 해당 부분을 자기 로컬 경로에 맞게 수정
3.https://github.com/spring-projects/spring-framework 해당 주소 GitHub에서 최신 Spring XSD 파일 다운로드
spring-beans/src/main/resources/org/springframework/beans/factory/xml/spring-beans.xsd 해당 경로에 파일 위치
이러면 문제해결이 된다


main/resources/dtd/mybatis-3-mapper.dtd 설정하는 방법
문제: mybatis-3-mapper.dtd 파일을 인터넷에서 불러오지 못해서 에러발생

인터넷에서 불러오지 못하는건 보안 문제로 막아놓은 것 같다

그래서 해당 로컬에 파일을 다운로드 받아서 경로 설정을 해줘야 함.

MyBatis Mapper DTD 파일 주소: https://raw.githubusercontent.com/mybatis/mybatis-3/master/src/main/resources/org/apache/ibatis/builder/xml/mybatis-3-mapper.dtd

file:/C:/Users/dbxow/git/TJPost/TJPost/src/main/resources/dtd/mybatis-3-mapper.dtd 로컬 경로 설정

=====================================================================================================================================================================

2025.1.23 Bean 으로 설정하다가는 게시판 만들기 전에 끝날 것 같아서 스프링부트로 버전을 변경해서 작업하기로 결정

개발 환경

1.IDE: Eclipse IDE for Java Developers (includes Incubating components) Version: 2024-12 (4.34.0)
2.Spring Boot 3.1.4
3.JDK 17
4.Builder: apache-maven-3.9.9
5.sqldeveloper
6.OracleXE213_Win64
7.apache-tomcat-10.1.34
8.JSP
9.mybatis

게시판 주요기능


