package kr.spring.match.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
}
