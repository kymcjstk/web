<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
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

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
