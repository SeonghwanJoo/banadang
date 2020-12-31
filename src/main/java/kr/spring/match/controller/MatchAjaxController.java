package kr.spring.match.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;

@Controller
public class MatchAjaxController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@RequestMapping("/match/postMatchRequest.do")
	@ResponseBody
	public Map<String,String> process(MatchVO match){
		Map<String,String> map=new HashMap<String,String>();
		
		//해당 매치에 해당클럽의 매치 신청이 있는지 확인
		
		try {
			Integer request_num=matchService.selectMyRequestForMatchToInvite(match);
			if(request_num!=null) {
				map.put("result", "duplicated");
			}else if(request_num==null) {
				matchService.insertMyRequestForMatchToInvite(match);
				map.put("result", "requested");
			}
		}catch (Exception e) {
			
			map.put("result", "errors");
		}
		
		
		return map;
	}
	@RequestMapping("/match/postRecruit.do")
	@ResponseBody
	public Map<String,Object> postRecruit(MatchVO match) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		try {
			Integer recruit_num=matchService.selectRecruit_num(match);
			if(recruit_num!=null) {
				map.put("result", "duplicated");
			}else {
				matchService.insertRecruit(match);
				map.put("result", "inserted");
				map.put("recruit_num",match.getRecruit_num());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
				
		return map;
	}
	@RequestMapping("/match/updateRecruit.do")
	@ResponseBody
	public Map<String,Object> updateRecruit(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			matchService.updateRecruit(match);
			map.put("result", "updated");
			map.put("recruit_num", match.getRecruit_num());
		}catch(Exception e) {
			map.put("result", "errors");
		}
		
		return map;
	}
	
	@RequestMapping("/match/updateMatch.do")
	@ResponseBody
	public Map<String,Object> updateMatch(MatchVO match){
		
		Map<String,Object> map=new HashMap<String, Object>();
		try {
			matchService.updateMatch(match);
			map.put("result", "updated");
		}catch(Exception e) {
			map.put("result", "errors");
		}
		return map;
		
	}
	
	@RequestMapping("/match/postRecruitRequest.do")
	@ResponseBody
	public Map<String,Object> postRecruitRequest(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		try {
			Integer recruit_req_num=matchService.selectRecruit_req_num(match);
			if(recruit_req_num!=null) {
				map.put("result", "duplicated");
			}else {
				matchService.insertRecruitRequest(match);
				map.put("result", "requested");
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
		
	}
	@RequestMapping("/match/nextPage.do")
	@ResponseBody
	public Map<String,Object> nextPage(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		String period=match.getPeriod();
		if(period!="" && period!=null) {
			
			String[] values=period.split(" ~ ");
			match.setStart(java.sql.Date.valueOf(values[0]));
			match.setEnd(java.sql.Date.valueOf(values[1]));
		}
		try {
			List<MatchVO> matches=matchService.selectMatchToInviteWithFilter(match);
			map.put("result", "success");
			map.put("matches", matches);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
	}
	
	@RequestMapping("/match/nextRecruitPage.do")
	@ResponseBody
	public Map<String,Object> nextRecruitPage(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		String period=match.getPeriod();
		if(period!="" && period!=null) {
			
			String[] values=period.split(" ~ ");
			match.setStart(java.sql.Date.valueOf(values[0]));
			match.setEnd(java.sql.Date.valueOf(values[1]));
		}
		try {
			List<MatchVO> matches=matchService.selectRecruitWithFilter(match);
			map.put("result", "success");
			map.put("matches", matches);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
	}
	
	
	
	
}
