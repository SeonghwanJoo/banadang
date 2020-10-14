package kr.spring.member.service;

import java.util.List;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id);
	public void insertMember(MemberVO memberVO);
	public void updateMember_detail(MemberVO member);
	public List<MatchVO> selectMyRecruitReq(String id);
}
