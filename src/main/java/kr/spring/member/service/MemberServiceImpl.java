package kr.spring.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


import kr.spring.match.domain.MatchVO;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.domain.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	Logger logger = LoggerFactory.getLogger(this.getClass());
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

	@Override
	public void deleteRecruitReq(Integer recruit_req_num) {
		memberMapper.deleteRecruitReq(recruit_req_num);
		
	}

	@Override
	public void updateRecruitReqForCancel(Integer recruit_req_num) {
		memberMapper.updateRecruitReqForCancel(recruit_req_num);
		
	}

	@Override
	public void insertClubRecruit(MatchVO match) {
		memberMapper.insertClubRecruit(match);
		
	}

	@Override
	public MatchVO selectClubRecruitWithClubDetail(Integer clubRecruit_num) {
		
		return memberMapper.selectClubRecruitWithClubDetail(clubRecruit_num);
	}

	@Override
	public List<MatchVO> selectClubRecruits() {
		
		return memberMapper.selectClubRecruits();
	}

	@Override
	public void deleteClubRecruit(Integer clubRecruit_num) {
		
		memberMapper.deleteClubRecruit(clubRecruit_num);
		
	}

	@Override
	public void updateClubRecruit(MatchVO match) {
		
		memberMapper.updateClubRecruit(match);
		
	}

	@Override
	public void insertClubRecruitReq(MatchVO match) {
		
		memberMapper.insertClubRecruitReq(match);
		
	}

	@Override
	public List<MatchVO> selectMyClubRecruitReq(String id) {
		
		return memberMapper.selectMyClubRecruitReq(id);
		
	}

	@Override
	public void deleteClubRecruitReq(Integer clubRecruit_req_num) {
		
		memberMapper.deleteClubRecruitReq(clubRecruit_req_num);
		
	}

}
