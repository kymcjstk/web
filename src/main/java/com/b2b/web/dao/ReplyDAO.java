package com.b2b.web.dao;

import com.b2b.web.model.ReplyVO;
import com.b2b.web.model.Criteria;

import java.util.List;

public interface ReplyDAO {

    public List<ReplyVO> list_Reply(int bno) throws Exception;
    
    public void create(ReplyVO replyVO) throws Exception;
    
    public List<ReplyVO> list_ReplyPaging(int bno, Criteria criteria) throws Exception;

    public int count(int bno) throws Exception;
    
    public void modifyReply(ReplyVO replyVO) throws Exception;

    public void removeReply(int rno) throws Exception;
    
}
