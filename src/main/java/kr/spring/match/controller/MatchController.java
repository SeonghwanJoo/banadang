package kr.spring.match.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.service.LoginAPI;

@Controller
public class MatchController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@Resource
	private ClubService clubService; 
	
	@Resource
	private LoginAPI loginAPI;
	
	@ModelAttribute
	public MatchVO initCommand() {
		return new MatchVO();
	}
	
	@RequestMapping("/match/writeForm.do")
	public ModelAndView process() {
		ModelAndView mav =new ModelAndView();
		
		List<ClubVO> list = new ArrayList<ClubVO> ();
		list=clubService.selectAllClubs();
		
		mav.setViewName("writeForm");
		mav.addObject("title", "매치 작성");
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping("/match/write.do")
	public String registerMatch(MatchVO matchVO) {
		
		
		matchService.insertMatch(matchVO);
		List<String> uid_list=matchService.selectMembersForPostedMatch(matchVO);
		logger.info("log matchservice selectMemberForselectedMatch below");
		if(!uid_list.isEmpty()) {
			loginAPI.sendMessage(uid_list, "경기 일정이 게시되었습니다.");
		}
		
		if(matchVO.getAway()==0) {
			return "redirect:/match/match_toInvite.do";
		}
		//홈팀의 클럽번호나 어웨이팀의 클럽번호에 소속된 모든 id를 list로 받음
		
		return "redirect:/main/main.do";
	}
	@RequestMapping("/match/match_toInvite.do")
	public ModelAndView inviteList(MatchVO match) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("invite_match");
		mav.addObject("title","경기 매치");
		mav.addObject("match", match);
		
		return mav;
	}

	@RequestMapping("/match/invite_detail.do")
	public ModelAndView inviteDetail(@RequestParam Integer match_num) {
		
		ModelAndView mav=new ModelAndView();
		MatchVO match=matchService.selectMatchToInviteByMatch_num(match_num);
		
		mav.setViewName("invite_detail");
		mav.addObject("title","경기 신청");
		mav.addObject("match", match);
		
		return mav;
	}
	@RequestMapping("/match/recruit.do")
	public ModelAndView recruitPlayer(MatchVO match) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("recruit");
		mav.addObject("title","용병 모집");
		mav.addObject("match", match);
		
		return mav;
	}
	@RequestMapping("/match/writeRecruit.do")
	public ModelAndView writeRecruit(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		//세션에서 myClub을 받는다
		//myClub에 해당 되는 match list를 Object로 전달한다
		//
		ClubVO myClub=(ClubVO)session.getAttribute("myClub");
		List<MatchVO> matches=matchService.selectMyMatch(myClub.getClub_num());
		
		mav.addObject("matches", matches);
		mav.addObject("title","용병 모집");
		mav.setViewName("writeRecruit");
		
		
		return mav;
	}
	@RequestMapping("/match/recruitDetail.do")
	public ModelAndView recruitDetail(@RequestParam Integer recruit_num) {
		
		ModelAndView mav=new ModelAndView();
		MatchVO match=matchService.selectRecruitDetail(recruit_num);
		mav.addObject("match", match);
		mav.addObject("title","용병 신청");
		mav.setViewName("recruitDetail");
		
		return mav;
	}
	@RequestMapping("/match/modifyRecruit.do")
	public ModelAndView modifyRecruit(@RequestParam Integer recruit_num, @RequestParam Integer club_num) {
		ModelAndView mav=new ModelAndView();
		MatchVO match=matchService.selectRecruitDetail(recruit_num);
		mav.addObject("match", match);
		mav.addObject("title","용병 모집 수정");
		mav.setViewName("modifyRecruit");
		
		return mav;
	}
	@RequestMapping("/match/deleteRecruit.do")
	public String deleteRecruit(@RequestParam Integer recruit_num, @RequestParam Integer club_num) {
		
		matchService.deleteRecruit(recruit_num);
		
		return "redirect:/match/recruit.do";
		
	}
	@RequestMapping("/match/deleteMatch.do")
	public String deleteMatch(@RequestParam Integer match_num,
							  @RequestParam String club_name,
							  @RequestParam Integer club_num,
							  @RequestParam(required=false) boolean isFromClub) {
		
		//해당 매치로 생성되어 있는 match/match_recruit/match_request/match_vote 삭제해야 함
		//아무것도 없는 상태라면 match 삭제 처리
		//상대팀이 매칭되어 있는 경우
		//recruit이 신청되어 있는 경우 =>상태표시로 취소됨 표시
		//match_request가 신청되어 있는 경우=>상태표시로 취소됨 표시
		//투표가 되어 잇는 경우 =>운영진 권한에 따라 삭제 OK
		List<MatchVO> matches=matchService.selectPKsforMatch(match_num);
		if(matches!=null && matches.get(0).getRequest_num()==null&&(matches.get(0).getAway()==-1||matches.get(0).getAway()==0)&&matches.get(0).getRecruit_num()==null) {
			matchService.deleteMatch(match_num);
			//용병을 신청한 상태에서 매치를 지우면 어케 되지?
		}else {
			Map<String,Object> map=new HashMap<String,Object> ();
			map.put("match_num", match_num);
			map.put("cancel", club_name);
			matchService.updateMatchForCancel(map);
		}
		if(isFromClub) {
			return "redirect:/club/manageClub.do?club_num="+club_num+"&clubManageFrom=3";
		}
		
		return "redirect:/main/main.do";
		
	}
	@RequestMapping("/match/modifyMatch.do")
	public ModelAndView modifyMatch(@RequestParam Integer match_num,
									@RequestParam Integer club_num,
									@RequestParam(required=false) boolean isFromClub) {
		
		ModelAndView mav=new ModelAndView();
		MatchVO match=matchService.selectMatchToInviteByMatch_num(match_num);
		
		mav.setViewName("modifyMatch");
		mav.addObject("isFromClub",isFromClub);
		logger.info("isFromClub : "+isFromClub);
		mav.addObject("title","경기 수정");
		mav.addObject("match", match);
		return mav;
	}
	
	@RequestMapping("/match/matchDetail.do")
	public ModelAndView matchDetail(@RequestParam Integer match_num,
									@RequestParam boolean isMain) {
		
		ModelAndView mav=new ModelAndView();
		ArrayList<MatchVO> clubs_rating = new ArrayList<MatchVO>();
		MatchVO match = matchService.selectMatchByMatch_num(match_num);
		
		addRatingResult(match, clubs_rating);
		
		mav.addObject("match", match);
		mav.addObject("title", "경기 상세");
		mav.addObject("isMain",isMain);
		mav.setViewName("matchDetail");
		
		return mav;
	}
	
	
	public void addRatingResult(MatchVO match, ArrayList<MatchVO> clubs_rating) {
		clubs_rating=matchService.selectAverageRating(match);
		if(match.getAway()==-1) {
			match.setAway_name(match.getAway_name() + "(미등록)");// DB에 away_name추가
		}
		
		for(MatchVO club_rating:clubs_rating) {
			if(match.getHome()==club_rating.getClub_num()) {
				match.setHome_manner(club_rating.getManner());
				match.setHome_name(club_rating.getClub_name());
				match.setHome_perform(club_rating.getPerform());
				match.setHome_filename(club_rating.getFilename());
			}
			if(match.getAway()==club_rating.getClub_num()) {
				match.setAway_manner(club_rating.getManner());
				match.setAway_name(club_rating.getClub_name());
				match.setAway_perform(club_rating.getPerform());
				match.setAway_filename(club_rating.getFilename());
				match.setClub_loc(club_rating.getClub_loc());
			}
		}
		if(match.getClub_loc()==null&&match.getAway()>0) {
			match.setAway_name("삭제된 팀");
		}
	}
}
