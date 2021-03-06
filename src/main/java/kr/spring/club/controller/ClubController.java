package kr.spring.club.controller;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.MemberVO;

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
		ClubVO myClub=(ClubVO)session.getAttribute("myClub");
		
		if (myClub==null && !myClubs.isEmpty()) {//myClub이 session에 없다면
			session.setAttribute("myClub", clubService.selectMyClubDetails(myClubs.get(0)));
		}
		mav.setViewName("myClub");
		mav.addObject("title", "팀 관리");
		
		return mav;
	}
	@RequestMapping("/club/manageClub.do")
	public ModelAndView manageClub(@RequestParam Integer club_num,
								   @RequestParam(defaultValue="1") Integer clubManageFrom,
									HttpSession session,
									HttpServletResponse response,
									HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		//팀명,연령,주소,유니폼,매너평가,실력평가,평가수
		String user_id=(String)session.getAttribute("user_id");
		ClubVO club=new ClubVO();
		club.setClub_num(club_num);
		club.setId(user_id);
		ClubVO myClub=clubService.selectMyClubDetails(club);
		if(user_id.length()<11) {
			clubService.setLoginCookie(club_num, response, request, true);
		}else {
			clubService.setLoginCookie(club_num, response, request, false);
		}
		
		List<ClubVO> away_club=clubService.selectAwayDetailsForRequestedMatch(club_num);
		List<ClubVO> home_club=clubService.selectHomeDetailsForRequestedMatch(club_num);
		session.setAttribute("myClub", myClub);
		mav.addObject("away_club", away_club);
		mav.addObject("home_club", home_club);
		mav.addObject("title","팀 관리");
		//용병 신청 정보 Object에 추가
		List<MemberVO> recruits=matchService.selectRecruitByClub_num(club_num);
		mav.addObject("recruits",recruits);
		
		//팀원 가입 신청 정보 Object에 추가
		List<MemberVO> clubRecruits=clubService.selectClubRecruitReqForRequestor(club_num);
		mav.addObject("clubRecruits",clubRecruits);
		
		//경기 일정 정보 Object에 추가
		List<MatchVO> matchVO=new ArrayList<MatchVO>();
		ArrayList<MatchVO> vote_status=new ArrayList<MatchVO>();
		ArrayList<MatchVO> clubs_rating=new ArrayList<MatchVO>();
		List<MatchVO> past_match=new ArrayList<MatchVO>();
			
		matchVO.addAll(matchService.selectMyMatch(club_num));
		past_match.addAll(matchService.selectMyPastMatch(club_num));
		
		for(MatchVO match : matchVO) {
			
			match.setId(user_id);
			addVoteResult(match, vote_status);
			addRatingResult(match, clubs_rating);
			
		}
		ArrayList<MatchVO> past_ratings=new ArrayList<MatchVO> ();
		for(int i=past_match.size()-1;i>=0;i--) {
			
			Map<String,Object> map=addRatingResult(past_match.get(i), past_ratings);
			if(map.get("away_count").equals(0) || map.get("home_count").equals(0)) {
				past_match.remove(i);
			}
		}
		mav.addObject("match_list",matchVO);
		mav.addObject("past_match",past_match);
		
		//클럽 회원 정보 Object에 추가
		List<MemberVO> members=clubService.selectClubMembers(club_num);
		//해당 클럽의 전체 회원정보를 받아 memberVO list로 받는다
		//memberVO list가 루프를 돌면서 attendatacerate를 set한다
		/* int ten=0,twent=0,thirt=0,fourt=0,fift=0,sixt=0,sevent=0,others=0; */
		//Map<String,Integer> ages=new HashMap<String,Integer>();
		/*
		 * ages.put("ten", ten); ages.put("twent", twent); ages.put("thirt", thirt);
		 * ages.put("fourt", fourt); ages.put("fift", fift); ages.put("sixt", sixt);
		 * ages.put("sevent", sevent); ages.put("others", others);
		 */
		
		/* mav.addObject("ages",ages); */
		mav.addObject("clubManageFrom",clubManageFrom);
		mav.addObject("members",members);
		mav.setViewName("manageClub");
		
		return mav;
	}
	@RequestMapping("/club/inviteMember.do")
	public ModelAndView inviteMember(@RequestParam Integer club_num,
									 HttpSession session) throws UnsupportedEncodingException {
		
		ModelAndView mav=new ModelAndView();
		ClubVO club=clubService.selectClubDetailWithClub_num(club_num);
		List<ClubVO> myClubs=(ArrayList<ClubVO>)session.getAttribute("myClubs");
		if(myClubs!=null) {
			for(ClubVO myClub:myClubs) {
				if(myClub.getClub_num()==club_num) {
					mav.setViewName("redirect:/club/manageClub.do?club_num="+club_num);
					return mav;
				}
			}
		}
		mav.addObject("club",club);
		mav.setViewName("inviteMember");
		
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
		
		ClubVO club=clubService.selectClubByClubNum(club_num);
			
		model.addAttribute("imageFile",club.getClub_img());
		model.addAttribute("filename",club.getFilename());
		
		
		return "imageView";
	}
	@RequestMapping("/club/club_details.do")
	public ModelAndView viewClubDetails(@RequestParam Integer club_num) {
		
		ModelAndView mav=new ModelAndView();
		ClubVO club=clubService.selectClubDetailWithClub_num(club_num);
		List<MemberVO> members=clubService.selectManagers(club_num);
		List<ClubVO> ratings=clubService.selectRatings(club_num);
		mav.addObject("members", members);
		mav.addObject("club",club);
		mav.addObject("ratings",ratings);
		mav.addObject("title","팀 프로필");
		mav.setViewName("clubDetails");		
		
		return mav;
		
	}
	@RequestMapping("/club/modifyClub.do")
	public ModelAndView modifyClub() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("title","팀 정보 수정");
		mav.setViewName("modifyClub");
		return mav;
	}
	
	
	@RequestMapping("/club/myRegion.do")
	public ModelAndView myRegion(@RequestParam boolean isMain) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("isMain", isMain);
		mav.setViewName("myRegion");
		mav.addObject("title","우리 지역 팀 보기");
		
		return mav;
	}
	 
	
	
	
	
	public void addVoteResult(MatchVO match,ArrayList<MatchVO> vote_status) {
		Integer myVote=matchService.selectMyVoteStatus(match);
		
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
	
	public Map<String,Object> addRatingResult(MatchVO match, ArrayList<MatchVO> clubs_rating) {
		clubs_rating=matchService.selectAverageRating(match);
		if(match.getAway()==-1) {
			match.setAway_name(match.getAway_name() + "(미등록)");// DB에 away_name추가
		}
		
		int away_count=0;
		int home_count=0;
		
		
		for(MatchVO club_rating:clubs_rating) {
			if(match.getHome().equals(club_rating.getClub_num())) {
				match.setHome_manner(club_rating.getManner());
				match.setHome_name(club_rating.getClub_name());
				match.setHome_perform(club_rating.getPerform());
				match.setHome_filename(club_rating.getFilename());
				home_count++;
			}
			if(match.getAway().equals(club_rating.getClub_num())) {
				match.setAway_manner(club_rating.getManner());
				match.setAway_name(club_rating.getClub_name());
				match.setAway_perform(club_rating.getPerform());
				match.setAway_filename(club_rating.getFilename());
				match.setClub_loc(club_rating.getClub_loc());
				away_count++;
			}
		}
		if(match.getClub_loc()==null&&match.getAway()>0) {
			match.setAway_name("삭제된 팀");
		}
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("away_count", away_count);
		map.put("home_count", home_count);
		
		return map;
	}
}
