package com.b2b.web;

import com.b2b.web.model.Criteria;
import com.b2b.web.model.PageMaker;
import com.b2b.web.model.ReplyVO;
import com.b2b.web.dao.ReplyDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    // 댓글 등록
    @RequestMapping(value = "", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReplyVO replyVO) {

        ResponseEntity<String> entity = null;

        try {
        	replydao.create(replyVO);
            entity = new ResponseEntity<String>("INSERTED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 댓글 목록
    @RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
    public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {

        ResponseEntity<List<ReplyVO>> entity = null;

        try {
            entity = new ResponseEntity<>(replydao.list(bno), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 댓글 수정
    @RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO replyVO) {

        ResponseEntity<String> entity = null;

        try {
            replyVO.setRno(rno);
            replydao.update(replyVO);
            entity = new ResponseEntity<String>("MODIFIED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }


    // 댓글 삭제
    @RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
    public ResponseEntity<String> delete(@PathVariable("rno") Integer rno) {

        ResponseEntity<String> entity = null;

        try {
        	replydao.delete(rno);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 댓글 목록 : 페이징처리
    @RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("bno") Integer bno,
                                                          @PathVariable("page") Integer page) {

        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria criteria = new Criteria();
            criteria.setPage(page);

            Map<String, Object> map = new HashMap<>();
            List<ReplyVO> list = replydao.listPaging(bno, criteria);
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


}
