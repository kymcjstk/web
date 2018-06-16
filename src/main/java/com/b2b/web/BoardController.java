package com.b2b.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.b2b.web.dao.BoardDAO;
import com.b2b.web.model.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Inject
    private BoardDAO boardao;
    
    @RequestMapping(value = "/list")
	public String list(@ModelAttribute("search") BoardVO search, Model model) throws Exception {
		
    	/*
    	 * request 파라미터값 받아옴 @ModelAttribute("search") BoardVO search (설정된 값 출력)
    	 */
    	/*리스트형 쿼리로 추가필요*/
        List<BoardVO> vo = boardao.listSearch("user00");  /* 내부처리목적 */ 
        System.out.println("list_print:" + vo);
        
        System.out.println("search:" + search.getTitle());
        
        model.addAttribute("list", boardao.listSearch(search.getTitle()));
                
        return "/board/list";
    }

}
