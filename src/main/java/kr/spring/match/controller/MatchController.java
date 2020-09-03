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
	public ModelAndView process(HttpSession session) {
		ModelAndView mav =new ModelAndView();
		
		String user_id=(String)session.getAttribute("user_id");
		List<ClubVO> list = new ArrayList<ClubVO> ();
		List<ClubVO> myTeam = new ArrayList<ClubVO>();
		list=clubService.selectAllClubs();
		myTeam=clubService.selectMyClubs(user_id);
		for(ClubVO club : list) {
			logger.info("<<<<List>>>> : "+ club);
		}
		
		
		mav.setViewName("writeForm");
		mav.addObject("title", "매치 작성");
		mav.addObject("list",list);
		mav.addObject("myTeam",myTeam);
		
		return mav;
	}
	
	@RequestMapping("/match/write.do")
	public String registerMatch(MatchVO matchVO) {
		logger.info("<<<<matchVO>>>> : "+ matchVO);
		
		matchService.insertMatch(matchVO);
		
		return "redirect:/main/main.do";
	}
}
