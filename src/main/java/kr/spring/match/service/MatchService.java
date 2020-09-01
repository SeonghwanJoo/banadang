package kr.spring.match.service;

import java.util.List;

import kr.spring.match.domain.MatchVO;

public interface MatchService {
	public void insertMatch(MatchVO matchVO);
	public List<MatchVO> selectMyMatch(String club_num);
}
