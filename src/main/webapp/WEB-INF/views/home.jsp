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

- git사용법
git clone /로컬/저장소/경로 : 로컬 저장소를 복제할때
git clone 사용자명@호스트:/원격/저장소/경로 :원격서버의 저장소를 복제할때

- 구조
working directory -add- index들.. -commit - head(최종본)

git add <파일명> / git add * : 변경된 파일을 index에 추가함 --> git commit -m "설명" 으로 head에 반영됨 -- 로컬저장소저장됨/원격 저장소처리 저장안된상태임.
git push origin master : 원격서버 head 내, master가지로 업로드됨

- branch사용
git checkout -b abc_x (abc_x라는 이름의 가지를 만들고 갈아탐) 

git checkout master (master로 돌아옴)

git pull : 원격저장소 변경사항을 로컬디렉토리에 받음(fetch), 병합(marge)됨
git merge <가지이름> : 다른 가지의 변경내용을 현재 위치에 병합함
 
 
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
- goals 설명
clean : 컴파일 결과물인 target 디렉토리 삭제
compile : 모든 소스코드 컴파일, 리소스파일을 target/classes 디렉토리에 복사
package : compile 수행 후, 테스트 수행, <packaging> 정보에 따라 패키징 수행
install : package 수행 후, local repo에 install 수행
deploy : install 수행 후, 배포 수행, 여기서 배포는 웹서버에 배포가 아니다. 회사 repo에 배포다.
아래와 같이 distributionManagement 항목이 기술되어야 한다.
<distributionManagement>
	<repository>
		<id>releases-repo</id>
		<name>Releases Repository</name>
		<url>회사repository주소(넥서스)</url>
	</repository>
	<snapshotRepository>
		<id>snapshots-repo</id>
		<name>Snapshots Repository</name>
		<url>회사repository주소(넥서스)</url>
	</snapshotRepository>
</distributionManagement>

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
 --- properties 설정(root-context.xml) 및 해당내부 호출사용, 
 --- java파일내,  파일불러와서 properties로 지정하여, 설정값 사용예(Authinterceptor.java),  
 @Configuration
 @PropertySource(value = { "classpath:application.properties"}) 
 @Autowired
 private Environment env; 이후,  호출 또는
 @Value("${app.domain}")
 private String domain; 호출
 
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
 

 11. lombok 사용하여 getter/setter관련 적용 및 이외 기능활용  (완료) - 7/3
 -- @Builder 제외한 기본사용 확인 (lombokTest.java와 homecontroller, boardcontroller 테스팅)
 -- getter,setter,tostring,data등과 log기능 사용확인함

 12. 젠킨스 설정/활용 과 git/svn연동 배포  - 7/5
 -- 젠킨스 설치
 tomcat설치 후, 
 젠킨스다운로드 (LTS부분에서 Generic Java package(.war)파일을 톰캣의 webapps폴더에 다운로드 -->톰캣을 실행후 localhost:8080/jenkins를 실행) 계정비번복사 후
 C:\Windows\System32\config\systemprofile\.jenkins\secrets,
 계정생성 후 로그인 --> 메뉴안보이거나 문제있을시, 삭제후 재설치하면 보임
 --> 각 git/svn등에서, 젠킨스가 연결할 수 있도록 권한설정이 필요함: github경우... setting-developer sttings -> personal access tonkens --> generat new token클릭한 후
 repo, admin:repo_hook 메뮤 체크 후, token 설명에 "for jenkins" 입력후, 클릭 토큰발급 (8ca19f2f48a5756b0b07b8b2292e911e9c29d4b3)
--> jenkins관리 - Global tool configuration에서,  
jdk에, name - jdk1.8.0_144, JAVA_HOME - C:\Program Files\Java\jdk1.8.0_144 입력 후 install..체크해제
Maven도 설정(name - apache-maven-3.3.9, MAVEN_HOME - D:\apache-maven-3.3.9)
jenkins관리 - 시스템설정에서, github에,  add github server추가 (id와 발급한 토큰값 입력 후, kind는 secret text임. 테스트연결시.. Credentials verified for user [본인Github이름], rate limit: 4998 이런식으로 나오면 성공)
git.exe (다운로드 설치 후,  git경로지정:C:\Program Files\Git\bin\git.exe)
gradle다운로드 (다운로드 설치 후,  gradle경로지정:D:\gradle-4.8.1)
플러그인설치에서, 배포를 위해, Deploy to contrainer설치 함, gradle 설치
새프로젝트 생성 - 새로운item생성 - (freestyle porject생성)
--> general에서,  github project-project url:경로지정(https://github.com/kymcjstk/web.git/)
소스코드관리 - git url: https://github.com/kymcjstk/web.git, add credentials id/password로 설정하여 입력 후 지정,
build에서,
Invoke top-level Maven target - maven으로 선택한 후, 버전선택 후.. 
goals에
clean package 또는 clean install하고선,
1. 종료 
2. tomcat:redeploy -P production -D maven.test.skip=true 입력하고 완료
이후 확인필요:build - invoke gradle script에서, gradle선택 후,  taskes에 clean 과 bulid입력

tomcat:redeploy
톰캣 매니저( Tomcat manager )와 통신해서 war파일을 deploy 하겠다는 의미입니다.

-P production
뒤에서 pom.xml 파일에 <profile>을 작성할 것인데, 이 설정은 <id>가 production인 <profile>설정 그대로를 컴파일 하라는 의미입니다.
윈도우 환경의 이클립스에서 톰캣의 Servlet은 런타임 환경에서 자동으로 classpath에 잡히지만, 리눅스에서는 이클립스를 사용하지 않기 때문에 <profile>설정을 해줘야 합니다.
( 그동안 이클립스에서 maven으로 build를 하지 않기 때문에, pom.xml 파일에서 <profile>을 설정하지 않았습니다. )

-D maven.test.skip=true
테스트를 생략하겠다는 설정입니다.

- 빌드 후 조치 추가하여,  tomcat서버에 배포처리
Deploy war/ear to a container에서,
war/ear files --> **/*.war
content path --> 폴더명 (예:/b2b_web)
contanies에서,  tomcat버전 및 계정정보/url입력(에: creadentials선택 후, http://localhost:8080 입력)
 --> 해당 tomcat서버 conf/tomcat-user.xml에서는 
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<role rolename="admin-gui"/>
<role rolename="admin-script"/>
<user username="아이디" password="비번" roles="manager-gui,manager-script,manager-jmx,manager-status,admin-gui,admin-script"/>
있어야함 

빌드시, maven url로 다운불가능한 경우 프로젝트등 로컬에서 등록처리
pom.xml에, 예제와같이 등록하여, tmp-repo디렉토리에 jar파일등록하여 사용가능
<!-- local 저장소설정으로 maven서버로 jar파일 전체 전송처리 -->
<repository>
	<id>local-repo</id>
	<name>local Repository</name>
	<url>file://${project.basedir}/tmp-repo</url>
</repository>

tmp-repo폴더에, /com/inicis/inipay/INIpay/5.0/INIpay-5.0.jar등록 후,
아래와 같이 pom.xml에 등록
<dependency>
    <groupId>com.inicis.inipay</groupId>
    <artifactId>INIpay</artifactId>
    <version>5.0</version>
</dependency>

13.jstl문법 추가정리 (완료) - 7/5

- 변수의 선언
<c:set var="t" value="hello"/>
- 변수의 제거
<c:remove var="name"/>
- forEach 예문 (보통의 for문 & 개선된 루프)
<c:forEach items="${pageScope }" var="h">
 <c:out value="${h }"/>
</c:forEach>
  => 위의 예문은 pageScope EL내장객체의 모든 요소를 루프를 통해 뽑아내어 출력하는 문장이다.

<c:forEach var="h" items="${header}">
 <c:out value="${h.key}:${h.value }"/><br>
</c:forEach>
  => 위의 예문은 header 내장객체의 모든 요소를  key와  value로 구분하여 출력하는 문장이다.

<c:forEach var="one" begin="1" end="10" step="1">
 <c:out value="${one}"/>
</c:forEach>
 => 위의 예문은 반복할 횟수를 직접 지정하여 루프를 돌리는 문장이다. (var, step은 생략가능)

<c:forEach items="${color }" varStatus="i">
 <c:out value="${i.count }"/>
 <c:out value="${color[i.index] }"/><br/>
</c:forEach>
  => 위의 예문은 카운트숫자 i 를 설정하여 for 문을 돌리는 문장이다.

<c:forEach varStatus="i" var="cart" items="${cartList}">
 ${cart.userNum}
 ${cart.prodNum}
</c:forEach>
  => 위의 예문은 List객체 cartList 에서 각 요소를 뽑아 for문을 돌리는 문장이다.
      items는 List객체 자체를 받아서 루프의 구조를 만든다.
      var는 List로 묶여있던 각각의 요소 객체를 참조하게 해 주는 이름이다.

<c:forEach items="${codeMap}" var="map">
	${map.key1}:${map.key2}
</c:forEach>
  => 
위의 예문은 Map객체 codeMap 에서 각 요소를 뽑아 for문을 돌리는 문장이다. 

- forTokens 예문 (StringTokenizer)
<c:forTokens var="one" items="서울|인천,대구,부산,찍고" delims="," varStatus="sts">
 <c:out value="${sts.count }:${one}"/>&middot;
</c:forTokens>
  => forTokens 역시 begin, step, end 를 지정할 수 있고, varStatus는 생략가능하다. 

- IF 예문
 1. eq (==)
 비교하고자 하는 값이 동일한지를 확인할때 사용한다.
2. ne (!=)
 비교하는 값이 동일하지 않은지 확인할때 사용한다.
3. empty (== null), not empty
 비교하는 값이 null 인지 확인할때 사용한다. 
 * null이 아닌경우를 표현할때는 !empty 로 표현하면 된다.

<c:if test="${empty name}">
    홍길동이 아닙니다.
</c:if>
<c:if test="${name eq '홈길동'}"></c:if>
<c:if test="${name ne '홈길동'}"></c:if>

<c:choose>
    <c:when test="${name eq '홍길동'}">
        홍길동이 맞습니다.
    </c:when>
    <c:when test="${name eq '철수'}">
        홍길동이 아닙니다.
    </c:when>
    <c:otherwise>
        사람이 없습니다 ㅜㅜ
    </c:otherwise>
</c:choose>

- <--c:out--> – System.out.println()
1. body가 없는 경우
   <--c:out value="value"  [escapeXml="{true|false}"]  [default="기본값"] /-->
2. body가 있는 경우
   <--c:out value="value"  [escapeXml="{true|false}"] -->
      기본값
   <--/c:out-->
  => escapeXml 속성은 값 중에 포함된 < > & ‘ " 문자들을 각각 &lt;  &gt;  &amp;  &#039;  &#034; 로 출력한다. 
      생략할 경우 true가 기본값이다.
  => NULL 값의 처리에 대해서 JSP에서는 “null" 문자열로 출력되었던 것에 비해 JSTL의 스펙에서는 빈문자열(“")
      또는 기본값으로 처리한다고 명시되어 있다.

- <--c:catch/--> : Try~Catch
<--c:catch var="errmsg"-->
line1
<--%=1/0 %--> => 에러가 나는 코드
line2
<--/c:catch-->
<--c:out value="${errmsg }"/-->
  => 시작 catch 태그에 변수를 선언하면 그 변수에 Exception의 내용이 들어가게 된다.

- <--c:import/-->
   – 웹어플리케이션 내부의 자원접근은 물론이고, http, ftp 같은 외부에 있는 자원도 가져와서 페이지
    내에 귀속시킨다.  자유롭게 가공할 수도 있고, 편집도 가능하다. 
   – 스트림으로 받아와서 파일로 저장하거나, DB에 입력할 수도 있도록 되어 있다.
<--c:set var="url" value="http://www.google.co.kr"/-->
<--c:import url="${url}" var="u"/--> => URL에 해당하는 페이지에 있는 모든 요소를 변수에 할당함.
<--c:out value="${url }"/--> 가져옵니다.

<--base href="<c:out value="${url }"/>"--> => base 태그는 해당 URL을 기반으로 상대경로화 하므로 이미지가
                                                            깨지지 않도록 만들어 준다.
 <--c:out value="${u }" escapeXml="false"/--> => 위에서 만든 변수를 출력하면 모든 코드가 출력된다.
<--/base-->                                                      escapeXml="false" 로 해야 화면이 제대로 보인다.

- <--c:url/--> : request.getContextPath()
<--img src="<c:url value="/images/winter.jpg"/>"-->
 => 이렇게 c:url 태그의 value로 넣어주는 것 만으로, 현재 컨텍스트의 경로를 갖다가 붙여서 새 문자열을 만든다.
 => context 속성을 지정해 줄 수도 있는데, context 속성을 지정해 주었을 경우에, context, value 는 “/"로 시작
      해야 한다.

- <--c:redirect/--> : request.sendRedirect()
<--c:redirect url="jstlcore01.jsp"-->
 <--c:param name="number" value="300"/-->
<--/c:redirect-->
 => url에 해당하는 페이지로 리다이렉션 하면서 파라미터를 가지고 간다. body 없이 사용 가능하다.
 => c:url 과 마찬가지로 context 속성을 지정하면, value와 context는 “/"로 시작해야 한다.

- <--c:param/-->
<--c:import url="http://bruce.com"-->
   <--c:param name="action" value="register"/-->
<--/c:import-->
 => 위 태그는 다음과 같은 쓸 수 있다.

 
14. restful api연동  (token처리 보류 - spring boot + spring security + oauth2 사용 및 확장성처리 )- 7/12
- 기본적으로는 RestController 만으로 사용가능함(view페이지가없이 데이터처리를 위한 컨트롤러 처리사항) - replycontroller.java에 구현됨

- spring boot이용하여, token방식에 처리기능포함(oauth2)  -  추후 개발진행
(spring boot + spring security + jpa + rest + h2 + lombok)

- Dependencies
Security:: http://projects.spring.io/spring-security/[Spring Security](이하 스프링 시큐리티) 사용하기 위해 필요하며 OAuth2 서버를 만들 때 필요하다.
JPA:: http://projects.spring.io/spring-data-jpa/[Spring Data JPA](이하 스프링 데이터 JPA)를 스프링 부트에 맞도록 사용하기 위한 의존성을 제공하기 위해 추가하는 것으로 손쉽게 DB를 JPA로 접근하는 형태를 사용하기 위해서 추가했다.
Rest Repositories:: http://projects.spring.io/spring-data-rest/[Spring Data Rest](이하 스프링 데이터 Rest)를 스프링 부트에 맞도록 쉽게 사용할 수 있는 형태 제공하는 부분이면 Rest API 서버를 쉽게 만들어 준다. ( Web을 따로 포함하지 않아도 스프링 MVC를 사용할 수 있는 의존성이 제공된다. )
h2:: 샘플을 빠르게 만들 수 있도록 내장 DB를 사용하기 위해 추가한 부분으로, 추후에 Mysql 등 다른 DB로 쉽게 바꿀 수 있다.
lombok:: 어노테이션을 사용해서 소스의 양을 줄어들도록 만들어 주는 라이브러리이다. 컴파일 타임에 사용되며 주로 getter, setter를 생략하는데 자주 사용된다. 처음 접한 분이라면 


15. srping boot 이용 + radis/MongoDB 연동하여 데이터 넣고 불러오기  (등록/처리관련 확장부분에 대해서는 추후 개발진행 ) - 7/13
radis 설치 및 연동 (데이터연결, select/insert/update/delete 처리)
- 원도우 radis설치 
cmd창으로 서비스 시작/중단 처리가능(NET START Redis/NET STOP Redis), 구동설정 및 확인(redis-server.exe)
서버실행 (redis-server redis.windows.conf) - 환경설정파일지정

클라이언트를 이용한 서버접속(redis-cli.exe) 
-redis-cli –h host주소 –p port번호 –a password정보
예)redis-cli –h 127.0.0.1 –p 6379 –a abcd

서비스등록 - redis-server --service-install redis.windows.conf --loglevel notice
서비스시작 - redis-server --service-start
서비스중지 - redis-server --service-stop
서비스해제 - redis-server --service-uninstall
conf파일에서, 1.port위치에서, 변경가능, 2.bind 127.0.0.1에서,  추가접속허용ip주소 추가 또는 0.0.0.0 으로 전체허용가능, 3.requirepass 비밀번호설정 가능 
외부에서 접속시, redis-tools설치하여 접속가능

redis연동 설정
- pom.xml (spring-boot-starter-redis, jedis 추가)
- com.b2b.web.commons.springredisconfig에 연결설정
- com.b2b.web.dao.redisservice에 실행예제 지정 후, homecontroller에 실행(/test2)
- 추가적인 테스트예제 - src.test.java내, redis추가함

MongoDB 설치 및 연동 (데이터연결, select/insert/update/delete 처리)


16. x플랫폼/넥사크로 설치 및 사용 - 8/19


17. spring security을 통한 로그인/로그아웃 구현 - 8/27

18. 엥귤러 및 nodejs/리엑트js 사용/활용 - 9/19

... velocity, vue.js, graddle 사용

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
