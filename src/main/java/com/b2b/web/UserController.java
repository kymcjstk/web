package com.b2b.web;

import com.b2b.web.commons.UploadFileUtils;
import com.b2b.web.model.*;

import com.b2b.web.dao.UserDAO;
import org.apache.commons.fileupload.FileUploadException;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Inject
    private UserDAO userdao;

    /*
     * @Resource(name = "uimagePath")
     * private String uimagePath;
     */
   
    // 회원가입 페이지
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerGET() {
        return "user/register";
    }

    // 회원가입 처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes) throws Exception {
        
    	// 비밀번호 암호화 처리
        String hashPw = BCrypt.hashpw(userVO.getUpw(), BCrypt.gensalt());
        
        userVO.setUpw(hashPw);
        userdao.register(userVO);
        
        redirectAttributes.addFlashAttribute("msg", "REGISTERED");
        
        return "redirect:/user/login";
    }

    // 회원정보 수정처리
    @RequestMapping(value = "/modify/info", method = RequestMethod.POST)
    public String userInfoModify(UserVO userVO, HttpSession session,
                                 RedirectAttributes redirectAttributes) throws Exception {
        //UserVO oldUserInfo = userService.getUser(userVO.getUid());
        //if (!BCrypt.checkpw(userVO.getUpw(), oldUserInfo.getUpw())) {
        //    redirectAttributes.addFlashAttribute("msg", "FAILURE");
        //    return "redirect:/user/profile";
        //}
        //userService.modifyUser(userVO);
        //userVO.setRegdate(oldUserInfo.getRegdate());
        //userVO.setLogdate(oldUserInfo.getLogdate());
        //userVO.setUimage(oldUserInfo.getUimage());
        session.setAttribute("login", userVO);
        //redirectAttributes.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/user/profile";
    }

    // 회원 비밀번호 수정처리
    @RequestMapping(value = "/modify/pw", method = RequestMethod.POST)
    public String userPwModify(@RequestParam("uid") String uid,
                               @RequestParam("oldPw") String oldPw,
                               @RequestParam("newPw") String newPw,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) throws Exception {
        UserVO userInfo = userdao.getUser(uid);
        if (!BCrypt.checkpw(oldPw, userInfo.getUpw())) {
            redirectAttributes.addFlashAttribute("msg", "FAILURE");
            return "redirect:/user/profile";
        }
        String newHashPw = BCrypt.hashpw(newPw, BCrypt.gensalt());
        userInfo.setUpw(newHashPw);
        userdao.updatePw(userInfo);
        session.setAttribute("login", userInfo);
        redirectAttributes.addFlashAttribute("msg", "SUCCESS");
        return "redirect:/user/profile";
    }

    // 로그인 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
		
    	Object object = session.getAttribute("login");
    	
    	System.out.println("session_chk:"+ object);
    	
        return "user/login";
    }

    // 로그인 처리
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, UserVO uservo,
                          HttpSession session,
                          Model model) throws Exception {
    	
    	//session.setAttribute("login", uservo);
    	//Object object = session.getAttribute("login");
    	
    	//System.out.println("session:"+ object);
    	
        // 아이디 비번 일치 확인
        UserVO userVO = userdao.login(loginDTO);
        
        // 불일치할 경우
        if (userVO == null || !BCrypt.checkpw(loginDTO.getUpw(), userVO.getUpw())) {
            return;
        }
        // 일치할 경우
        model.addAttribute("userVO", userVO);
        
        // 로그인 유지를 선택한 경우
        //if (loginDTO.isUseCookie()) {
            // 로그인 유지 유효기간 : 일주일
        //    int amount = 60 * 60 * 24 * 7;
            // 로그인 유지 유효 일자
        //   Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
            // 로그인 유지 기간 갱신(아이디, 세션아이디, 유효일자)
        //    userdao.keepLogin(userVO.getUid(), session.getId(), sessionLimit);
        //}
    }

    // 로그아웃 처리
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession session) throws Exception {
        // session에 저장된 login 값
        Object object = session.getAttribute("login");
        if (object != null) {
            UserVO userVO = (UserVO) object;
            // session 정보 삭제
            session.removeAttribute("login");
            // session 초기화
            session.invalidate();
            // 로그인 쿠키값
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                loginCookie.setPath("/");
                // 쿠키 유효기간 0
                loginCookie.setMaxAge(0);
                // 쿠키 저장
                response.addCookie(loginCookie);
                // 로그인 유지 갱신
                userdao.keepLogin(userVO.getUid(), session.getId(), new Date());
            }
        }

        return "user/logout";
    }

    // 회원 정보 페이지
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(HttpSession session, Model model) throws Exception {

        Object userObj = session.getAttribute("login");
        UserVO userVO = (UserVO) userObj;
        String uid = userVO.getUid();
        

        return "user/profile";
    }

    // 회원 정보 수정 처리

    // 비밀번호 수정 처리

    // 비밀번호 찾기
}
