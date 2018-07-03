package com.b2b.web.model;

import lombok.*;

/*
@Data
*/
/*로 사용 가능 (전체포함된 기능)*/

@Getter /*getter,setter각 부분적으로 사용가능*/
@Setter
@ToString
/*@ToString 를 사용한다. @ToString(exclude = "password") 처럼 특정 필드를 제외시킬 수도 있다.*/
@EqualsAndHashCode

/*@Builder*/
public class lombokTest {
	/*@NonNull*/
	private int id;
	
	private String username;
	private String password;
}