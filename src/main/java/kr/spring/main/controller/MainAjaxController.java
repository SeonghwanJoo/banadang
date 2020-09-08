package kr.spring.main.controller;

import java.util.ArrayList;
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
public class MainAjaxController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@RequestMapping("/main/vote.do")
	@ResponseBody
	public Map<String,Integer> process(@RequestParam String id,
									  @RequestParam int match_num,
									  @RequestParam String club_num,//참석할 팀의 클럽 번호
									  @RequestParam int status){
		
		logger.info("<<<<<AjaxData>>>>> : "+id+"/"+match_num+"/"+club_num+"/"+status);
		Map<String,Integer> map=new HashMap<String,Integer>();
		MatchVO matchVO=new MatchVO();
		matchVO.setId(id);
		matchVO.setMatch_num(match_num);
		matchVO.setClub_num(club_num);
		matchVO.setStatus(status);
		//해당 매치에 해당 아이디로 투표 결과가 있는지 확인
		String myVote=matchService.selectMyVoteNum(matchVO);
		if(myVote!=null) {
			matchVO.setVote_num(myVote);
			matchService.updateVoteStatus(matchVO);
		}else if(myVote==null) {
			matchService.insertVoteStatus(matchVO);
		}
		
		ArrayList<MatchVO> vote_status=new ArrayList<MatchVO>();
		vote_status=matchService.selectVoteStatusByGroup(matchVO);
		Integer attend=0, not_attend=0, undefined=0;
		for(MatchVO vote_result: vote_status) {
			if(vote_result.getStatus()==1) {
				attend=vote_result.getCount();
			}
			if(vote_result.getStatus()==2) {
				not_attend=vote_result.getCount();
			}
			if(vote_result.getStatus()==3) {
				undefined=vote_result.getCount();
			}
		}
		logger.info("<<<attend>>> :"+attend);
		logger.info("<<<not_attend>>> :"+not_attend);
		logger.info("<<<undefined>>> :"+undefined);
		map.put("attend",attend );
		map.put("not_attend", not_attend);
		map.put("undefined", undefined);
		
		return map;
	}
}
