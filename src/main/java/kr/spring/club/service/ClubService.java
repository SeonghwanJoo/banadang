package kr.spring.club.service;

import java.util.List;

import kr.spring.club.domain.ClubVO;

public interface ClubService {
	public List<ClubVO> selectMyClubs(String id);
	public List<ClubVO> selectAllClubs();
	public List<String> selectMyClubs_num(String id);
	public Integer insertClub(ClubVO club);
	public ClubVO selectClubDetailWithClub_num(String club_num);
	public List<ClubVO> selectAwayDetailsForRequestedMatch(String club_num);
	public List<ClubVO> selectHomeDetailsForRequestedMatch(String club_num);
	
}
