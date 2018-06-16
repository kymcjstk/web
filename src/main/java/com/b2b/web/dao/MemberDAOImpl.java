package com.b2b.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.b2b.web.model.MemberVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

@Repository
public class MemberDAOImpl implements MemberDAO {
    @Inject
    SqlSession sqlSession;

    private static final String NAMESPACE = "com.b2b.web.mapper.MemberMapper";

    @Override
    public String getTime() {
        return sqlSession.selectOne(NAMESPACE + ".getTime");
    }

    @Override
    public void insertMember(MemberVO memberVO) {
        sqlSession.insert(NAMESPACE + ".insertMember", memberVO);
    }

    @Override
    public MemberVO readMember(String username) throws Exception {
        return (MemberVO) sqlSession.selectOne(NAMESPACE + ".selectMember", username);
    }

    @Override
    public MemberVO readWithPW(String userid, String userpw) throws Exception {
        Map<String, Object> paraMap = new HashMap<String, Object>();
        paraMap.put("userid", userid);
        paraMap.put("userpw", userpw);
        return sqlSession.selectOne(NAMESPACE + ".readWithPW", paraMap);
    }
}
