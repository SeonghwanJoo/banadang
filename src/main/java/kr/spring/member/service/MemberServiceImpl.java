package kr.spring.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.match.domain.MatchVO;
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

	@Override
	public void updateMember_detail(MemberVO member) {
		memberMapper.updateMember_detail(member);
		
	}

	@Override
	public List<MatchVO> selectMyRecruitReq(String id) {
		
		return memberMapper.selectMyRecruitReq(id);
	}

}
