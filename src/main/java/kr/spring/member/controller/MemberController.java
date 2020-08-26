package kr.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.member.service.LoginAPI;

@Controller
public class MemberController {

	@Resource
	private LoginAPI loginAPI;

	@RequestMapping("/member/login.do")
	public String kakaoLogin(@RequestParam String code, HttpSession session)throws IOException {	

		String access_Token = loginAPI.getAccessToken(code);
        System.out.println("controller access_token : " + access_Token);
        HashMap<String, Object> userInfo = loginAPI.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("user_id", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
		return "redirect:/main/main.do";
	}
	@RequestMapping("/member/logout.do")
	public String kakaoLogout(HttpSession session) {
		loginAPI.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.invalidate();
	    return "redirect:/main/main.do";
	}

}
