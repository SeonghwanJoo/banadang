package kr.spring.match.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.match.dao.MatchMapper;
import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

@Service("matchService")
public class MatchServiceImpl implements MatchService {

	@Resource
	private MatchMapper matchMapper;
	
	@Override
	public void insertMatch(MatchVO matchVO) {
		
		matchMapper.insertMatch(matchVO);
		
	}

	@Override
	public List<MatchVO> selectMyMatch(Integer club_num) {
		
		return matchMapper.selectMyMatch(club_num);
	}

	@Override
	public MatchVO selectMatchByMatch_num(int match_num) {
		
		return matchMapper.selectMatchByMatch_num(match_num);
	}

	@Override
	public Integer selectMyVoteStatus(MatchVO matchVO) {
		return matchMapper.selectMyVoteStatus(matchVO);
	}

	@Override
	public void insertVoteStatus(MatchVO matchVO) {
		matchMapper.insertVoteStatus(matchVO);
	}

	@Override
	public void updateVoteStatus(MatchVO matchVO) {
		matchMapper.updateVoteStatus(matchVO);
	}

	@Override
	public ArrayList<MatchVO> selectVoteStatusByGroup(MatchVO matchVO) {
		
		return matchMapper.selectVoteStatusByGroup(matchVO);
	}

	@Override
	public ArrayList<MatchVO> selectAverageRating(MatchVO matchVO) {
		
		return matchMapper.selectAverageRating(matchVO);
	}

	@Override
	public String selectMyVoteNum(MatchVO matchVO) {
		
		return matchMapper.selectMyVoteNum(matchVO);
	}

	@Override
	public List<MatchVO> selectMyPastMatch(Integer club_num) {
		return matchMapper.selectMyPastMatch(club_num);
	}

	@Override
	public Integer selectMyRating(MatchVO match) {
		return matchMapper.selectMyRating(match);
	}

	@Override
	public void insertRating(MatchVO match) {
		matchMapper.insertRating(match);
		
	}

	@Override
	public void updateRating(MatchVO match) {
		matchMapper.updateRating(match);
		
	}

	@Override
	public List<MemberVO> selectVote_detail(MatchVO match) {
		
		return matchMapper.selectVote_detail(match);
	}

	@Override
	public List<MatchVO> selectMatchToInvite() {
		
		return matchMapper.selectMatchToInvite();
	}

	@Override
	public MatchVO selectMatchToInviteByMatch_num(Integer match_num) {

		return matchMapper.selectMatchToInviteByMatch_num(match_num);
	}

	@Override
	public Integer selectMyRequestForMatchToInvite(MatchVO match) {

		return matchMapper.selectMyRequestForMatchToInvite(match);
	}

	@Override
	public void insertMyRequestForMatchToInvite(MatchVO match) {
		
		matchMapper.insertMyRequestForMatchToInvite(match);
		
	}

	@Override
	public void insertRecruit(MatchVO match) {
		matchMapper.insertRecruit(match);
		
	}

	@Override
	public MatchVO selectRecruitDetail(Integer recruit_num) {
		
		return matchMapper.selectRecruitDetail(recruit_num);
	}

	@Override
	public Integer selectRecruit_req_num(MatchVO match) {
		
		return matchMapper.selectRecruit_req_num(match);
	}

	@Override
	public void insertRecruitRequest(MatchVO match) {
		matchMapper.insertRecruitRequest(match);
		
	}

	@Override
	public Integer selectRecruit_num(MatchVO match) {
		
		return matchMapper.selectRecruit_num(match);
	}

	@Override
	public List<MatchVO> selectRecruit() {
		
		return matchMapper.selectRecruit();
	}

	@Override
	public void updateRecruit(MatchVO match) {
		matchMapper.updateRecruit(match);
		
	}

	@Override
	public void deleteRecruit(Integer recruit_num) {
		matchMapper.deleteRecruit(recruit_num);
		
	}

	@Override
	public MatchVO selectPKsforMatch(Integer match_num) {
		
		return matchMapper.selectPKsforMatch(match_num);
	}

	@Override
	public void deleteMatch(Integer match_num) {
	
		matchMapper.deleteMatch(match_num);
		matchMapper.deleteVote(match_num);
		
	}

	@Override
	public void updateMatchForCancel(MatchVO match) {
		
		matchMapper.updateMatchForCancel(match);
		
	}

}
