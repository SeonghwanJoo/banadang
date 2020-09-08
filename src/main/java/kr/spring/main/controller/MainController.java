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
			//내가 소속한 클럽번호로  match table에 클럽 번호가 있는 match를 받는다
			List<MatchVO> matchVO=new ArrayList<MatchVO>();
			List<MatchVO> vote_status=new ArrayList<MatchVO>();
			List<MatchVO> clubs_rating=new ArrayList<MatchVO>();
			List<MatchVO> past_match=new ArrayList<MatchVO>();
			for(String club_num : clubs_num) {
				
				matchVO.addAll(matchService.selectMyMatch(club_num));
				past_match.addAll(matchService.selectMyPastMatch(club_num));
				
			}
			
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
				match.setHome_name(match.getHome()+"(미등록팀)");
				match.setHome_perform(0.0);
				match.setAway_manner(0.0);
				match.setAway_name(match.getAway()+"(미등록팀)");
				match.setAway_perform(0.0);
				
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
						match.setHome_manner(Math.round(past_rating.getManner()*10)/10.0);
						match.setHome_name(past_rating.getClub_name());
						match.setHome_perform(Math.round(past_rating.getPerform()*10)/10.0);
					}
					if(match.getAway().equals(past_rating.getClub_num())) {
						match.setAway_manner(Math.round(past_rating.getManner()*10)/10.0);
						match.setAway_name(past_rating.getClub_name());
						match.setAway_perform(Math.round(past_rating.getPerform()*10)/10.0);
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
							 @RequestParam String club_num,
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
		
		mav.setViewName("vote");
		mav.addObject("title","경기 투표");
		return mav;
	}
}
