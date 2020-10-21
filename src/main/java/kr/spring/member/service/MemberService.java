package kr.spring.member.service;

import java.util.List;


import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id);
	public void insertMember(MemberVO memberVO);
	public void updateMember_detail(MemberVO member);
	public List<MatchVO> selectMyRecruitReq(String id);
	public void deleteRecruitReq(Integer recruit_req_num);
	public void updateRecruitReqForCancel(Integer recruit_req_num);
	public void insertClubRecruit(MatchVO match);
	public MatchVO selectClubRecruitWithClubDetail(Integer clubRecruit_num);
	public List<MatchVO> selectClubRecruits();
	public void deleteClubRecruit(Integer clubRecruit_num);
	public void updateClubRecruit(MatchVO match);
	public void insertClubRecruitReq(MatchVO match);
	public List<MatchVO> selectMyClubRecruitReq(String id);
	public void deleteClubRecruitReq(Integer clubRecruit_req_num);
}
