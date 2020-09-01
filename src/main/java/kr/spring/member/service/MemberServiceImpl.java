package kr.spring.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.domain.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource
	private MemberMapper memberMapper;
	
	@Override
	public MemberVO getMember(String id) {
		
		return memberMapper.getMember(id);
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		memberMapper.insertMember(memberVO);
		memberMapper.insertMember_detail(memberVO);
	}

}
