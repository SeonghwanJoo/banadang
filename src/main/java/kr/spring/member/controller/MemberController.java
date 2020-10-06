package kr.spring.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.LoginAPI;
import kr.spring.member.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private LoginAPI loginAPI;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private ClubService clubService;

	@RequestMapping("/member/login.do")
	public String kakaoLogin(@RequestParam String code,HttpSession session)throws IOException {	
		
		String access_Token = loginAPI.getAccessToken(code,false);
        logger.info("controller access_token : " + access_Token);
        MemberVO memberVO=new MemberVO();
        memberVO = loginAPI.getUserInfo(access_Token);
        logger.info("login Controller : " + memberVO);
        
        String user_id=memberVO.getId();
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (memberVO != null) {
        
        	//memberVO의 아이디가 DB에 기 등록된 id인지 확인
        	MemberVO existingMember=memberService.getMember(user_id);
        	//등록되어 있으면 session setting
        	if(existingMember == null) {//등록되어 있지 않으면 insert로 회원정보 추가 후 session setting
        		memberService.insertMember(memberVO);
        	}
        	
        	List<ClubVO> myClubs=clubService.selectMyClubs(user_id);
        	session.setAttribute("user_id", user_id);
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("myClubs", myClubs);
            logger.info("<<myClubs>> : "+myClubs);
            if(myClubs.size()>0) {
            	session.setAttribute("myClub", myClubs.get(0));
            }
            
            
            logger.info("<<<<<<<myTeam>>>>>>>>>> : "+myClubs);
        }
		return "redirect:/main/main.do";
	}
	@RequestMapping("/member/invitedLogin.do")
	public String invitedKakaoLogin(@RequestParam String code,
									@RequestParam String state,
									HttpSession session)throws IOException {	
		
		logger.info("state : " +state);
		String access_Token = loginAPI.getAccessToken(code,true);
        logger.info("controller access_token : " + access_Token);
        MemberVO memberVO=new MemberVO();
        memberVO = loginAPI.getUserInfo(access_Token);
        logger.info("login Controller : " + memberVO);
        
        String user_id=memberVO.getId();
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (memberVO != null) {
        
        	//memberVO의 아이디가 DB에 기 등록된 id인지 확인
        	MemberVO existingMember=memberService.getMember(user_id);
        	//등록되어 있으면 session setting
        	if(existingMember == null) {//등록되어 있지 않으면 insert로 회원정보 추가 후 session setting
        		memberService.insertMember(memberVO);
        	}
        	
        	List<ClubVO> myClubs=clubService.selectMyClubs(user_id);
        	session.setAttribute("user_id", user_id);
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("myClubs", myClubs);
            logger.info("<<myClubs>> : "+myClubs);
            if(myClubs.size()>0) {
            	session.setAttribute("myClub", myClubs.get(0));
            }
            logger.info("<<<<<<<myTeam>>>>>>>>>> : "+myClubs);
        }
        String[] values=state.split("-");
        Integer club_num=Integer.parseInt(values[0]);
        String nickname=URLEncoder.encode(values[1],"utf-8");
        logger.info("nickname : "+nickname);
		return "redirect:/club/inviteMember.do?club_num="+club_num+"&nickname="+nickname;
	}
	@RequestMapping("/member/logout.do")
	public String kakaoLogout(HttpSession session) {
		loginAPI.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.invalidate();
	    return "redirect:/main/main.do";
	}

}
