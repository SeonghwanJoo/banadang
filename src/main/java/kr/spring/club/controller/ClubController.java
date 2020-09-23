package kr.spring.club.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;

@Controller
public class ClubController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ClubService clubService; 
	
	@RequestMapping("/club/club.do")
	public ModelAndView process(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("myClub");
		mav.addObject("title", "팀 관리");
		
		return mav;
	}
	@RequestMapping("/club/manageClub.do")
	public ModelAndView manageClub(@RequestParam String club_num,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		//클럽정보를 받아서 manage_club 으로 session에 저장한다
		//팀명,연령,주소,유니폼,매너평가,실력평가,평가수
		ClubVO myClub=clubService.selectClubDetailWithClub_num(club_num);
		List<ClubVO> away_club=clubService.selectAwayDetailsForRequestedMatch(club_num);
		List<ClubVO> home_club=clubService.selectHomeDetailsForRequestedMatch(club_num);
		session.setAttribute("myClub", myClub);
		mav.addObject("away_club", away_club);
		mav.addObject("home_club", home_club);
		mav.addObject("title","팀 관리");
		mav.setViewName("manageClub");
		
		return mav;
	}
	@RequestMapping("/club/createClubForm.do")
	public ModelAndView createClubForm() {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title", "팀 만들기");
		mav.setViewName("createClubForm");
		
		return mav;
	}
	@RequestMapping("/club/imageView.do")
	public ModelAndView viewImage(@RequestParam String club_num) {
		
		logger.info("imageViewController진입");
		ModelAndView mav = new ModelAndView();
		ClubVO club=clubService.selectClubDetailWithClub_num(club_num);
		mav.setViewName("imageView");
		mav.addObject("imageFile",club.getClub_img());
		mav.addObject("filename",club.getFilename());
		
		return mav;
	}
	
}
