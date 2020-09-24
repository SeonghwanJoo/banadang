package kr.spring.club.service;

import java.util.List;

import kr.spring.club.domain.ClubVO;

public interface ClubService {
	public List<ClubVO> selectMyClubs(String id);
	public List<ClubVO> selectAllClubs();
	public List<Integer> selectMyClubs_num(String id);
	public void insertClub(ClubVO club);
	public ClubVO selectClubDetailWithClub_num(Integer club_num);
	public List<ClubVO> selectAwayDetailsForRequestedMatch(Integer club_num);
	public List<ClubVO> selectHomeDetailsForRequestedMatch(Integer club_num);
	public void insertClubMember(ClubVO club);
	public Integer selectClubAuth(ClubVO club);
	
}
