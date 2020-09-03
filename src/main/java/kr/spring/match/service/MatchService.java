package kr.spring.match.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.spring.match.domain.MatchVO;

public interface MatchService {
	public void insertMatch(MatchVO matchVO);
	public List<MatchVO> selectMyMatch(String club_num);
	public MatchVO selectMatchByMatch_num(int match_num);
	public MatchVO selectMyVoteStatus(MatchVO matchVO);
	public void insertVoteStatus(MatchVO matchVO);
	public void updateVoteStatus(MatchVO matchVO);
	public ArrayList<MatchVO> selectVoteStatusByGroup(MatchVO matchVO);
	public List<MatchVO> selectAverageRating(MatchVO matchVO);
}
