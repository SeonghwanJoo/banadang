package kr.spring.match.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.spring.match.domain.MatchVO;

public interface MatchMapper {
	
	public void insertMatch(MatchVO matchVO);
	
	@Select("select * from match where home=#{club_num} or away=#{club_num} and match_date>sysdate-1")
	public List<MatchVO> selectMyMatch(String club_num);
	

}
