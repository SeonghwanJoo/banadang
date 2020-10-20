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
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
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
        MemberVO memberVO=new MemberVO();
        memberVO = loginAPI.getUserInfo(access_Token);
        
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
            
            if(myClubs.size()>0) {
            	ClubVO club=new ClubVO();
                club.setId(user_id);
                club.setClub_num(myClubs.get(0).getClub_num());
            	session.setAttribute("myClub", clubService.selectMyClubDetails(club));
            }
        }
		return "redirect:/main/main.do";
	}
	@RequestMapping("/member/kakaoSync.do")
	public String kakaoSync(HttpSession session) {
		String access_Token=(String)session.getAttribute("access_Token");
		MemberVO member=new MemberVO();
		MemberVO profile=new MemberVO();
		member=loginAPI.getUserInfo(access_Token);
		profile=loginAPI.getUpdatedUserInfo(access_Token);
		member.setNickname(profile.getNickname());
		member.setThumbnail_image(profile.getThumbnail_image());
		member.setProfile_image(profile.getProfile_image());
		try {
			memberService.updateMember_detail(member);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/member/myPage.do";
	}
	@RequestMapping("/member/invitedLogin.do")
	public String invitedKakaoLogin(@RequestParam String code,
									@RequestParam String state,
									HttpSession session)throws IOException {	
		
		String access_Token = loginAPI.getAccessToken(code,true);
        MemberVO memberVO=new MemberVO();
        memberVO = loginAPI.getUserInfo(access_Token);
        
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
            if(myClubs.size()>0) {
            	ClubVO club=new ClubVO();
                club.setId(user_id);
                club.setClub_num(myClubs.get(0).getClub_num());
            	session.setAttribute("myClub", clubService.selectMyClubDetails(club));
            }
        }
        String[] values=state.split("-");
        Integer club_num=Integer.parseInt(values[0]);
        String nickname=URLEncoder.encode(values[1],"utf-8");
		return "redirect:/club/inviteMember.do?club_num="+club_num+"&nickname="+nickname;
	}
	@RequestMapping("/member/logout.do")
	public String kakaoLogout(HttpSession session) {
		loginAPI.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.invalidate();
	    return "redirect:/main/main.do";
	}
	@RequestMapping("/member/myRecruitReq.do")
	public ModelAndView myRecruitReq(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		String user_id=(String)session.getAttribute("user_id");
		try {
			
			List<MatchVO> matches=memberService.selectMyRecruitReq(user_id);
			mav.addObject("matches",matches);
			logger.info("isCanceled : "+matches.get(0).getIsCanceled());
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("title","나의 용병 신청 현황");
		mav.setViewName("myRecruitReq");
		return mav;
	}
	@RequestMapping("/member/myPage.do")
	public ModelAndView myPage(HttpSession session) {
		
		
		ModelAndView mav=new ModelAndView();
		String user_id=(String)session.getAttribute("user_id");
		MemberVO member=memberService.getMember(user_id);
		mav.addObject("member",member);
		mav.setViewName("myPage");
		mav.addObject("title","나의 페이지");
		return mav;
	}
	@RequestMapping("/member/myMsg.do")//나의 메시지함
	public ModelAndView myMsg(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		return mav;
		
	}

}
