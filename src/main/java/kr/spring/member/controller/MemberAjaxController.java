package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.club.service.ClubService;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.MemberVO;
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
}
