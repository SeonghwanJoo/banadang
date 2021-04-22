package kr.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import kr.spring.board.domain.BoardVO;
import kr.spring.board.service.BoardService;
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

	@Resource
	private BoardService boardService;

	@RequestMapping("/main/main.do")
	public ModelAndView process(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {

			ClubVO club = (ClubVO) session.getAttribute("myClub");
			// 내가 소속한 클럽번호로 match table에 클럽 번호가 있는 match를 받는다
			List<MatchVO> matchVO = new ArrayList<MatchVO>();
			ArrayList<MatchVO> vote_status = new ArrayList<MatchVO>();
			ArrayList<MatchVO> clubs_rating = new ArrayList<MatchVO>();
			List<MatchVO> past_match = new ArrayList<MatchVO>();
			if (club != null) {
				matchVO.addAll(matchService.selectMyMatch(club.getClub_num()));
				past_match.addAll(matchService.selectMyPastMatch(club.getClub_num()));
			}
			for (MatchVO match : matchVO) {
				
				match.setId(user_id);
				addVoteResult(match, vote_status);
				addRatingResult(match, clubs_rating);

			}
			ArrayList<MatchVO> past_ratings = new ArrayList<MatchVO>();

			for(int i=past_match.size()-1;i>=0;i--) {
				
				Map<String,Object> map=addRatingResult(past_match.get(i), past_ratings);
				if(map.get("away_count").equals(0) || map.get("home_count").equals(0)) {
					past_match.remove(i);
				}
			}
			mav.addObject("match_list", matchVO);
			mav.addObject("past_match", past_match);
		}
		mav.setViewName("main");
		mav.addObject("title", "main");

		return mav;
	}
	
	@RequestMapping("/main/intro.do")
	public ModelAndView intro() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("title","젠틀프로 소개");
		mav.setViewName("intro");
		
		return mav;
	}
	
	
	@RequestMapping("/main/voteForm.do")
	public ModelAndView vote(@RequestParam int match_num, @RequestParam Integer club_num, @RequestParam boolean isMain,
			HttpSession session) {

		ModelAndView mav = new ModelAndView();
		ArrayList<MatchVO> vote_status = new ArrayList<MatchVO>();
		ArrayList<MatchVO> clubs_rating = new ArrayList<MatchVO>();
		String user_id = (String) session.getAttribute("user_id");

		MatchVO match = matchService.selectMatchByMatch_num(match_num);
		if (match!=null) {
			
			match.setClub_num(club_num);
			if (user_id != null) {

				match.setId(user_id);
				addVoteResult(match, vote_status);
				addRatingResult(match, clubs_rating);

			}
			mav.addObject("match", match);
			List<BoardVO> answers = boardService.selectVote_answer(match);
			mav.addObject("answers", answers);
			
		}
		mav.addObject("isMain", isMain);
		mav.setViewName("vote");
		mav.addObject("title", "경기 참불 투표");
		
		return mav;
	}

	@RequestMapping("/main/ratingForm.do")
	public ModelAndView rating(@RequestParam int match_num, 
							   @RequestParam Integer club_num,
							   @RequestParam boolean isMain,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<MatchVO> clubs_rating = new ArrayList<MatchVO>();
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			MatchVO match = matchService.selectMatchByMatch_num(match_num);
			match.setId(user_id);
			match.setClub_num(club_num);

			addRatingResult(match, clubs_rating);
			mav.addObject("match", match);
		}
		mav.setViewName("rating");
		mav.addObject("title", "지난 경기 상대팀 평가");
		mav.addObject("isMain",isMain);
		return mav;
	}

	@RequestMapping("/main/vote_detail.do")
	public ModelAndView vote_detail(MatchVO match,@RequestParam boolean isMain) {
		
		ModelAndView mav = new ModelAndView();
		List<MemberVO> members = new ArrayList<MemberVO>();
		List<MemberVO> atdance = new ArrayList<MemberVO>();
		List<MemberVO> no_atdance = new ArrayList<MemberVO>();
		List<MemberVO> undefined_atdance = new ArrayList<MemberVO>();
		List<MemberVO> not_voted = new ArrayList<MemberVO>();
		// 해당 매치의 해당 클럽의 참석자,불참자,미정자 테이블
		// 클럽의 전체 회원 명단을 받는다
		// 전체 회원의 닉네임과 프로필 사진을 받기 위해 mem_detail과 조인한다
		members = matchService.selectVote_detail(match);
		for (MemberVO member : members) {
			
			if (member.getStatus() == 1) {
				atdance.add(member);
			} else if (member.getStatus() == 2) {
				no_atdance.add(member);
			} else if (member.getStatus() == 3) {
				undefined_atdance.add(member);
			} else if (member.getStatus() == 0) {
				not_voted.add(member);
			}
		}

		mav.addObject("atdance", atdance);
		mav.addObject("no_atdance", no_atdance);
		mav.addObject("undefined_atdance", undefined_atdance);
		mav.addObject("not_voted", not_voted);
		mav.addObject("isMain",isMain);
		mav.addObject("match", match);
		mav.setViewName("vote_detail");

		return mav;
	}

	@RequestMapping("/main/replyToVote.do")
	public ModelAndView replyToVote(BoardVO board) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("title", "투표 댓글 작성");
		mav.addObject("board", board);
		mav.setViewName("writeReplyToVote");

		return mav;
	}

	@RequestMapping("/main/modifyVoteAnswer.do")
	public ModelAndView modifyVoteAnswer(Integer voteAnswer_num, boolean isMain) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("title", "투표 댓글 수정");
		BoardVO answer = boardService.selectVote_AnswerByVoteAnswer_num(voteAnswer_num);
		answer.setIsMain(isMain);
		mav.addObject("answer", answer);
		mav.setViewName("modifyVoteAnswer");

		return mav;

	}

	@RequestMapping("/main/authcheck.do")
	public String checkauth() {

		return "authcheck";
	}

	@RequestMapping("/main/membercheck.do")
	public ModelAndView checkMember(@RequestParam Integer club_num) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("club_num" , club_num);
		mav.setViewName("membercheck");
		return mav;
	}

	@RequestMapping("/main/memberAuthCheck.do")
	public String checkMemAuth() {

		return "checkMemAuth";
	}

	@RequestMapping("/main/posterCheck.do")
	public String posterCheck() {

		return "posterCheck";
	}
	@RequestMapping("/main/loginFailure.do")
	public String loginFailure() {

		return "loginFailure";
	}

	@RequestMapping("/main/myClubCheck.do")
	public String checkmyClub() {

		return "myClubCheck";
	}

	public void addVoteResult(MatchVO match, ArrayList<MatchVO> vote_status) {
		
		Integer myVote = matchService.selectMyVoteStatus(match);
		
		if (myVote!=null) {
			match.setStatus(myVote);
		}
		
		// matchVO에 해당 경기,해당 팀의 투표 현황을 받는다
		vote_status = matchService.selectVoteStatusByGroup(match);
		for (MatchVO vote_result : vote_status) {
			if (vote_result.getStatus() == 1) {
				match.setAttend(vote_result.getCount());
			}
			if (vote_result.getStatus() == 2) {
				match.setNot_attend(vote_result.getCount());
			}
			if (vote_result.getStatus() == 3) {
				match.setUndefined(vote_result.getCount());
			}
			match.setMax();
		}
	}

	public Map<String,Object> addRatingResult(MatchVO match, ArrayList<MatchVO> clubs_rating) {
		clubs_rating = matchService.selectAverageRating(match);//클럽이 삭제되었다면 해당 클럽번호의 결과가 없음
		if(match.getAway()==-1) {
			match.setAway_name(match.getAway_name() + "(미등록)");// DB에 away_name추가
		}
		
		int away_count=0;
		int home_count=0;
		
		for (MatchVO club_rating : clubs_rating) {
			
			
			if (match.getHome().equals(club_rating.getClub_num())) {//if문으로 들어가지 못함
				match.setHome_manner(club_rating.getManner());
				match.setHome_name(club_rating.getClub_name());
				match.setHome_perform(club_rating.getPerform());
				match.setHome_filename(club_rating.getFilename());
				home_count++;
			}
			
			if (match.getAway().equals(club_rating.getClub_num())) {
				
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
