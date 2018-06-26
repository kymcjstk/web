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
import java.util.Map;


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
         */    } 
    
 // 게시글 수정
    @Override
    public void update_viewcount(BoardVO vo) throws Exception {

        sqlSession.update(NAMESPACE + ".update_viewcount", vo);

    }
    
    @Override
    public void update(BoardVO vo) throws Exception {

        sqlSession.update(NAMESPACE + ".update", vo);

    }
    
 // 게시글 삭제
    @Override
    public void delete(int bno) throws Exception {

        sqlSession.delete(NAMESPACE + ".delete", bno);

    }
    
 // 게시글 입력
    @Override
    public void register(BoardVO boardVO) throws Exception {

        sqlSession.insert(NAMESPACE + ".create", boardVO);

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
    
 // 게시글 첨부파일 추가
    @Override
    public void addAttach(String fullName) throws Exception {
        sqlSession.insert(NAMESPACE + ".addAttach", fullName);
    }

    // 게시글 첨부파일 조회
    @Override
    public List<String> getAttach(Integer bno) throws Exception {
        return sqlSession.selectList(NAMESPACE + ".getAttach", bno);
    }

    // 게시글 첨부파일 수정
    @Override
    public void replaceAttach(String fullName, Integer bno) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("fullName", fullName);
        paramMap.put("bno", bno);

        sqlSession.insert(NAMESPACE + ".replaceAttach", paramMap);
    }

    // 특정 게시글 첨부파일 일괄 삭제
    @Override
    public void deleteAllAttach(Integer bno) throws Exception {
        sqlSession.delete(NAMESPACE + ".deleteAllAttach", bno);
    }

    // 게시글 첨부파일 삭제
    @Override
    public void deleteAttach(String fullName) throws Exception {
        sqlSession.delete(NAMESPACE + ".deleteAttach", fullName);
    }

    // 특정 게시글의 첨부파일 갯수 갱신
    @Override
    public void updateAttachCnt(Integer bno) throws Exception {
        sqlSession.update(NAMESPACE + ".updateAttachCnt", bno);
    }
}
