package com.b2b.web.commons;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/error")
public class CommonErrorController {
	private static final Logger logger = LoggerFactory.getLogger(CommonErrorController.class);
	
	@RequestMapping(value = "/500")
	public String pageError500(HttpServletRequest request, Model model)
	{
		logger.info("page 500");
		model.addAttribute("msg", "500에러발생");
		return "common/error";
	}
	
	@RequestMapping(value = "/404")
	public String pageError404(HttpServletRequest request, Model model)
	{
		logger.info("page 404");
		model.addAttribute("msg", "404에러발생");
		return "common/error";
	}
	
	
}