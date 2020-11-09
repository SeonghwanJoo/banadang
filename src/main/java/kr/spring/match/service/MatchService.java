package kr.spring.match.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.spring.club.domain.ClubVO;
import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

public interface MatchService {
	public void insertMatch(MatchVO matchVO);
	public List<MatchVO> selectMyMatch(Integer club_num);
	public List<MatchVO> selectMyPastMatch(Integer club_num);
	public MatchVO selectMatchByMatch_num(int match_num);
	public Integer selectMyVoteStatus(MatchVO matchVO);
	public String selectMyVoteNum(MatchVO matchVO);
	public void insertVoteStatus(MatchVO matchVO);
	public void updateVoteStatus(MatchVO matchVO);
	public ArrayList<MatchVO> selectVoteStatusByGroup(MatchVO matchVO);
	public ArrayList<MatchVO> selectAverageRating(MatchVO matchVO);
	public Integer selectMyRating(MatchVO match);
	public void insertRating(MatchVO match);
	public void updateRating(MatchVO match);
	public List<MemberVO> selectVote_detail(MatchVO match);
	public List<MatchVO> selectMatchToInvite();
	public MatchVO selectMatchToInviteByMatch_num(Integer match_num);
	public Integer selectMyRequestForMatchToInvite(MatchVO match);
	public void insertMyRequestForMatchToInvite(MatchVO match);
	public void insertRecruit(MatchVO match);
	public MatchVO selectRecruitDetail(Integer recruit_num);
	public Integer selectRecruit_req_num(MatchVO match);
	public void insertRecruitRequest(MatchVO match);
	public Integer selectRecruit_num(MatchVO match);
	public List<MatchVO> selectRecruit();
	public void updateRecruit(MatchVO match);
	public void deleteRecruit(Integer recruit_num);
	public MatchVO selectPKsforMatch(Integer match_num);
	public void deleteMatch(Integer match_num);
	public void updateMatchForCancel(MatchVO match);
	public void updateMatch(MatchVO match);
	public List<MemberVO> selectRecruitByClub_num(Integer club_num);
	public List<MatchVO> selectMatchToInviteWithFilter(MatchVO match);
	public List<MatchVO> selectRecruitWithFilter(MatchVO match);

}
