package com.b2b.web.dao;

import java.util.List;

import com.b2b.web.model.BoardVO;
import com.b2b.web.model.SearchVO;

public interface BoardDAO {
	
    // 현재시간체크
    public String getTime();
    
    // 회원아이디로 조회
    public BoardVO readMember(int bno) throws Exception;
    
    public BoardVO joinselect(String writer) throws Exception;

    List<BoardVO> listSearch(String writer) throws Exception;
    /*
     * List형으로 받음
     */
    
    public int listSearchCount(SearchVO criteria) throws Exception;

    public List<BoardVO> listSearch(SearchVO criteria) throws Exception;

	public BoardVO read(int bno) throws Exception;

	public void update_viewcount(BoardVO vo) throws Exception;

	public void register(BoardVO boardVO) throws Exception;
	
	public void update(BoardVO vo) throws Exception;

	public void delete(int bno) throws Exception;
}
