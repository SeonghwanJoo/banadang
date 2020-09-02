package kr.spring.match.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.match.dao.MatchMapper;
import kr.spring.match.domain.MatchVO;

@Service("matchService")
public class MatchServiceImpl implements MatchService {

	@Resource
	private MatchMapper matchMapper;
	
	@Override
	public void insertMatch(MatchVO matchVO) {
		
		matchMapper.insertMatch(matchVO);
		
	}

	@Override
	public List<MatchVO> selectMyMatch(String club_num) {
		
		return matchMapper.selectMyMatch(club_num);
	}

	@Override
	public MatchVO selectMatchByMatch_num(int match_num) {
		
		return matchMapper.selectMatchByMatch_num(match_num);
	}

	@Override
	public String selectMyVoteStatus(MatchVO matchVO) {
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

}
