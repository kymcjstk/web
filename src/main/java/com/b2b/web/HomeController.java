package com.b2b.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.b2b.web.dao.BoardDAO;
import com.b2b.web.dao.MemberDAO;
import com.b2b.web.model.MemberVO;
import com.b2b.web.model.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Inject
    private MemberDAO memberDAO;
	/*
	@Inject
	BoardDAO boardService;
	*/
	@Autowired
	BoardDAO boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
						
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String doD(Model model) throws Exception {
		System.out.println(memberDAO.getTime());
		
		MemberVO vo = memberDAO.readMember("user00");
        logger.info("test : " + vo);
        System.out.println("dd" + vo);
        model.addAttribute(vo);
        model.addAttribute("vo", vo);
        
        return "test2";
    }
		
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String doD2(Model model) throws Exception {
		System.out.println(memberDAO.getTime());
		
		MemberVO vo = memberDAO.readWithPW("user00", "user00");
        logger.info("test2 : " + vo);
        System.out.println("dd2" + vo);
        model.addAttribute(vo);
        model.addAttribute("vo", vo);
        
        return "test2";
    }
    
	@RequestMapping(value = "/test3", method = RequestMethod.GET)
	public String doD3(Model model) throws Exception {
		
		System.out.println("test3a" + boardService.getTime());
		
		BoardVO vo = boardService.readMember(1);
        logger.info("test3 : " + vo);
        System.out.println("dd3" + vo);
        model.addAttribute(vo);
        model.addAttribute("vo", vo);
        
        List<BoardVO> vo2 = boardService.listSearch("user00");
        logger.info("test32 : " + vo2);
        System.out.println("dd32" + vo2);
        
        //(mysql 한글입력/출력)
        //mysql한글입력/출력 - ALTER TABLE 테이블명 convert to charset utf8;
        
        //- my.cnf 한글입력/출력 

        //[client]
        //default-character-set = utf8
        //[mysqld]
        //character-set-server = utf8
        //collation-server = utf8_general_ci
        //[mysql]
        //default-character-set = utf8
        //character-set-server=utf8
        //collation-server=utf8_general_ci
        //init_connect=SET
        //collation_connection=utf8_general_ci
        //init_connect=SET NAMES utf8
  	
        return "test2";
    }
    
	
}
