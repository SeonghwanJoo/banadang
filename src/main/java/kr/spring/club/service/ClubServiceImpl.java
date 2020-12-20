package kr.spring.club.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.club.dao.ClubMapper;
import kr.spring.club.domain.ClubVO;
import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

@Service("clubService")
public class ClubServiceImpl implements ClubService {
	
	@Resource
	private ClubMapper clubMapper;
	
	@Override
	public List<ClubVO> selectMyClubs(String id) {
		
		return clubMapper.selectMyClubs(id);
	}

	@Override
	public List<ClubVO> selectAllClubs() {
		
		return clubMapper.selectAllClubs();
	}

	@Override
	public List<Integer> selectMyClubs_num(String id) {
		
		return clubMapper.selectMyClubs_num(id);
	}

	@Override
	public void insertClub(ClubVO club) {
		
		clubMapper.insertClub(club);
		clubMapper.joinClubWhenCreated(club);
		
	}

	@Override
	public ClubVO selectClubDetailWithClub_num(Integer club_num) {
		
		return clubMapper.selectClubDetailWithClub_num(club_num);
	}

	@Override
	public List<ClubVO> selectAwayDetailsForRequestedMatch(Integer club_num) {
		return clubMapper.selectAwayDetailsForRequestedMatch(club_num);
	}

	@Override
	public List<ClubVO> selectHomeDetailsForRequestedMatch(Integer club_num) {
		return clubMapper.selectHomeDetailsForRequestedMatch(club_num);
	}

	@Override
	public void insertClubMember(ClubVO club) {
		
		clubMapper.insertClubMember(club);
	}

	@Override
	public Integer selectClubAuth(ClubVO club) {
		return clubMapper.selectClubAuth(club);
	}

	@Override
	public void updateAcceptance(ClubVO club) {
		clubMapper.updateAcceptance(club);
		
	}

	@Override
	public void rejectOthers(ClubVO club) {
		clubMapper.rejectOthers(club);
	}

	@Override
	public void updateAwayforMatch(ClubVO club) {
		clubMapper.updateAwayforMatch(club);
		
	}

	@Override
	public Float selectAttendanceRate(MemberVO member) {
		
		return clubMapper.selectAttendanceRate(member);
	}

	@Override
	public List<MemberVO> selectClubMembers(Integer club_num) {
		
		return clubMapper.selectClubMembers(club_num);
	}

	@Override
	public void deleteMemberFromClub(MemberVO memberVO) {
		clubMapper.deleteMemberFromClub(memberVO);
		clubMapper.deleteVoteWhenLeftClub(memberVO);
		
	}

	@Override
	public void updateMemberAuth(MemberVO memberVO) {
		clubMapper.updateMemberAuth(memberVO);
		
	}

	@Override
	public Integer selectNumberOfMembers(Integer club_num) {
		
		return clubMapper.selectNumberOfMembers(club_num);
	}

	@Override
	public Integer selectNumberOfManagers(Integer club_num) {
		
		return clubMapper.selectNumberOfManagers(club_num);
	}

	@Override
	public void deleteClubFromClub(Integer club_num) {
		clubMapper.deleteClubFromClub(club_num);
		clubMapper.deleteClubFromclub_rating(club_num);
		clubMapper.deleteClubFromClubJoin(club_num);
	}

	@Override
	public List<ClubVO> selectRatings(Integer club_num) {
		
		return clubMapper.selectRatings(club_num);
	}

	@Override
	public void updateClub(ClubVO club) {
		
		clubMapper.updateClub(club);
		
	}

	@Override
	public ClubVO selectMyClubDetails(ClubVO club) {
		return clubMapper.selectMyClubDetails(club);
	}

	@Override
	public void updateRecruitReq(MemberVO member) {
		
		clubMapper.updateRecruitReq(member);
		
	}

	@Override
	public void deleteMatchReqForCancel(Integer request_num) {
		
		clubMapper.deleteMatchReqForCancel(request_num);
	}

	@Override
	public void updateMatchReqForCancel(Integer request_num,Integer match_num) {
		
		clubMapper.updateMatchReqForCancel(request_num);
		clubMapper.updateMatchForMatchReqCancel(match_num);
	}

	@Override
	public List<MemberVO> selectClubRecruitReqForRequestor(Integer club_num) {
		
		return clubMapper.selectClubRecruitReqForRequestor(club_num);
	}

	@Override
	public void updateClubRecruitReq(MemberVO member) {
		
		clubMapper.updateClubRecruitReq(member);
		
	}

	@Override
	public void insertClubMemberWithMemberVO(MemberVO member) {
		
		clubMapper.insertClubMemberWithMemberVO(member);
		
	}

	@Override
	public Integer selectClubJoinForDuplicate(MemberVO member) {
		
		return clubMapper.selectClubJoinForDuplicate(member);
	}

	@Override
	public Integer selectClubJoinForDuplicateByClubVO(ClubVO club) {
		
		return clubMapper.selectClubJoinForDuplicateByClubVO(club);
	}

	


}
