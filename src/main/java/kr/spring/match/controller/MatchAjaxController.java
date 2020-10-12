package kr.spring.match.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;

@Controller
public class MatchAjaxController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@RequestMapping("/match/postMatchRequest.do")
	@ResponseBody
	public Map<String,String> process(@RequestParam Integer match_num,
									  @RequestParam String id,
									  @RequestParam Integer away,
									  @RequestParam String invite_detail){
		logger.info("<<<<<AjaxData>>>>> : "+id+"/"+match_num+"/"+away+"/"+invite_detail);
		Map<String,String> map=new HashMap<String,String>();
		MatchVO match=new MatchVO();
		match.setMatch_num(match_num);
		match.setId(id);
		match.setAway(away);
		match.setInvite_detail(invite_detail);
		//해당 매치에 해당클럽의 매치 신청이 있는지 확인
		Integer request_num=matchService.selectMyRequestForMatchToInvite(match);
		if(request_num!=null) {
			map.put("result", "duplicated");
		}else if(request_num==null) {
			matchService.insertMyRequestForMatchToInvite(match);
			map.put("result", "requested");
		}
		logger.info("map",map);
		
		return map;
	}
	@RequestMapping("/match/postRecruit.do")
	@ResponseBody
	public Map<String,Object> postRecruit(@RequestParam Integer match_num,
									  	  @RequestParam String id,
									  	  @RequestParam Integer club_num,
									  	  @RequestParam String[] recruit_positions,
									  	  @RequestParam Integer recruit_count,
									  	  @RequestParam String recruit_cost,
									  	  @RequestParam String recruit_detail) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		MatchVO match=new MatchVO();
		match.setMatch_num(match_num);
		match.setId(id);
		match.setClub_num(club_num);
		match.setRecruit_cost(recruit_cost);
		match.setRecruit_count(recruit_count);
		match.setRecruit_detail(recruit_detail);
		match.setRecruit_position(Arrays.toString(recruit_positions));
		
		try {
			logger.info("recruit_num : "+match.getRecruit_num());
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
	public Map<String,Object> updateRecruit(@RequestParam Integer recruit_num,
											@RequestParam String id,
		  	  								@RequestParam String[] recruit_positions,
		  	  								@RequestParam Integer recruit_count,
		  	  								@RequestParam String recruit_cost,
		  	  								@RequestParam String recruit_detail){
		
		Map<String,Object> map=new HashMap<String,Object>();
		MatchVO match=new MatchVO();
		match.setRecruit_num(recruit_num);
		match.setId(id);
		match.setRecruit_cost(recruit_cost);
		match.setRecruit_count(recruit_count);
		match.setRecruit_position(Arrays.toString(recruit_positions));
		match.setRecruit_detail(recruit_detail);
		try {
			
		}catch(Exception e) {
			
		}
		
		return map;
	}
	
	@RequestMapping("/match/postRecruitRequest.do")
	@ResponseBody
	public Map<String,Object> postRecruitRequest(@RequestParam String id,
												 @RequestParam Integer match_num,
												 @RequestParam Integer club_num,
												 @RequestParam String recruit_position,
												 @RequestParam String recruit_req_detail){
		
		Map<String,Object> map=new HashMap<String,Object>();
		MatchVO match=new MatchVO();
		//신청한 recruit_req_detail이 있는지 확인
		match.setId(id);
		match.setMatch_num(match_num);
		match.setClub_num(club_num);
		match.setRecruit_position(recruit_position);
		match.setRecruit_req_detail(recruit_req_detail);
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
}
