package kr.spring.club.controller;


import java.io.File;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		
		String id=(String)session.getAttribute("user_id");
		List<ClubVO> myClubs=clubService.selectMyClubs(id);
		ModelAndView mav=new ModelAndView();
		session.setAttribute("myClubs", myClubs);
		mav.setViewName("myClub");
		mav.addObject("title", "팀 관리");
		
		return mav;
	}
	@RequestMapping("/club/manageClub.do")
	public ModelAndView manageClub(@RequestParam Integer club_num,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		//클럽정보를 받아서 manage_club 으로 session에 저장한다
		//팀명,연령,주소,유니폼,매너평가,실력평가,평가수
		ClubVO myClub=clubService.selectClubDetailWithClub_num(club_num);
		List<ClubVO> away_club=clubService.selectAwayDetailsForRequestedMatch(club_num);
		List<ClubVO> home_club=clubService.selectHomeDetailsForRequestedMatch(club_num);
		session.setAttribute("myClub", myClub);
		logger.info("<<club_img>> : "+Arrays.toString(myClub.getClub_img()));
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
	public String viewImage(@RequestParam Integer club_num,Model model) {
		
		logger.info("imageViewController진입");
		ClubVO club=clubService.selectClubDetailWithClub_num(club_num);
			
		model.addAttribute("imageFile",club.getClub_img());
		model.addAttribute("filename",club.getFilename());
		
		
		return "imageView";
	}
	
}
