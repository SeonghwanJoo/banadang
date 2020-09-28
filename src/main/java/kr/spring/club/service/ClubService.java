package kr.spring.club.service;

import java.util.List;
import java.util.Map;

import kr.spring.club.domain.ClubVO;
import kr.spring.member.domain.MemberVO;

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
	public void updateAcceptance(ClubVO club);
	public void rejectOthers(ClubVO club);
	public void updateAwayforMatch(ClubVO club);
	public Float selectAttendanceRate(MemberVO member);
	public List<MemberVO> selectClubMembers(Integer club_num);
	public void deleteMemberFromClub(MemberVO memberVO);
	public void updateMemberAuth(MemberVO memberVO);
	
}
