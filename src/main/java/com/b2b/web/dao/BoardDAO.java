package com.b2b.web.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

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
	
	// 게시글 입력 처리
    public default void write_board(BoardVO boardVO) throws Exception {
        String[] files = boardVO.getFiles();
        if (files == null) {
        	register(boardVO);
            return;
        }
        boardVO.setAttachcnt(files.length);
        register(boardVO);
        for (String fileName : files) {
            addAttach(fileName);
        }
    }
	
	public void update(BoardVO vo) throws Exception;

	public void delete(int bno) throws Exception;
	
	// 게시글 첨부파일 추가
    public void addAttach(String fullName) throws Exception;

    // 게시글 첨부파일 조회
    public List<String> getAttach(Integer bno) throws Exception;

    // 게시글 첨부파일 수정
    public void replaceAttach(String fullName, Integer bno) throws Exception;

    // 특정 게시글 첨부파일 일괄 삭제
    public void deleteAllAttach(Integer bno) throws Exception;

    // 게시글 첨부파일 삭제
    public void deleteAttach(String fullName) throws Exception;

    // 특정 게시글의 첨부파일 갯수 갱신
    public void updateAttachCnt(Integer bno) throws Exception;
}
