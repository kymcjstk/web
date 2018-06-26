package com.b2b.web;

import com.b2b.web.model.Criteria;
import com.b2b.web.model.PageMaker;
import com.b2b.web.model.ReplyVO;
import com.b2b.web.dao.ReplyDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/replies")
public class ReplyController {

    private static final Logger logger = LoggerFactory.getLogger(RestController.class);

    
    @Inject
    private ReplyDAO replydao;
    
    /*트렌잭션 처리를 위해 추가*/
    @Autowired
    PlatformTransactionManager transactionManager;

    // 댓글 목록
    @RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {

        ResponseEntity<List<ReplyVO>> entity = null;

        try {
            entity = new ResponseEntity<>(replydao.list_Reply(bno), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }
    
    // ResponseEntity : 결과데이터 + HTTP 상태코드를 제어할 수 있는 클래스
    // 댓글 등록
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReplyVO replyVO) {

    	/*
    	 * @RequestBody - HTTP 요청의 body 내용을 자바 객체로 매핑하는 역할을 합니다.
    	 * 현재구조 경우, ReplyVO값을 위해 json형식으로 전달되어여햐 변경없이 입력가능함. 
    	 */

        ResponseEntity<String> entity = null;
        
        /*트렌잭션 처리를 위해 추가*/
    	TransactionStatus status = this.transactionManager.getTransaction(new DefaultTransactionDefinition());
    	
    	try {
        	replydao.create(replyVO);
        	this.transactionManager.commit(status);
        	
	    	HttpHeaders responseHeaders = new HttpHeaders();
	        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
	        entity = new ResponseEntity<String>("INSERTED", responseHeaders, HttpStatus.OK);
    	} catch (Exception e) {
    		
    		this.transactionManager.rollback(status);
    		
    		e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    	
        return entity;
    }
    
    // 댓글 목록 : 페이징처리
    @RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("bno") Integer bno,
                                                          @PathVariable("page") Integer page) {

    	/*
    	 * @PathVariable("bno") mapping내,  넘겨지는 값을 지정하여 받아옴
    	 */
        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);

            Map<String, Object> map = new HashMap<>();
            List<ReplyVO> list = replydao.list_ReplyPaging(bno, criteria);
            int replyCount = replydao.count(bno);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCriteria(criteria);
            pageMaker.setTotalCount(replyCount);

            map.put("list", list);
            map.put("replyCount", replyCount);
            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new  ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }
    
    // 댓글 수정
    @RequestMapping(value = "/update/{rno}", method = {RequestMethod.POST})
    public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ReplyVO replyVO) {

        ResponseEntity<String> entity = null;

        try {
            replyVO.setRno(rno);
            replydao.modifyReply(replyVO);
            entity = new ResponseEntity<String>("MODIFIED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }


    // 댓글 삭제
    @RequestMapping(value = "/delete/{rno}", method = RequestMethod.GET)
    public ResponseEntity<String> delete(@PathVariable("rno") Integer rno) {

        ResponseEntity<String> entity = null;

        try {
        	replydao.removeReply(rno);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }



}
