package kr.spring.member.service;

import kr.spring.member.domain.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id);
	public void insertMember(MemberVO memberVO);
}
