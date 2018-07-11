package com.b2b.web.dao;

import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import com.b2b.web.commons.SpringRedisConfig;

import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;

import com.b2b.web.model.UserVO;

@Service
public class RedisService {
	
	@Resource(name = "redisTemplate")
	private RedisTemplate redisTemplate;	
	
	private final static String KEY_NAME = "emp:name";
	private final static String KEY_NAME2 = "emp:new";
	private final static String KEY_NAME3 = "emp:test";
	private final static String KEY_NAME4 = "emp:test2";

	@Before
    public void initKey(){ 
		redisTemplate.delete(this.KEY_NAME);   //초기화시킴
		redisTemplate.delete(this.KEY_NAME2);   //초기화시킴
		redisTemplate.delete(this.KEY_NAME3);   //초기화시킴
		redisTemplate.delete(this.KEY_NAME4);   //초기화시킴
    }
	
	@SuppressWarnings("unchecked")
	public String getVisitCount() {
		String count = "";
		long cnt = 1;
		try {
			
			redisTemplate.opsForValue().increment(KEY_NAME, cnt);
			System.out.println(redisTemplate.opsForValue().get(KEY_NAME).toString());  //오류발생으로 확인필요
			//count = redisTemplate.opsForValue().get("spring:redis:visitcount").toString();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return count;
	}
	
	public void Redis_Map(String value) {
		ConfigurableApplicationContext ctx = new AnnotationConfigApplicationContext(
				SpringRedisConfig.class);    //설정된 연결값 불러와서 연결시작
		try {			
			
			/*initKey();  초기화필요시 사용 */
			
			StringRedisTemplate redisTemplate_new = (StringRedisTemplate) ctx.getBean("strRedisTemplate");
			HashOperations<String, String, String> hash = redisTemplate_new.opsForHash();
			
			String empJohnKey = "emp:john";			
			
			Map<String, String> empJoeMap = new HashMap<>();
			empJoeMap.put("name2", value);
			/*empJoeMap.put("age", "32");
			empJoeMap.put("id", "01");
			
			Map<String, String> empJohnMap = new HashMap<>();
			empJohnMap.put("name", "John");
			empJohnMap.put("age", "42");
			empJohnMap.put("id", "02");*/
			
			hash.putAll(KEY_NAME, empJoeMap);
			/*hash.putAll(empJohnKey, empJohnMap);*/	
			
			System.out.println(""+hash.size(KEY_NAME));			
			System.out.println(""+hash.get(KEY_NAME,"name2"));			
			System.out.println(" "+hash.hasKey(KEY_NAME, "name2").toString());
			System.out.println(" "+hash.keys(KEY_NAME).iterator());
			
			Iterator<String> keys = hash.keys(KEY_NAME).iterator();
			while ( keys.hasNext() ) {
			    String key = keys.next();
			    System.out.println("key값: "+ key );
			    System.out.println("value값: "+ hash.get(KEY_NAME, key) );
			}   
			
			System.out.println("Get emp joe details: " + hash.entries(KEY_NAME));
		} finally {
			ctx.close();  //설정된 연결값 불러와서 연결종료
		}
		return; 
	}
	
	public void Redis_Map2(String value) {
		HashOperations<String, String, String> hash = redisTemplate.opsForHash();
				
		Map<String, String> empJoeMap = new HashMap<>();
		empJoeMap.put("name", value);
		
		hash.putAll(KEY_NAME2, empJoeMap);
		
		System.out.println(""+hash.size(KEY_NAME2));			
		System.out.println(""+hash.get(KEY_NAME2,"name"));			
		System.out.println(" "+hash.hasKey(KEY_NAME2, "name").toString());
		System.out.println(" "+hash.keys(KEY_NAME2).iterator());
		
		Iterator<String> keys = hash.keys(KEY_NAME2).iterator();
		while ( keys.hasNext() ) {
		    String key = keys.next();
		    System.out.println("key값: "+ key );
		    System.out.println("value값: "+ hash.get(KEY_NAME2, key) );
		}   
		
		System.out.println("Get emp joe details: " + hash.entries(KEY_NAME2));
		
		return; 
	}
	
	public void Redis_List(String value) {
		
		ValueOperations<String, String> values = redisTemplate.opsForValue();
		values.set("01", value);
		
		if(values.get("01").equals("abc"))
		{
			System.out.println("Employee added: " + values.get("01"));				
		}
				
		return;
	}
	
	public void testListOpenationObject() {
		
        ListOperations<String, UserVO> listOps = redisTemplate.opsForList();  /*호출부분 수정필요*/
 
        // User 인스턴스 생성
		
        UserVO user1 = new UserVO();
        user1.setUid("k");
        user1.setUname("p");
 
        listOps.rightPush(KEY_NAME4, user1);
 
        UserVO user2 = new UserVO();
        user2.setUid("k2");
        user2.setUname("p2");
 
        listOps.rightPush(KEY_NAME4, user2);
 
        List<UserVO> users = listOps.range(KEY_NAME4,0,-1);
        
        /*
         * ListOps를 통해서 List로 꺼낼때 GenericJackson2JsonRedisSerializer를 통해 Java Object(User)로 변환되게 되는 것이다.

		Springboot MVC에서 Controller의 produce의 MediaType의 json인 경우, View에서는 별다른 매핑작없이 List객체를 Resposebody로 반환하면
		Json String으로 전달되게 된다. 
         */
 
        for( UserVO user : users) {
            System.out.println(user.getUid());
            System.out.println(user.getUname());
        } 
    }
	
	public void testListOperationString() {
		 
        ListOperations<String, String> listOps = redisTemplate.opsForList();
        
        /*
         * redisTemplate를 통해 ListOperation 인스턴스를 생성한다.
			제너릭타입을 지원하므로 value에 단순문자열이 들어가도록 String형으로 지정한다.
         */
 
        listOps.leftPush(KEY_NAME3,"willis");
        listOps.leftPush(KEY_NAME3,"brown");
        listOps.leftPush(KEY_NAME3, "endy");
 
        List<String> users = listOps.range(KEY_NAME3,  0,-1);
        
        /*
         * ListOperation(이하 ListOps)에 값을 저장한다. 총 3개의 문자열을 저장했다.
		ListOps는 값을 넣기위해 leftPush 와 rightPush 항수를 제공하는데, 말그대로 데이타가 들어가는 방향이다.
		아래의 Queue/Stack활용에서 상관있는 부분인데, 지금은 어떤 방향이든 상관없으므로 데이타가 왼쪽방향부터 쌓이게 된다고 보면 된다.
		
		listOps.range를 이용해 지정 인덱스범위만큼 List(Java의 List)형태로 데이타를 가져올 수 있다.
		범위를 0 에서 -1 로 지정하면 Key에 저장된 모든 데이타를 List에 담는다.
		
		참고로 leftPush로 데이타를 넣었기 때문에
		List형태로 담게 되면 위의 그림처럼 꺼내서 사용할때는 가장 마지막에 저장된 값이 List의 첫번째 index로 저장되게 된다.(LIFO)
		rightPush로 넣으면 반대로 가장 처음에 저장된 값이 List의 첫번째 index로 저장된다
         */
       
        for(String user : users) {
            System.out.println(user);
        }
    }
}
