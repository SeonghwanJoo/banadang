package kr.spring.member.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nimbusds.jwt.ReadOnlyJWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.AppleServicesResponse;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;
import kr.spring.member.domain.ReportVO;
import kr.spring.member.service.LoginAPI;
import kr.spring.member.service.MemberService;

@Controller
public class MemberAjaxController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private ClubService clubService;

	@Resource
	private MatchService matchService;

	@Resource
	private MemberService memberService;

	@Resource
	private LoginAPI loginAPI;

	@RequestMapping("/member/deleteRecruitReq.do")
	@ResponseBody
	public Map<String, Object> process(Integer recruit_req_num, Integer recruit_accept) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (recruit_accept == 1 || recruit_accept == 3) {
				memberService.deleteRecruitReq(recruit_req_num);
			} else if (recruit_accept == 2) {
				memberService.updateRecruitReqForCancel(recruit_req_num);
			}
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/kakaoSync.do")
	@ResponseBody
	public Map<String, Object> kakaoSync(HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		String access_token = (String) session.getAttribute("access_token");
		MemberVO member = new MemberVO();
		MemberVO profile = new MemberVO();
		try {

			member = loginAPI.getUserInfo(access_token);
			profile = loginAPI.getUpdatedUserInfo(access_token);
			member.setNickname(profile.getNickname());
			member.setThumbnail_image(profile.getThumbnail_image());
			member.setProfile_image(profile.getProfile_image());
			memberService.updateMember_detail(member);

			map.put("result", "success");

		} catch (Exception e) {
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/postClubRecruitRequest.do")
	@ResponseBody
	public Map<String, Object> postClubRecruitRequest(MatchVO match) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			// 가입 신청 여부 확인
			Integer clubRecruit_req_num = memberService.selectClubRecruit_reqForDuplicate(match);
			if (clubRecruit_req_num == null) {
				memberService.insertClubRecruitReq(match);
				map.put("result", "success");
			} else {
				map.put("result", "duplicated");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;

	}

	@RequestMapping("/member/deleteClubRecruitReq.do")
	@ResponseBody
	public Map<String, Object> deleteClubRecruitReq(@RequestParam Integer clubRecruit_req_num) {

		Map<String, Object> map = new HashMap<String, Object>();
		// 수락,대기,거절
		try {
			memberService.deleteClubRecruitReq(clubRecruit_req_num);
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/sendMsg.do")
	@ResponseBody
	public Map<String, Object> sendMsg(MsgVO msg) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			memberService.insertMsg(msg);
			HashSet<String> uids= new HashSet<String>();
			uids.add(msg.getReceiver());
			loginAPI.sendMessage(uids, "메시지가 도착했습니다.");
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;

	}

	@RequestMapping("/member/deleteMsgFromReceiver.do")
	@ResponseBody
	public Map<String, Object> deleteMsgFromReceiver(Integer msg_num) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Integer s_del = memberService.selectS_Del(msg_num);
			if (s_del == 1) {
				memberService.deleteMsgFromReceiver(msg_num);
			} else if (s_del == 2) {
				memberService.deleteMsg(msg_num);
			}
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/deleteMsgFromSender.do")
	@ResponseBody
	public Map<String, Object> deleteMsgFromSender(Integer msg_num) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Integer r_del = memberService.selectR_Del(msg_num);
			if (r_del == 1) {
				memberService.deleteMsgFromSender(msg_num);
			} else if (r_del == 2) {
				memberService.deleteMsg(msg_num);
			}
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/updateMsgStatus.do")
	@ResponseBody
	public Map<String, Object> updateMsgStatus(String receiver, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			memberService.updateMsgStatus(receiver);
			session.setAttribute("count_msg", 0);
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "success");
		}

		return map;
	}

	@RequestMapping("/member/nextClubRecruitPage.do")
	@ResponseBody
	public Map<String, Object> nextClubRecruitPage(MatchVO match) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<MatchVO> matches = memberService.selectClubRecruits(match);
			map.put("result", "success");
			map.put("matches", matches);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/unlink.do")
	@ResponseBody
	public Map<String, Object> unlink(MemberVO member, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			memberService.deleteMember(member);
			loginAPI.kakaoUnlink((String) session.getAttribute("access_Token"));
			session.invalidate();
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "errors");
		}

		return map;
	}

	@RequestMapping("/member/submitReport.do")
	@ResponseBody
	public Map<String, Object> submitReport(ReportVO report) {

		logger.info("report in submit report : " + report);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			memberService.insertReport(report);
			map.put("result", "success");
		} catch (Exception e) {
			map.put("result", "errors");
		}

		return map;

	}

	@RequestMapping("/member/insertMember.do")
	@ResponseBody
	public Map<String, Object> insertMember(@RequestParam(defaultValue = "2") Integer marketing,
											HttpSession session) {

		Integer loginType= (Integer) session.getAttribute("loginType");
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO member = (MemberVO) session.getAttribute("member");
		logger.info("marketing : "+marketing);
		logger.info("member : "+marketing );
		member.setMarketing(marketing);
		try {
			if (loginType % 2 == 1) {
				memberService.insertMember(member);
			} else {
				memberService.updateMemberForReValidation(member);
			}
			session.removeAttribute("member");
			session.removeAttribute("loginType");
			String user_id = member.getId();
			session.setAttribute("user_id", user_id);
			session.setAttribute("mem_auth", 1);
			map.put("result", "success");

		} catch (Exception e) {

			map.put("result", "errors");
		}

		return map;
	}
	

	@RequestMapping("/member/signInWithApple.do")
	@ResponseBody
	public Map<String, Object> signInWithApple(AppleServicesResponse appleResp,
											   HttpSession session,
											   @RequestParam(required=false) boolean state,
											   HttpServletResponse response) {

		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("signInWithApple.do 진입 ");
		logger.info("data : " + appleResp);
		
		//code, id_token, state, user(name, email) 정보를 받는다 by ajax
		//id_token으로 decode해서 validation check를 한다
		String user_id="";
		
		try {
			SignedJWT signedJWT = SignedJWT.parse(appleResp.getId_token());
			ReadOnlyJWTClaimsSet payload = signedJWT.getJWTClaimsSet();
			user_id=payload.getStringClaim("sub");
			logger.info("sub in signInWithApple : "+user_id);
			if(state) {
				Cookie loginCookie=new Cookie("AppSi", user_id);
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*60);
				response.addCookie(loginCookie);
			}
			MemberVO existingMember=memberService.getMember(user_id);
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
        		
        		
        		MemberVO member=new MemberVO();
        		member.setId(user_id);
        		member.setEmail(appleResp.getEmail());
        		member.setNickname(appleResp.getNickname());
        		session.setAttribute("member", member);
        		session.setAttribute("loginType",loginType);
        		
        		map.put("loginType", loginType);
        		map.put("result", "success");
        		
        		return map;
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
            
            map.put("result", "success");
			
		}catch (ParseException e) {
			e.printStackTrace(); 
		}
		//validation 이 false이면 로그인 실패로 process를 close한다
		//validation이 true이면 sub, name, email, refresh token
		//sub가 기존 유저 인지 아닌지 확인해서 신규 유저이면 신규 아이디로 등록한다
		//기존 유저이면 로그인 처리한다
		//애플 로그인 후 session이 만료되었을 때 자동 로그인 어떻게 처리 할지?
		//1.refreshtoken 은 하루에 1회만 호출 가능, 2. sub 가 변하는 값인지?
		//sub로 쿠키를 만든다. 해당 login interceptor에서 해당 아이디로 로그인한다.
		
		//로그아웃? session을 삭제 하고 쿠키도 삭제한다
		//탈퇴

		return map;
	}
}
