package kr.spring.club.controller;


import java.io.File;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
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
import kr.spring.main.controller.MainController;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;

@Controller
public class ClubController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ClubService clubService; 
	
	@Resource
	private MatchService matchService;
	
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
		//팀명,연령,주소,유니폼,매너평가,실력평가,평가수
		ClubVO myClub=clubService.selectClubDetailWithClub_num(club_num);
		List<ClubVO> away_club=clubService.selectAwayDetailsForRequestedMatch(club_num);
		List<ClubVO> home_club=clubService.selectHomeDetailsForRequestedMatch(club_num);
		session.setAttribute("myClub", myClub);
		mav.addObject("away_club", away_club);
		mav.addObject("home_club", home_club);
		mav.addObject("title","팀 관리");
		//경기 일정 정보 Object에 추가
		List<MatchVO> matchVO=new ArrayList<MatchVO>();
		ArrayList<MatchVO> vote_status=new ArrayList<MatchVO>();
		ArrayList<MatchVO> clubs_rating=new ArrayList<MatchVO>();
		List<MatchVO> past_match=new ArrayList<MatchVO>();
			
		matchVO.addAll(matchService.selectMyMatch(club_num));
		past_match.addAll(matchService.selectMyPastMatch(club_num));
			
		
		for(MatchVO match : matchVO) {
			
			addVoteResult(match, vote_status);
			addRatingResult(match, clubs_rating);
			
		}
		ArrayList<MatchVO> past_ratings=new ArrayList<MatchVO> ();
		for(MatchVO match : past_match) {
			addRatingResult(match,past_ratings);
		}
		mav.addObject("match_list",matchVO);
		mav.addObject("past_match",past_match);
		
		//클럽 회원 정보 Object에 추가
		//해당 클럽의 전체 회원정보를 받아 memberVO list로 받는다
		//memberVO list가 루프를 돌면서 attendatacerate를 set한다
		
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
	
	
	
	
	public void addVoteResult(MatchVO match,ArrayList<MatchVO> vote_status) {
		logger.info("match in addVoteResult : "+match);
		Integer myVote=matchService.selectMyVoteStatus(match);
		logger.info("myVote : "+myVote);
		
		if(myVote != null) {
			match.setStatus(myVote);
		}
		
		//matchVO에 해당 경기,해당 팀의 투표 현황을 받는다
		vote_status=matchService.selectVoteStatusByGroup(match);
		for(MatchVO vote_result: vote_status) {
			if(vote_result.getStatus()==1) {
				match.setAttend(vote_result.getCount());
			}
			if(vote_result.getStatus()==2) {
				match.setNot_attend(vote_result.getCount());
			}
			if(vote_result.getStatus()==3) {
				match.setUndefined(vote_result.getCount());
			}
			match.setMax();
		}
	}
	
	public void addRatingResult(MatchVO match, ArrayList<MatchVO> clubs_rating) {
		clubs_rating=matchService.selectAverageRating(match);
		match.setHome_manner(0.0);
		match.setHome_perform(0.0);
		match.setAway_manner(0.0);
		logger.info("getAway_name:"+match.getAway_name());
		match.setAway_name(match.getAway_name()+"(미등록팀)");//DB에 away_name추가
		match.setAway_perform(0.0);
		
		for(MatchVO club_rating:clubs_rating) {
			if(match.getHome()==club_rating.getClub_num()) {
				match.setHome_manner(club_rating.getManner());
				match.setHome_name(club_rating.getClub_name());
				match.setHome_perform(club_rating.getPerform());
			}
			if(match.getAway()==club_rating.getClub_num()) {
				match.setAway_manner(club_rating.getManner());
				match.setAway_name(club_rating.getClub_name());
				match.setAway_perform(club_rating.getPerform());
			}
		}
	}
	
}
