package kr.spring.main.controller;

import java.util.ArrayList;
import java.util.HashSet;
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
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.MemberVO;

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
			
			ClubVO club=(ClubVO)session.getAttribute("myClub");
			//내가 소속한 클럽번호로  match table에 클럽 번호가 있는 match를 받는다
			List<MatchVO> matchVO=new ArrayList<MatchVO>();
			List<MatchVO> vote_status=new ArrayList<MatchVO>();
			List<MatchVO> clubs_rating=new ArrayList<MatchVO>();
			List<MatchVO> past_match=new ArrayList<MatchVO>();
				
			matchVO.addAll(matchService.selectMyMatch(club.getClub_num()));
			past_match.addAll(matchService.selectMyPastMatch(club.getClub_num()));
				
			
			//match,List<MatchVO>voteStatus,List<MatchVO>clubs_rating
			for(MatchVO match : matchVO) {
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
			List<MatchVO> past_ratings=new ArrayList<MatchVO> ();
			for(MatchVO match : past_match) {
				past_ratings=matchService.selectAverageRating(match);
				match.setHome_manner(0.0);
				match.setHome_name(match.getHome()+"(미등록팀)");
				match.setHome_perform(0.0);
				match.setAway_manner(0.0);
				match.setAway_name(match.getAway()+"(미등록팀)");
				match.setAway_perform(0.0);
				for(MatchVO past_rating:past_ratings) {
					if(match.getHome().equals(past_rating.getClub_num())) {
						match.setHome_manner(past_rating.getManner());
						match.setHome_name(past_rating.getClub_name());
						match.setHome_perform(past_rating.getPerform());
					}
					if(match.getAway().equals(past_rating.getClub_num())) {
						match.setAway_manner(past_rating.getManner());
						match.setAway_name(past_rating.getClub_name());
						match.setAway_perform(past_rating.getPerform());
					}
				}
			}
			logger.info("<<matchVO>>"+matchVO);
			mav.addObject("match_list",matchVO);
			mav.addObject("past_match",past_match);
		}
		mav.setViewName("main");
		mav.addObject("title", "BANADANG");
		
		return mav;
	}
	@RequestMapping("/main/voteForm.do")
	public ModelAndView vote(@RequestParam int match_num,
							 @RequestParam Integer club_num,
							 HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		List<MatchVO> vote_status=new ArrayList<MatchVO>();
		List<MatchVO> clubs_rating=new ArrayList<MatchVO>();
		String user_id=(String)session.getAttribute("user_id");
		if(user_id!=null) {
			MatchVO match=matchService.selectMatchByMatch_num(match_num);
			match.setId(user_id);
			match.setClub_num(club_num);
			Integer myVote=matchService.selectMyVoteStatus(match);
			if(myVote!=null) {
				mav.addObject("myVote",myVote);
			}
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
				logger.info("<<<max>>> : "+match.getMax());
			}
			clubs_rating=matchService.selectAverageRating(match);
			match.setHome_manner(0.0);
			match.setHome_name(match.getHome()+"(미등록팀)");
			match.setHome_perform(0.0);
			match.setAway_manner(0.0);
			match.setAway_name(match.getAway()+"(미등록팀)");
			match.setAway_perform(0.0);
			logger.info("<<<clubs_rating>>>> : "+clubs_rating);
			logger.info("<<<final match_justbefore rating setting>>>> : "+match);
			for(MatchVO club_rating:clubs_rating) {
				if(match.getHome().equals(club_rating.getClub_num())) {
					match.setHome_manner(club_rating.getManner());
					match.setHome_name(club_rating.getClub_name());
					match.setHome_perform(club_rating.getPerform());
				}
				if(match.getAway().equals(club_rating.getClub_num())) {
					match.setAway_manner(club_rating.getManner());
					match.setAway_name(club_rating.getClub_name());
					match.setAway_perform(club_rating.getPerform());
				}
			}
			mav.addObject("match",match);
		}
		
		mav.setViewName("vote");
		mav.addObject("title","경기 참불 투표");
		return mav;
	}
	
	@RequestMapping("/main/ratingForm.do")
	public ModelAndView rating(@RequestParam int match_num,
							 @RequestParam Integer club_num,
							 HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<MatchVO> clubs_rating=new ArrayList<MatchVO>();
		String user_id=(String)session.getAttribute("user_id");
		if(user_id!=null) {
			MatchVO match=matchService.selectMatchByMatch_num(match_num);
			match.setId(user_id);
			match.setClub_num(club_num);
			
			clubs_rating=matchService.selectAverageRating(match);
			match.setHome_manner(0.0);
			match.setHome_name(match.getHome()+"(미등록팀)");
			match.setHome_perform(0.0);
			match.setAway_manner(0.0);
			match.setAway_name(match.getAway()+"(미등록팀)");
			match.setAway_perform(0.0);
			logger.info("<<<clubs_rating>>>> : "+clubs_rating);
			logger.info("<<<final match_justbefore rating setting>>>> : "+match);
			for(MatchVO club_rating:clubs_rating) {
				if(match.getHome().equals(club_rating.getClub_num())) {
					match.setHome_manner(Math.round(club_rating.getManner()*10)/10.0);
					match.setHome_name(club_rating.getClub_name());
					match.setHome_perform(Math.round(club_rating.getPerform()*10)/10.0);
				}
				if(match.getAway().equals(club_rating.getClub_num())) {
					match.setAway_manner(Math.round(club_rating.getManner()*10)/10.0);
					match.setAway_name(club_rating.getClub_name());
					match.setAway_perform(Math.round(club_rating.getPerform()*10)/10.0);
				}
			}
			mav.addObject("match",match);
		}
		mav.setViewName("rating");
		mav.addObject("title","상대팀 평가");
		return mav;
	}
	@RequestMapping("/main/vote_detail.do")
	public ModelAndView vote_detail(@RequestParam Integer club_num,
									@RequestParam Integer match_num,
									@RequestParam String home_name,
									@RequestParam String away_name) {
		ModelAndView mav = new ModelAndView();
		MatchVO match=new MatchVO();
		match.setClub_num(club_num);
		match.setMatch_num(match_num);
		match.setHome_name(home_name);
		match.setAway_name(away_name);
		List<MemberVO> members=new ArrayList<MemberVO> ();
		List<MemberVO> atdance=new ArrayList<MemberVO> ();
		List<MemberVO> no_atdance=new ArrayList<MemberVO> ();
		List<MemberVO> undefined_atdance=new ArrayList<MemberVO> ();
		List<MemberVO> not_voted=new ArrayList<MemberVO> ();
		//해당 매치의 해당 클럽의 참석자,불참자,미정자 테이블
		//클럽의 전체 회원 명단을 받는다
		//전체 회원의 닉네임과 프로필 사진을 받기 위해 mem_detail과 조인한다
		members=matchService.selectVote_detail(match);
		logger.info("<<members>> : "+members);
		int i=0;
		for(MemberVO member:members) {
			i++;
			logger.info("<<count>> : "+i);
			if(member.getStatus()==1) {
				logger.info("<<member>> : 1"+member);
				atdance.add(member);
			}
			else if(member.getStatus()==2) {
				logger.info("<<member>> : 2"+member);
				no_atdance.add(member);
			}
			else if(member.getStatus()==3) {
				logger.info("<<member>> : 3"+member);
				undefined_atdance.add(member);
			}
			else if(member.getStatus()==0) {not_voted.add(member);}
		}
		
		mav.addObject("atdance", atdance);
		mav.addObject("no_atdance", no_atdance);
		mav.addObject("undefined_atdance", undefined_atdance);
		mav.addObject("not_voted", not_voted);
		mav.addObject("match", match);
		mav.setViewName("vote_detail");
		
		
		return mav;
	}
	@RequestMapping("/main/authcheck.do")
	public String checkauth() {
		
		return "authcheck";
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
