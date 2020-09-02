package kr.spring.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@Resource
	private ClubService clubService;
	
	@RequestMapping("/main/main.do")
	public ModelAndView process(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user_id=(String) session.getAttribute("user_id");
		if(user_id!=null) {
			logger.info("<<<user_id>>> : " +user_id );
			
			//내 아이디가 소속된 클럽 번호를 받는다
			List<String> clubs_num=clubService.selectMyClubs_num(user_id);
			logger.info("<<<clubs_num>>> : " +clubs_num );
			//내가 소속한 클럽번호로  클럽 번호가 있는 match를 받는다.
			List<MatchVO> matchVO=new ArrayList<MatchVO>();
			for(String club_num : clubs_num) {
				matchVO.addAll(matchService.selectMyMatch(club_num));
			}
			mav.addObject("match_list",matchVO);
		}
		
		mav.setViewName("main");
		mav.addObject("title", "BANADANG");
		
		
		return mav; 
	}
	@RequestMapping("/main/voteForm.do")
	public ModelAndView vote(@RequestParam int match_num ) {
		
		ModelAndView mav = new ModelAndView();
		MatchVO match=matchService.selectMatchByMatch_num(match_num);
		mav.setViewName("vote");
		mav.addObject("match",match);
		mav.addObject("title","경기 투표");
		return mav;
	}
}
