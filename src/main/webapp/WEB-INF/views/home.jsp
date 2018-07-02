<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@include file="include/header.jsp" %>
<body>
<h1>
	Hello world! 
	
	
	1.java 및 spring 버전 변경
	
	기본 환경

  - Spring Framework 3.1.1
  - java version 1.6
  - Maven compiler
    source 1.6
    target 1.6
  - servlet-api 2.5
  - jsp-api 2.1

 

변경 될 환경

  - Spring Framework 4.3.4
  - java version 1.8
  - Maven compiler
    source 1.8
    target 1.8
  - servlet-api 3.0
  - jsp-api 2.2

 

설정을 변경해 봅시다. pom.xml 을 수정합니다.

 

1. java version을 1.6 에서 1.8로 springframework 버전을 3.1.1로 4.3.4로 변경합니다.

<properties>
    <java-version>1.8</java-version>
    <org.springframework-version>4.3.4.RELEASE</org.springframework-version>
    <org.aspectj-version>1.6.10</org.aspectj-version>
    <org.slf4j-version>1.6.6</org.slf4j-version>
</properties>


2. Servlet api 버전을 2.5에서 3.0.1 로 변경합니다.   여기에서는 artifactId 도 servlet-api 에서 javax.servlet-api로 바꼈습니다.

<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.0.1</version>
    <scope>provided</scope>
</dependency>


3. jsp api 버전을 2.1에서 2.2로 변경합니다.

<dependency>
    <groupId>javax.servlet.jsp</groupId>
    <artifactId>jsp-api</artifactId>
    <version>2.2</version>
    <scope>provided</scope>
</dependency>


4. maven compiler 설정을 소스와 타겟을 1.8로 변경합니다.

<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>2.5.1</version>
    <configuration>
        <source>1.8</source>
        <target>1.8</target>
        <compilerArgument>-Xlint:all</compilerArgument>
        <showWarnings>true</showWarnings>
        <showDeprecation>true</showDeprecation>
    </configuration>
</plugin>
</h1>


web.xml페이지내 dtd변경

<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xmlns="http://java.sun.com/xml/ns/javaee"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         id="WebApp_ID" version="3.0">
</web-app>


 2. maven 변경설정 (완료)
 설정파일내 경로변경 및 환경설정내 해당 설정파일 연결
 
 3. git연동 (완료)
 - 환경 및 사용방법 정리
 - git repo 추가한 후, 경로 지정 및 계정연결
 --> team --> share project... --> 레퍼지토리 지정 후,  완료 
 --> add to index dlgn,  commit 하여 완료  
 <img src="/b2b_web/images/git1.png">
 <img src="/b2b_web/images/git2.png">
 
 commit and push = commit
 checkout
 
git fetch
git fetch 명령은 로컬 데이터베이스에 있는 것을 뺀 리모트 저장소의 모든 것을 가져온다.

리모트 저장소를 Pull 하거나 Fetch 하기에서 이 명령을 설명하고 리모트 브랜치에 보면 참고할 수 있는 예제가 더 있다.

프로젝트에 기여하기에도 좋은 예제가 많다.

Ref를 한 개만 가져오는 방법은 Pull Request의 Ref에서 설명하고 번들에서 가져오는 방법은 Bundle에서 설명한다.

Fetch 하는 기본 Refspec을 수정하는 방법은 Refspec에서 설명한다. 원하는 대로 수정할 수 있다.

git pull
git pull 명령은 git fetch 와 git merge 명령을 순서대로 실행하는 것뿐이다. 그래서 해당 리모트에서 Fetch 하고 즉시 현 브랜치로 Merge를 시도한다.

리모트 저장소를 Pull 하거나 Fetch 하기에서 이 명령을 사용하는 방법을 다뤘고 정확히 무엇을 Merge 하는 지는 리모트 저장소 살펴보기에서 설명한다.

Rebase 한 것을 다시 Rebase 하기에서 그 어렵다는 Rebase를 다루는 방법을 설명한다.

저장소 URL을 주고 한 번만 Pull 해 올 수 있다는 것을 리모트 브랜치로부터 통합하기에서 설명한다.

--verify-signatures 옵션을 주면 Pull 할 때 커밋의 PGP 서명을 검증한다. PGP 서명은 커밋에 서명하기에서 설명한다.

git push
git push 명령은 리모트에는 없지만, 로컬에는 있는 커밋을 계산하고 나서 그 차이만큼만 Push 한다. Push를 하려면 원격 저장소에 대한 쓰기 권한이 필요하고 인증돼야 한다.

리모트 저장소에 Push 하기에서 git push 명령으로 브랜치를 원격 저장소에 Push 하는 방법을 설명한다. 조금 깊게 브랜치를 하나씩 골라서 Push 하는 방법은 Push 하기에서 설명한다. 자동으로 Push 하도록 트래킹 브랜치를 설정하는 방법은 브랜치 추적에서 설명한다. git push --delete 명령으로 원격 서버의 브랜치를 삭제하는 방법은 리모트 브랜치 삭제에서 설명한다.

프로젝트에 기여하기에서는 `git push`를 주구장창 사용한다. 리모트를 여러 개 사용해서 브랜치에 작업한 내용을 공유하는 것을 보여준다.

--tags 옵션을 주고 태그를 Push 하는 방법은 태그 공유하기에서 설명한다.

서브모듈의 코드를 수정했을 때는 --recurse-submodules 옵션이 좋다. 프로젝트를 Push 할 때 서브모듈에 Push 할 게 있으면 서브모듈부터 Push 하므로 매우 편리하다. 이 옵션은 서브모듈 수정 사항 공유하기에서 설명한다.

기타 훅에서 pre-push 훅에 대해서 설명했다. 이 훅에 Push 해도 되는지 검증하는 스크립트를 설정하면 규칙에 따르도록 Push를 검증할 수 있다.

일반적인 이름 규칙에 따라서 Push 하는 것이 아니라 Refspec을 사용해서 원하는 이름으로 Push 하는 것도 가능하다. 이것은 Refspec Push 하기에서 설명한다.

git remote
git remote 명령은 원격 저장소 설정인 리모트의 관리 도구다. 긴 URL 대신 ‘`origin’'처럼 이름을 짧게 지을 수 있다. 그리고 URL대신 짧은 리모트 이름을 사용한다. git remote 명령으로 이 리모트를 여러 개 만들어 관리할 수 있다.

이 리모트를 조회하고 추가하고 삭제하고 수정하는 방법은 리모트 저장소에서 잘 설명한다.

이 명령은 git remote add <name> <url> 형식으로 사용하고 이 책에서 자주 사용된다.

git archive
git archive 명령은 프로젝트 스냅샷을 아카이브 파일로 만들어 준다.

릴리즈 준비하기에서 설명하는데 프로젝트를 Tarball로 만들어 공유할 때 사용한다.

git submodule
git submodule 명령은 저장소 안에서 다른 저장소를 관리하는 데 사용한다. 라이브러리나 특정 형식의 리소스 파일을 서브모듈로 사용할 수 있다. submodule 명령에 있는 add, update, sync 등의 하위 명령어로 서브모듈을 관리할 수 있다.

이 명령은 서브모듈에서 설명한다.
 
 4. 보안설정 변경
 - servlet-context.xml내,  
 
 <!-- Handles HTTP GET requests for /resources/** by efficiently serving up static resources in the ${webappRoot}/resources directory -->
	<resources mapping="/resources/**" location="/resources/" />
	<resources mapping="/images/**" location="/images/" />
	
	으로 보안경로 추가/변경
	
	<--%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%--> 
	등으로 한글깨짐 방지. utf-8 기본설정함
	
	
	- 허용파일확장자 및 경로사용 권한등 설정 확인 필요
    
    
 5. db연결 및 연동  - 6/14
 - mysql설치 및 연동
 mysql설치 후, src>main>web-inf>spring>root-context.xml에서,
 <bean id="dataSource"
      class="org.springframework.jdbc.datasource.DriverManagerDataSource">
      <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"></property>
      <property name="url"
          value="jdbc:mysql://127.0.0.1:3306/world?useSSL=false&amp;serverTimezone=UTC">
      </property>
      <property name="username" value="root"></property>
      <property name="password" value="7599"></property>
  </bean>   
  등 연결설정 과
  pom.xml에서, 
  <!-- MySQL -->
  <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>6.0.5</version>
  </dependency>
  추가함.
   
 6.mybatis설정 및 연동예제실행 - 6/15
 
mybatis 연동 테스트 
root-context.xml 내 설정
<!-- SqlSessionFactoryBean 생성 -->
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
		<!-- mybatis-config.xml 파일이 스프링이 동작할 때 같이 동작하도록 설정한 것. -->
		<!-- 
	<property name="configLocation" value="classpath:mybatis-config.xml"></property>
	 -->
	<property name="dataSource" ref="dataSource"></property>
	<!-- 
	<property name="mapperLocations" value="classpath:mappers/**/*.xml"></property>
	 -->
</bean> 
	
 및 pom.xml에 필요 라이브러리등 설치 세팅
 
 <!-- MyBatis 3.4.1 -->
 <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
 <dependency>
     <groupId>org.mybatis</groupId>
     <artifactId>mybatis</artifactId>
     <version>3.4.1</version>
 </dependency>

 <!-- MyBatis-Spring -->
 <!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
 <dependency>
     <groupId>org.mybatis</groupId>
     <artifactId>mybatis-spring</artifactId>
     <version>1.3.0</version>
 </dependency>

 <!-- Spring-jdbc -->
 <!-- https://mvnrepository.com/artifact/org.springframework/spring-jdbc -->
 <dependency>
     <groupId>org.springframework</groupId>
     <artifactId>spring-jdbc</artifactId>
     <version>${org.springframework-version}</version>
 </dependency>

 <!-- Spring-test -->
 <!-- https://mvnrepository.com/artifact/org.springframework/spring-test -->
 <dependency>
     <groupId>org.springframework</groupId>
     <artifactId>spring-test</artifactId>
     <version>${org.springframework-version}</version>
 </dependency>

<!-- Test -->
<dependency>
	<groupId>junit</groupId>
	<artifactId>junit</artifactId>
	<!-- 
	<version>4.7</version>
	 -->
	<version>4.12</version>
	<scope>test</scope>
</dependency> 


DB 테이블 생성
↓
VO 클래스 설계
↓
DAO 인터페이스 작성 - 실행해야 하는 기능을 인터페이스로 정의
↓
XML Mapper의 생성과 필요한 DTD 추가 및 SQL문 작성
↓
MyBatis에서 작성된 XML Mapper를 MyBatis가 동작할 때 인식하도록 설정
↓   
DAO인터페이스 구현하는 DAO 클래스 작성 - SqlSessionTemplate 이용
↓
스프링상에 DAO 등록 및 테스트

- mybatis 입력쿼리로그 출력설정(완료 - pom.xml, log4j.xml, root-context.xml 추가설정 )

<!--viewResolver 설정-->
<!--base-package 속성 값에 해당하는 패키지 내부의 클래스들을 모두 조사-->
<!--AOP 설정을 통한 자동적인 Proxy 객체 생성을 위한 설정-->
<!--인터셉터 설정-->

- 에러처리
1.web.xml에 에러관련 구문추가
2.에러처리 컨트롤로 추가 - commonerrorcontroller.java
3.error.jsp 에러페이지 추가

 
 6. 게시판 개발 및 인크루드등 기본 구문 사용  - 6/29
 
 //list, map 입/출력 (1차완료), 추가확인필요
 //검색값비교시, 대소문자변경 과 db쿼리내 변경처리
 //다이나믹쿼리 사용 테스트
  
 maven project 배포등 방법확인 (완료)
 --> run as등에서,  maven (test:테스트, install:  generate-sources 단계부터 compile, test 명령 등을 거쳐 install 명령을 실행한다. , deploy: 통합 또는 릴리스 환경에서 수행되며 최종 패키지를 원격 저장소에 복사하여 다른 개발자 및 프로젝트와 공유)
base directory --> 해당 프로젝트 선택
goals: test, install, deploy등..
user settings: pom.xml등 setting위치
maven runtime: maven설치버전

read페이지(완료) - 6/25
-- 트랜젝션처리 
Transaction Manager추가 및 tx 추가 필요.
소스구문내, TransactionStatus 및 rollback/commit 구문처리 

write페이지 (완료) - 6/25
update페이지 (완료)- 6/25
---RedirectAttributes 사용하여, 리다이렉트시...파라미터값 지정 및 값 전송 가능
delete페이지 (완료) - 6/25
 
 7. 댓글기능 (등록/수정/삭제) (완료) - 6/26
 8. 파일 다운로드 /업로드 - 6/28
 -- multipartResolver 설정 및 uploadPath 설정
 -- maven내, 이미지리사이즈:imgscalr, 파일업로드라이브러리:commons-fileupload, commons-io
 -- 업로드관련 util클래스: uploadfileutils.java 와 매핑관련정의 클래스: mediautil.java 추가
 
 9. 세션 및 로그인 /인터셉터/프로퍼티 (완료)- 6/28
 --- password 암호호처리를 위해 라이브러리  jackson-databind 추가
 --- 인터셉터 설정: servlet-context.xml내, bean 과 interceptor 지정
 --- properties 설정(root-context.xml) 및 해당내부 호출사용, java파일내,  파일불러와서 properties로 지정하여, 설정값 사용예(Authinterceptor.java)
 
 10. 결제 (완료)
 - 이니시스모듈 설치연동
 - pom.xml에, xalan, httpclient, inipay 추가
 - 테스트jar를 위하여, 로컬jar를 maven reoisitory설정가능
 ex)${basedir}/lib/INIpaySample_v1.3_jdk1.5.jar에 파일을 maven 설정 --> 
 <dependency>
     <groupId>com.inicis.inipaystd</groupId>
     <artifactId>INIpaystd</artifactId>
     <version>1.3</version>
     <systemPath>${basedir}/lib/INIpaySample_v1.3_jdk1.5.jar</systemPath>
 </dependency>
         
 - 위변조방지관련 class인,  SignatureUtil를 추가... 수동으로 com.b2b.inipay.utll.SignatureUtil 생성하여 사용가능
 - 추가로  httpclient등 util 수동추가가능
 -- request페이지를 통해 결제요청 --> 결제진행 --> 결제결과받기(return페이지) --> 위변조 및 2차결제(api전송 및 전달) --> try catch로 전송값등으로  성공 및 위변조등 내부처리값 성공시  주문/결제에 대한 데이터저장처리
 --> 에러발생시,  자동취소페이지실행
 

 11. lombok 사용하여 getter/setter관련 적용 및 이외 기능활용  - 7/4

 12. 젠킨스 설정/활용 과 git/svn연동 배포  - 7/7
 
 13. restful api연동 - 7/14

 14. Native영역과 REST 통신 - 7/14

 15. srping boot 이용 + radis등 캐쉬 - 7/14

 16. x플랫폼, 넥사크로 설치사용 - 7/14

 17. spring security을 통한 로그인/로그아웃 구현 - 7/14

 18. 엥귤러 및 nodejs/리엑트js 사용/활용 - 7/14

... velocity, postgresql, graddle 사용

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
