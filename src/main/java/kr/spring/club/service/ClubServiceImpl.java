package kr.spring.club.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.spring.club.dao.ClubMapper;
import kr.spring.club.domain.ClubVO;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.LoginAPI;

@Service("clubService")
public class ClubServiceImpl implements ClubService {
	
	@Resource
	private ClubMapper clubMapper;
	
	@Resource
	private LoginAPI loginAPI;
	
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
		HashSet<String> uids= new HashSet<String>();
		uids.add(member.getId());
		String text=member.getClub_name()+"팀이 용병 신청을 ";
		if (member.getRecruit_accept()==2) {
			text+="수락하였습니다.";
		}else {
			text+="거절하였습니다.";
		}
		loginAPI.sendMessage(uids, text);
		
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
		HashSet<String> uids= new HashSet<String>();
		uids.add(member.getId());
		loginAPI.sendMessage(uids, member.getClub_name()+"팀이 가입 신청을 수락하였습니다.");
		
	}

	@Override
	public Integer selectClubJoinForDuplicate(MemberVO member) {
		
		return clubMapper.selectClubJoinForDuplicate(member);
	}

	@Override
	public Integer selectClubJoinForDuplicateByClubVO(ClubVO club) {
		
		return clubMapper.selectClubJoinForDuplicateByClubVO(club);
	}

	@Override
	public HashSet<String> selectClubExecutivesByClubNum(Integer club_num) {
		
		return clubMapper.selectClubExecutivesByClubNum(club_num);
	}
	
	
	public void setLoginCookie(Integer club_num, 
							   HttpServletResponse response, 
							   HttpServletRequest request,
							   boolean isKakao) {
		Cookie loginCookie;
		if (isKakao) loginCookie=WebUtils.getCookie(request, "GpFHzB");
		else loginCookie=WebUtils.getCookie(request, "AppSi");
		
		if(loginCookie != null) {
			String token=loginCookie.getValue().split(":")[0];
			loginCookie.setValue(token+":"+club_num);
			loginCookie.setPath("/");
			loginCookie.setMaxAge(60*60*24*60);
		}
		
		response.addCookie(loginCookie);
	}
	public Map<String, String> getLoginCookie(HttpServletRequest request, boolean isKakao) {
		
		Cookie loginCookie;
		if (isKakao) loginCookie=WebUtils.getCookie(request, "GpFHzB");
		else loginCookie=WebUtils.getCookie(request, "AppSi");
		
		Map<String, String> map = new HashMap<String, String> ();
		if (loginCookie!=null) {
			String ckValues[]=loginCookie.getValue().split(":");
			map.put("token", ckValues[0]);
			if (ckValues.length>1) {
				map.put("club_num", loginCookie.getValue().split(":")[1]);
			}
		}
		
		return map;
		
		
	}
	


}
