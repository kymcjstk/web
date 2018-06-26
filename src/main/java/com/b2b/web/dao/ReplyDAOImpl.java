package com.b2b.web.dao;

import com.b2b.web.model.Criteria;
import com.b2b.web.model.ReplyVO;
import com.b2b.web.dao.ReplyDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

    @Inject
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.b2b.web.mapper.ReplyMapper";

    @Override
    public List<ReplyVO> list_Reply(int bno) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".list_reply", bno);
    }
    
    @Override
    public void create(ReplyVO replyVO) throws Exception {
        sqlSession.insert(NAMESPACE + ".create", replyVO);
    }
    
    @Override
    public List<ReplyVO> list_ReplyPaging(int bno, Criteria criteria) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("bno", bno);
        paramMap.put("criteria", criteria);
        return sqlSession.selectList(NAMESPACE + ".listPaging", paramMap);
    }

    @Override
    public int count(int bno) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".count", bno);
    }
    
    @Override
    public void modifyReply(ReplyVO replyVO) throws Exception {
        sqlSession.update(NAMESPACE + ".update", replyVO);
    }

    @Override
    public void removeReply(int rno) throws Exception {
        sqlSession.delete(NAMESPACE + ".delete", rno);
    }
   
}
