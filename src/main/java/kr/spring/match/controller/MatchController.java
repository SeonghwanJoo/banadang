package kr.spring.match.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.util.LocationDistance;

@Controller
public class MatchController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@Resource
	private ClubService clubService; 
	
	@ModelAttribute
	public MatchVO initCommand() {
		return new MatchVO();
	}
	
	@RequestMapping("/match/writeForm.do")
	public ModelAndView process() {
		ModelAndView mav =new ModelAndView();
		
		List<ClubVO> list = new ArrayList<ClubVO> ();
		list=clubService.selectAllClubs();
		for(ClubVO club : list) {
			logger.info("<<<<List>>>> : "+ club);
		}
		
		
		mav.setViewName("writeForm");
		mav.addObject("title", "매치 작성");
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping("/match/write.do")
	public String registerMatch(MatchVO matchVO) {
		logger.info("<<<<matchVO>>>> : "+ matchVO);
		
		matchService.insertMatch(matchVO);
		
		return "redirect:/main/main.do";
	}
	@RequestMapping("/match/match_toInvite.do")
	public ModelAndView inviteList() {
		
		ModelAndView mav=new ModelAndView();
		List<MatchVO> matchVO=matchService.selectMatchToInvite();
		
		mav.setViewName("invite_match");
		mav.addObject("title","경기 매치");
		mav.addObject("matchVO", matchVO);
		logger.info("<<<matchVO>>>"+matchVO);
		
		return mav;
	}
	@RequestMapping("/match/invite_detail.do")
	public ModelAndView inviteDetail(@RequestParam Integer match_num) {
		
		ModelAndView mav=new ModelAndView();
		MatchVO match=matchService.selectMatchToInviteByMatch_num(match_num);
		
		mav.setViewName("invite_detail");
		mav.addObject("title","경기 신청");
		mav.addObject("match", match);
		logger.info("<<<matchVO>>>"+match);
		
		return mav;
	}
}
