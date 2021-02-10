package kr.spring.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;
import kr.spring.member.domain.ReportVO;
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
	
	@Resource
	private MatchService matchService;

	@RequestMapping("/member/login.do")
	public String kakaoLogin(@RequestParam String code,
							 @RequestParam(required=false) boolean state,
							 HttpSession session,
							 HttpServletRequest request,
							 HttpServletResponse response)throws IOException {	
		
		String serverName = request.getServerName();
		String path= request.getContextPath();
		String uri=null;
		
		if (serverName.contains("gentle")) uri="https://";
		else uri="http://";
		
		uri+=serverName+path;
		
		Map<String, String> map = loginAPI.getAccessToken(code,1,uri);
		
		if(map.get("result")!=null && map.get("result").equals("errors")) {
			return "redirect:/main/loginFailure.do";
		}
		
		String access_token=map.get("access_token");
		String refresh_token=map.get("refresh_token");
		
		session.setAttribute("access_token", access_token);
		if(state) {
			Cookie loginCookie=new Cookie("GpFHzB",refresh_token);
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*60);
			response.addCookie(loginCookie);
		}
		
		
		
        MemberVO memberVO=new MemberVO();
        memberVO = loginAPI.getUserInfo(access_token);
        if(memberVO.getResponseCode()!=null && memberVO.getResponseCode()!=200) {
        	return "redirect:/main/loginFailure.do";
        }
        String user_id=memberVO.getId();
        
        try {
            if (memberVO != null) {
                
            	//memberVO의 아이디가 DB에 기 등록된 id인지 확인
            	MemberVO existingMember=memberService.getMember(user_id);
            	//등록되어 있으면 session setting
            	if(existingMember !=null && existingMember.getMem_auth()!=3) {
            		session.setAttribute("mem_auth", existingMember.getMem_auth());
            	}else{
            		
            		int loginType;
            		//기존회원이 아니면
            		//회원 정보,state,code,login.do,재가입회원인지,invitedlogin인지 votelogin인지 구별 값을 담아  model에 addAttribute한다
            		if(existingMember==null) {
            			loginType=1;
            		}else {
            			loginType=2;
            		}
            		//loginType 1,2 login.do&&각각 신규회원/재가입회원
            		//loginType 3,4 invitedLogin.do&&각각 신규회원/재가입회원
            		//loginType 5,6 votedLogin.do&&각각 신규회원/재가입회원
            		session.setAttribute("member",memberVO);
            		session.setAttribute("code",code);
            		session.setAttribute("loginType",loginType);
            		return "redirect:/member/agreement.do";
            		// 약간 동의 페이지로 redirect한다
            		// 약관 동의 페이지에서 필수 항목 선택시 화면 회원 가입 버튼을 disable속성을 없앤다
            		//가입버튼을 누르면 해당 멤버 정보르 insert/update하고 code와 state값을 담아 login.do로 redirect한다
					
            		/* memberService.insertMember(memberVO); 
            		 * session.setAttribute("mem_auth", 1);
					 */
            	}
            	
            	List<ClubVO> myClubs=clubService.selectMyClubs(user_id);
            	session.setAttribute("user_id", user_id);
                session.setAttribute("myClubs", myClubs);
                
                if(myClubs.size()>0) {
                	ClubVO club=new ClubVO();
                    club.setId(user_id);
                    club.setClub_num(myClubs.get(0).getClub_num());
                	session.setAttribute("myClub", clubService.selectMyClubDetails(club));
                }
            }
        }catch (Exception e) {
        	return "redirect:/main/loginFailure.do";
        }
        
		return "redirect:/main/main.do";
	}
	@RequestMapping("/member/invitedLogin.do")
	public String invitedKakaoLogin(@RequestParam String code,
									@RequestParam String state,
									HttpSession session,
									HttpServletRequest request,
									HttpServletResponse response)throws IOException {	
		
		String uri="https://"+request.getServerName()+request.getContextPath();
		
		Map<String, String> map = loginAPI.getAccessToken(code,0,uri);
		if(map.get("result")!=null && map.get("result").equals("errors")) {
			return "redirect:/main/loginFailure.do";
		}
		String[] values=state.split("-");
		String access_token=map.get("access_token");
		String refresh_token=map.get("refresh_token");
        MemberVO memberVO=new MemberVO();
        memberVO = loginAPI.getUserInfo(access_token);
        session.setAttribute("access_token", access_token);
        if(values.length>1) {
        	
			Cookie loginCookie=new Cookie("GpFHzB",refresh_token);
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*60);
			response.addCookie(loginCookie);
		}
        String user_id=memberVO.getId();
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        try{
         	if (memberVO != null) {
                
            	//memberVO의 아이디가 DB에 기 등록된 id인지 확인
            	MemberVO existingMember=memberService.getMember(user_id);
            	//등록되어 있으면 session setting
            	if(existingMember !=null && existingMember.getMem_auth()!=3)  {
            		session.setAttribute("mem_auth", existingMember.getMem_auth());
            	}else{
            		int loginType;
            		if(existingMember==null) {
            			loginType=3;
            		}else {
            			loginType=4;
            		}
            		session.setAttribute("member",memberVO);
            		session.setAttribute("code",code);
            		session.setAttribute("loginType",loginType);
            		session.setAttribute("state", values[0]);
            		return "redirect:/member/agreement.do";
            	}
            	
            	List<ClubVO> myClubs=clubService.selectMyClubs(user_id);
            	session.setAttribute("user_id", user_id);
                session.setAttribute("myClubs", myClubs);
                
            }
            
    		
        }catch(Exception e) {
        	
        	return "redirect:/main/loginFailure.do";
        	
        }
       
        
		return "redirect:/club/inviteMember.do?club_num="+values[0];
   
	}

	@RequestMapping("/member/agreement.do")
	public ModelAndView agreement() {
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "약관 및 이용 동의");
		mav.setViewName("agreement");
		
		return mav;
	}
	@RequestMapping("/member/policy.do")
	public ModelAndView policy() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "약관 및 정책");
		mav.setViewName("policy");
		
		return mav;
	}
	@RequestMapping("/member/service.do")
	public ModelAndView service() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "서비스 이용 약관");
		mav.setViewName("service");
		
		return mav;
	}
	@RequestMapping("/member/privacy.do")
	public ModelAndView privacy() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "개인정보 보호 정책");
		mav.setViewName("privacy");
		
		return mav;
	}
	
	@RequestMapping("/member/logout.do")
	public String kakaoLogout(HttpSession session) {
		loginAPI.kakaoLogout((String)session.getAttribute("access_token"));
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("title","나의 용병 신청 현황");
		mav.setViewName("myRecruitReq");
		return mav;
	}
	@RequestMapping("/member/clubRecruit.do")
	public ModelAndView clubRecruit(MatchVO match) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("title","팀원 모집");
		mav.addObject("type",match.getType());
		mav.setViewName("clubRecruit");
		
		return mav;
	}
	@RequestMapping("/member/writeClubRecruit.do")
	public ModelAndView writeClubRecruit() {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title","팀원 모집 작성");
		mav.setViewName("writeClubRecruit");
		
		return mav;
	}
	@RequestMapping("/member/postClubRecruit.do")
	public String postClubRecruit(MatchVO match) {
		
		try {
			memberService.insertClubRecruit(match);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/member/clubRecruitDetail.do?clubRecruit_num="+match.getClubRecruit_num();
	}
	@RequestMapping("/member/clubRecruitDetail.do")
	public ModelAndView clubRecruitDetail(@RequestParam Integer clubRecruit_num) {
		
		ModelAndView mav=new ModelAndView();
		try {
			MatchVO clubRecruit=memberService.selectClubRecruitWithClubDetail(clubRecruit_num);
			mav.addObject("clubRecruit",clubRecruit);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("title", "팀원 모집");
		mav.setViewName("clubRecruitDetail");
		return mav;
	}
	@RequestMapping("/member/modifyClubRecruit.do")
	public ModelAndView modifyRecruit(@RequestParam Integer clubRecruit_num,@RequestParam Integer club_num) {
		ModelAndView mav=new ModelAndView();
		MatchVO match=memberService.selectClubRecruitWithClubDetail(clubRecruit_num);
		mav.addObject("match", match);
		mav.addObject("title","팀원 모집 수정");
		mav.setViewName("modifyClubRecruit");
		
		return mav;
	}
	@RequestMapping("/member/deleteClubRecruit.do")
	public String deleteRecruit(@RequestParam Integer clubRecruit_num,@RequestParam Integer club_num) {
		
		memberService.deleteClubRecruit(clubRecruit_num);
		
		return "redirect:/member/clubRecruit.do";
		
	}
	@RequestMapping("/member/postUpdatedClubRecruit.do")
	public ModelAndView postUpdatedClubRecruit(MatchVO match) {
		
		memberService.updateClubRecruit(match);
		
		
		return clubRecruitDetail(match.getClubRecruit_num());
	}
	
	@RequestMapping("/member/myPage.do")
	public ModelAndView myPage(HttpSession session) {
		
		
		ModelAndView mav=new ModelAndView();
		String user_id=(String)session.getAttribute("user_id");
		MemberVO member=memberService.getMember(user_id);
		mav.addObject("member",member);
		mav.setViewName("myPage");
		mav.addObject("title","더보기");
		return mav;
	}
	
	@RequestMapping("/member/myClubRecruitReq.do")
	public ModelAndView myClubRecruitReq(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		String user_id=(String)session.getAttribute("user_id");
		List<MatchVO> matches=memberService.selectMyClubRecruitReq(user_id);
		mav.addObject("matches", matches);
		mav.addObject("title","나의 팀 가입 신청 현황");
		mav.setViewName("myClubRecruitReq");
		
		return mav;
	}
	
	@RequestMapping("/member/myMsg.do")//나의 메시지함
	public ModelAndView myMsg(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		String receiver=(String)session.getAttribute("user_id");
		List<MsgVO> msgs=memberService.selectReceivedMsg(receiver);
		mav.addObject("msgs",msgs);
		mav.addObject("title","받은 메시지");
		mav.setViewName("myMsg");
		
		return mav;
		
	}
	@RequestMapping("/member/writeMsg.do")
	public ModelAndView writeMsg(MsgVO input) {
		
		
		ModelAndView mav=new ModelAndView();

		MsgVO msg=memberService.selectMatchForMsg(input);
		
		mav.addObject("msg",msg);
		mav.addObject("title","메시지 작성");
		mav.setViewName("writeMsg");
		
		return mav;
		
	}
	@RequestMapping("/member/appSetting.do")
	public ModelAndView setApp(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title","앱 설정");
		mav.setViewName("appSetting");
		
		return mav;
	}
	
	@RequestMapping("/member/writeReport.do")
	public ModelAndView writeReport(ReportVO report) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("report", report);
		mav.addObject("title", "신고하기");
		mav.setViewName("writeReport");
		
		return mav;
	}
	
	@RequestMapping("/member/sentMsg.do")
	public ModelAndView sentMsg(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		String sender=(String)session.getAttribute("user_id");
		List<MsgVO> msgs=memberService.selectSentMsg(sender);
		mav.addObject("msgs",msgs);
		mav.addObject("title","보낸 메시지");
		mav.setViewName("sentMsg");
		
		return mav;
	}

}
