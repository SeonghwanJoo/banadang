package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;
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
	
	
	@RequestMapping("/member/deleteRecruitReq.do")
	@ResponseBody
	public Map<String,Object> process(Integer recruit_req_num,Integer recruit_accept){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			if(recruit_accept==1||recruit_accept==3) {
				memberService.deleteRecruitReq(recruit_req_num);
			}else if(recruit_accept==2) {
				memberService.updateRecruitReqForCancel(recruit_req_num);
			}
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result","errors");
		}
		
		return map;
	}
	@RequestMapping("/member/postClubRecruitRequest.do")
	@ResponseBody
	public Map<String,Object> postClubRecruitRequest(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			//가입 신청 여부 확인
			Integer clubRecruit_req_num=memberService.selectClubRecruit_reqForDuplicate(match);
			if(clubRecruit_req_num==null) {
				memberService.insertClubRecruitReq(match);
				map.put("result", "success");
			}else {
				map.put("result", "duplicated");
			}
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
		
	}
	@RequestMapping("/member/deleteClubRecruitReq.do")
	@ResponseBody
	public Map<String,Object> deleteClubRecruitReq(@RequestParam Integer clubRecruit_req_num){
		
		Map<String,Object> map=new HashMap<String,Object>();
		//수락,대기,거절
		try {
			memberService.deleteClubRecruitReq(clubRecruit_req_num);
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
	}
	@RequestMapping("/member/sendMsg.do")
	@ResponseBody
	public Map<String,Object> sendMsg(MsgVO msg){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			memberService.insertMsg(msg);
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
		
	}
	@RequestMapping("/member/deleteMsgFromReceiver.do")
	@ResponseBody
	public Map<String,Object> deleteMsg(Integer msg_num){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			Integer s_del=memberService.selectS_Del(msg_num);
			if (s_del ==1) {
				memberService.deleteMsgFromReceiver(msg_num);
			}else if(s_del==2) {
				memberService.deleteMsg(msg_num);
			}
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
	}
}
