package kr.spring.match.service;

import java.util.List;

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

}
