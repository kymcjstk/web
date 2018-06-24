package com.b2b.web;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.b2b.web.dao.BoardDAO;
import com.b2b.web.model.BoardVO;
import com.b2b.web.model.SearchVO;
import com.b2b.web.model.PageMaker;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Inject
    private BoardDAO boardao;
    
    @RequestMapping(value = "/list")
	public String list(@ModelAttribute("search") SearchVO search, @ModelAttribute("boardvo") BoardVO boardvo, Model model) throws Exception {
		
    	/*
    	 * request 파라미터값 받아옴 @ModelAttribute("search") BoardVO search (설정된 값 출력)
    	 * jsp에서도 search값을 받을수 있음
    	 * @ModelAttribute("boardvo") BoardVO boardvo 이면,  jsp에서도 boardvo값을 받을수 있음
    	 */
    	/*리스트형 쿼리로 추가필요*/
        List<BoardVO> vo = boardao.listSearch("user00");  /* 내부처리목적 */ 
        System.out.println("list_print:" + vo);
        
        String title = null;
        title = vo.get(0).toString();   /* list첫번째 정보출력 */ 
        String title2 = vo.get(0).getTitle().toString(); /* list내 0행 title값 출력*/
        
        String element = null;
        String element2 = null;
        
        //for문으로 전체조회
        int size = vo.size();
        for(int i=0; i<size;i++){
            System.out.print("값출력"+i+":"+vo.get(i) + " ");  /*유효함*/
            System.out.print("값출력테스트:"+vo.get(i).getTitle() + " "); /*유효함*/
            System.out.print("값출력테스트2:"+vo.get(i).getTitle().contains("abc") + " "); /*유효함*/
            System.out.print("값출력테스트3:"+vo.get(i).getTitle().indexOf("abc") + " "); /*유효함*/
            vo.get(i).getTitle().replaceAll("abd", "abc");
            vo.get(i).getTitle().replaceAll("abc", "abd");
            vo.get(i).getTitle().replace("abc", "accd");
            
        }
        vo.get(0).getTitle().replaceAll("abc", "abd");
        vo.get(0).getTitle().replace("abc", "accd");
        
        System.out.print("값출력테스트5:"+vo.get(0).getTitle() + " ");
        System.out.print("값출력테스트6:"+vo.get(1).getTitle() + " ");
        
        vo.get(0).setTitle("abcdd"); /*유효함*/
        
        System.out.print("값출력테스트7:"+vo.get(0).getTitle() + " ");
        
        System.out.println("size1:"+size);
        
        
        //Iterator 통한 전체 조회
        /*
        Iterator iterator = vo.iterator();
        while (iterator.hasNext()) {
            element = (String) iterator.next();                         
        }
        */
        
        //for-loop 통한 전체 조회 
        /*
        for(Object object : vo) {
            element2 = (String) object;
        }
        */
        
        
        //값 추가        
        int index = vo.indexOf("tbl_board{bno=1, title='abc', content='내용입니다...', writer='user00', regdate=Fri Jun 15 15:48:04 KST 2018, viewcnt=0}");
        System.out.println("존재위치:"+index);
        /*
        vo.add(index, search);
        */
        /* writer='user00'*/
 
        // 존재 여부 확인        
        
        System.out.println("존재유무확인:"+vo.contains("abc"));
        
        
        // 값 삭제하는 방법  
        System.out.println("값 삭제유무"+vo.remove("abc"));
        System.out.println("첫행삭제유무"+vo.remove(0));
        System.out.println("size2:"+size);
        
        System.out.println("search_tatal:" + search);
        System.out.println("boardvo_tatal:" + boardvo);
        System.out.println("search:" + boardvo.getTitle());
        System.out.println("title_vo:" + title);
        System.out.println("title_vo2:" + title2);
        System.out.println("element:" + element);
        System.out.println("title_vo2:" + title2);
        
        model.addAttribute("list", boardao.listSearch(boardvo.getTitle()));
        model.addAttribute("search_title", boardvo.getTitle());
        
        System.out.println("search_test1:" + search.getPage());
        System.out.println("search_test2:" + search.getPageStart());
        System.out.println("search_test3:" + search.getPerPageNum());
        //쿼리 필요한 값들은 넘겨진값 과 이를 통한 Criteria.java에서 구해져선 반환됨
        
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriteria(search); //값을 pageMaker입력 - search 값이 criteria 로 지정됨
        
        pageMaker.setTotalCount(boardao.listSearchCount(search)); //페이징 처리를 true,false 및 값 계산처리

        model.addAttribute("list", boardao.listSearch(search)); // 게시글 목록
        model.addAttribute("boardCount", boardao.listSearchCount(search)); // 게시글 갯수 딘슨 츨력용
        
        model.addAttribute("pageMaker", pageMaker);
        
        System.out.println("list:" + boardao.listSearch(search));
        System.out.println("boardCount:" + boardao.listSearchCount(search));
        System.out.println("pageMaker:" + pageMaker);
                
        return "/board/list";
    }
    
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public String read(@RequestParam("bno") int bno,
                       @ModelAttribute("criteria") SearchVO criteria, Model model) throws Exception {

    	/*
    	 * request 파라미터값 받아옴 @ModelAttribute("criteria") SearchVO criteria (설정된 값 출력)
    	 * jsp에서도 criteria값을 받을수 있음
    	 */
        logger.info("================ read() : called ================");
        logger.info("Get boardVO : " + boardao.read(bno));
        model.addAttribute(boardao.read(bno));
        
        System.out.println("criteria:" + criteria);
        System.out.println("boardao:" + boardao.read(bno));

        return "/board/read";
    }

}
