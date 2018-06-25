package com.b2b.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.b2b.web.model.BoardVO;
import com.b2b.web.model.Criteria;
import com.b2b.web.model.SearchVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;


@Repository
public class BoardDAOImpl implements BoardDAO {
	
    private static final String NAMESPACE = "com.b2b.web.board.mapper.MemberMapper";
    
    private final SqlSession sqlSession;

    @Inject
    public BoardDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    
    @Override
    public String getTime() {
        return sqlSession.selectOne(NAMESPACE + ".getTime");
    }
    
    
    @Override
    public BoardVO readMember(int bno) throws Exception {
        return (BoardVO) sqlSession.selectOne(NAMESPACE + ".selectMember", bno);
    }  
    
    @Override
    public List<BoardVO> listSearch(String writer) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".joinselect", writer);
    }
    /*
     * 복수에 데이터임으로 list나 map형식으로 받아져야됨
     */
    
    @Override
    public BoardVO joinselect(String writer) throws Exception {
        return (BoardVO) sqlSession.selectOne(NAMESPACE + ".selectMember", writer);
        /*
         *구문확인하여 사용필요 
         *
         */
    } 
    
 // 게시글 수정
    @Override
    public void update_viewcount(BoardVO vo) throws Exception {

        sqlSession.update(NAMESPACE + ".update_viewcount", vo);

    }
    
 // 게시글 삭제
    @Override
    public void delete(Integer bno) throws Exception {

        sqlSession.delete(NAMESPACE + ".delete", bno);

    }
    

    
 // 게시글 전체 목록 : 페이징 + 검색
    @Override
    public List<BoardVO> listSearch(SearchVO criteria) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".listSearch", criteria);
    }

    // 게시글 전체 갯수 : 검색
    @Override
    public int listSearchCount(SearchVO criteria) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".listSearchCount", criteria);
    }
    
    @Override
    public BoardVO read(int bno) throws Exception {

        return sqlSession.selectOne(NAMESPACE + ".read", bno);

    }
}
