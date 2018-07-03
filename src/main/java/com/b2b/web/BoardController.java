package com.b2b.web;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.b2b.web.dao.BoardDAO;
import com.b2b.web.dao.MemberDAO;
import com.b2b.web.model.BoardVO;
import com.b2b.web.model.MemberVO;
import com.b2b.web.model.SearchVO;

import lombok.extern.log4j.Log4j;

import com.b2b.web.model.PageMaker;

@Log4j  /* lombok을 이용한 로그출력설정*/
@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	
    @Inject
    private BoardDAO boardao;
    
    @Inject
    private MemberDAO memberDAO;
    
    /*트렌잭션 처리를 위해 추가*/
    @Autowired
    PlatformTransactionManager transactionManager;
    
    @RequestMapping(value = "/list")
	public String list(@ModelAttribute("search") SearchVO search, @ModelAttribute("boardvo") BoardVO boardvo, Model model) throws Exception {
		
    	log.info(""); /* lombok을 이용한 로그출력사용가능*/
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
        
        System.out.println("검색값:"+search.getKeyword());
        if(search.getKeyword() != null )
        {
        	search.setKeyword(search.getKeyword().toLowerCase());  //검색값을 소문자로 변경처리
        }
        
        System.out.println("검색변경값:"+search.getKeyword());
        
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
                       @ModelAttribute("search") SearchVO criteria, HttpServletResponse response, Model model) throws Exception {

    	/*
    	 * request 파라미터값 받아옴 @ModelAttribute("criteria") SearchVO criteria (설정된 값 출력)
    	 * jsp에서도 criteria값을 받을수 있음
    	 */
    	
    	int viewcnt = 0;
    	
    	/*트렌잭션 처리를 위해 추가*/
    	TransactionStatus status = this.transactionManager.getTransaction(new DefaultTransactionDefinition());
    	
    	try //트렌젹션 처리없음 --> 추가필요
    	{   
    		BoardVO vo = boardao.read(bno);  
            System.out.println("view_printa:" + vo);
            
            if(vo == null)
            {
            	//rollback처리
            	this.transactionManager.rollback(status);

            	System.out.println("size: null");
            	//alert처리 후, history.back()등 처리
            	
            	com.b2b.web.commons.MediaUtils.print_historyback(response);  //외부에 확장하여 불러올수 있음
            	
            	//response.setContentType("text/html; charset=UTF-8");
                //PrintWriter out = response.getWriter();
                //out.println("<script>alert('해당 게시물이 존재하지 않습니다.'); history.go(-1);</script>");
                //out.flush();
            }
            else
            {   
            	viewcnt = vo.getViewcnt() + 1;
            	
            	BoardVO vo_update = new BoardVO();
            	vo_update.setBno(bno);
            	vo_update.setViewcnt(viewcnt);            	
            	
            	//viewcount+1 update처리
            	boardao.update_viewcount(vo_update);
            	System.out.println("vo_update1:" + vo_update);    

        		//테스트용 에러발생
            	//MemberVO vo_3 = memberDAO.readMember("user00");
            	//System.out.println("readMember:" + vo_3);       
            	//vo_update.setViewcnt(viewcnt+1);
            	//boardao.update_viewcount(vo_update);
            	            	
            	//commit처리
            	this.transactionManager.commit(status);
            	vo.setViewcnt(viewcnt);
            	System.out.println("view_printb:" + vo);            	
	            model.addAttribute(vo);       	
            }
            
	        System.out.println("criteria:" + criteria);	  
	        System.out.println("search:" + criteria.getSearchType());	  
    	}
    	catch(Exception e)
    	{
    		//rollback처리
    		this.transactionManager.rollback(status);
    		
    		 System.out.println("view_printc:");
    		 e.printStackTrace();
    		 response.setContentType("text/html; charset=UTF-8");
             PrintWriter out = response.getWriter();
             out.println("<script>alert('해당 게시물이 존재하지 않습니다.'); history.go(-1);</script>");
             out.flush();
    	}
        return "/board/read";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGET(BoardVO boardVO, Model model) throws Exception {

        return "/board/register";
    }
    
    // 게시글 입력처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(BoardVO boardVO) throws Exception {

        logger.info("Inserted BoardVO : " + boardVO);
        boardao.register(boardVO);

        return "redirect:/board/list";
    }
    
    // 게시글 수정 페이지 : 목록페이지 정보, 검색 정보 유지
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("bno") int bno,
                            @ModelAttribute("criteria") SearchVO criteria, Model model) throws Exception {

       model.addAttribute("boardVO", boardao.read(bno));

        return "/board/modify";
    }
    
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(@ModelAttribute("boardVO") BoardVO boardVO,
                             @ModelAttribute("criteria") SearchVO criteria,
                             RedirectAttributes rttr) throws Exception {

        logger.info("================ modifyPOST() : called ================");
        logger.info("Modified boardVO : " + boardVO);
        logger.info(criteria.toString());
        boardao.update(boardVO);

        rttr.addAttribute("bno", boardVO.getBno());
        rttr.addAttribute("page", criteria.getPage());
        rttr.addAttribute("perPageNum", criteria.getPerPageNum());
        rttr.addAttribute("searchType", criteria.getSearchType());
        rttr.addAttribute("keyword", criteria.getKeyword());

        rttr.addFlashAttribute("msg", "MODIFY");
        
        //RedirectAttributes 사용하여, 리다이렉트시...파라미터값 지정 및 값 전송 가능

        logger.info(rttr.toString());

        return "redirect:/board/read";

    }
    
 // 게시글 삭제 : 목록페이지 정보, 검색 정보 유지
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno,
                         @ModelAttribute("criteria") SearchVO criteria,
                         RedirectAttributes rttr) throws Exception {

        logger.info("bno : " + bno);
       
        boardao.delete(bno);

        rttr.addAttribute("page", criteria.getPage());
        rttr.addAttribute("perPageNum", criteria.getPerPageNum());
        rttr.addAttribute("searchType", criteria.getSearchType());
        rttr.addAttribute("keyword", criteria.getKeyword());

        rttr.addFlashAttribute("msg", "DELETE");

        return "redirect:/board/list";
    }


}
