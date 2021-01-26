package kr.spring.club.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;

import kr.spring.club.domain.ClubVO;
import kr.spring.match.domain.MatchVO;
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
	public Integer selectNumberOfMembers(Integer club_num);
	public Integer selectNumberOfManagers(Integer club_num);
	public void deleteClubFromClub(Integer club_num);
	public List<ClubVO> selectRatings(Integer club_num);
	public void updateClub(ClubVO club);
	public ClubVO selectMyClubDetails(ClubVO club);
	public void updateRecruitReq(MemberVO member);
	public void deleteMatchReqForCancel(Integer request_num);
	public void updateMatchReqForCancel(Integer request_num,Integer match_num);
	public List<MemberVO> selectClubRecruitReqForRequestor(Integer club_num);
	public void updateClubRecruitReq(MemberVO member);
	public void insertClubMemberWithMemberVO(MemberVO member);
	public Integer selectClubJoinForDuplicate(MemberVO member);
	public Integer selectClubJoinForDuplicateByClubVO(ClubVO club);
	public HashSet<String> selectClubExecutivesByClubNum(Integer club_num);
	
}
