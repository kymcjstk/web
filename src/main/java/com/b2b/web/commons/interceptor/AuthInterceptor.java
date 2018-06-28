package com.b2b.web.commons.interceptor;

import com.b2b.web.model.UserVO;
import com.b2b.web.dao.UserDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

    @Inject
    private UserDAO userdao;
    
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        
    	HttpSession session = request.getSession();
         
        String propPath = System.getProperty("user.dir") + File.separator + "application.properties";
        Properties props = new Properties();
        props.load(new FileReader(propPath));
        
        String url = props.getProperty("app.domain");
        
        System.out.println("url : " + url);
        
    	if (session.getAttribute("login") == null) {
            logger.info("current user is not logged");
            // 기존의 페이지
            saveDestination(request);
            // 쿠키 값
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
            	UserVO userVO  = null;
                //UserVO userVO = userdao.checkLoginBefore(loginCookie.getValue());
                logger.info("UserVO : " + userVO);
                if (userVO != null) {
                    session.setAttribute("login", userVO);
                    return true;
                }
            }
            
       //     response.sendRedirect("/user/login");
            
            return false;
        }

        return true;
    }

    // 로그인 페이지 이동 전 페이지 저장
    private void saveDestination(HttpServletRequest request) {
        String uri = request.getRequestURI();   // 현재 페이지
        String query = request.getQueryString(); // 쿼리
        if (query == null || query.equals("null")) {
            query =  "";
        } else {
            query = "?" + query;
        }
        // 현재 페이지 + get 파라미터 저장
        if (request.getMethod().equals("GET")) {
            logger.info("destination : " + (uri + query));
            request.getSession().setAttribute("destination", uri + query);
        }
    }

}
