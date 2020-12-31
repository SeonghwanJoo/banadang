package kr.spring.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


import kr.spring.match.domain.MatchVO;
import kr.spring.member.dao.MemberMapper;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;

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
	public List<MatchVO> selectClubRecruits(MatchVO match) {
		
		return memberMapper.selectClubRecruits(match);
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
		memberMapper.insertMsgForClubRecruitReq(match);
		
	}

	@Override
	public List<MatchVO> selectMyClubRecruitReq(String id) {
		
		return memberMapper.selectMyClubRecruitReq(id);
		
	}

	@Override
	public void deleteClubRecruitReq(Integer clubRecruit_req_num) {
		
		memberMapper.deleteClubRecruitReq(clubRecruit_req_num);
		
	}

	@Override
	public Integer selectClubRecruit_reqForDuplicate(MatchVO match) {
		
		return memberMapper.selectClubRecruit_reqForDuplicate(match);
		
	}


	@Override
	public void insertMsg(MsgVO msg) {
		
		memberMapper.insertMsg(msg);
		
	}

	@Override
	public MsgVO selectMatchForMsg(MsgVO input) {
		
		return memberMapper.selectMatchForMsg(input);
	}

	@Override
	public List<MsgVO> selectSentMsg(String sender) {
		
		return memberMapper.selectSentMsg(sender);
	}

	@Override
	public List<MsgVO> selectReceivedMsg(String receiver) {
		
		return memberMapper.selectReceivedMsg(receiver);
	}

	@Override
	public void deleteMsgFromReceiver(Integer msg_num) {
		memberMapper.deleteMsgFromReceiver(msg_num);
		
	}

	@Override
	public Integer selectS_Del(Integer msg_num) {
		
		return memberMapper.selectS_Del(msg_num);
	}

	@Override
	public void deleteMsg(Integer msg_num) {
		
		memberMapper.deleteMsg(msg_num);
		
	}

	@Override
	public Integer selectR_Del(Integer msg_num) {
		
		return memberMapper.selectR_Del(msg_num);
	}

	@Override
	public void deleteMsgFromSender(Integer msg_num) {
		
		memberMapper.deleteMsgFromSender(msg_num);
		
	}

	@Override
	public void updateMsgStatus(Integer receiver) {
		
		memberMapper.updateMsgStatus(receiver);
		
	}

	@Override
	public Integer selectCountMsg(String user_id) {
		
		return memberMapper.selectCountMsg(user_id);
	}
	@Override
	public void deleteMember(MemberVO member) {
		
		memberMapper.deleteIDFromclub_join(member);
		memberMapper.deleteIDFromClub_Recruit(member);
		memberMapper.deleteIDFromclubRecruit_req(member);
		memberMapper.deleteIDFromMatch_Recruit(member);
		memberMapper.deleteIDFromMatch_Request(member);
		memberMapper.deleteIDFromMember_Detail(member);
		memberMapper.deleteIDFromMsg(member);
		memberMapper.deleteIDFromNotice(member);
		memberMapper.deleteIDFromQna(member);
		memberMapper.deleteIDFromQna_Answer(member);
		memberMapper.deleteIDFromRecruit_Req(member);
		memberMapper.deleteIDFromVote_Answer(member);
		memberMapper.deleteIDFromVMatch_Vote(member);
		memberMapper.updateIDFromMemberForUnlink(member);
		
	}
	@Override
	public void updateMemberForReValidation(MemberVO member) {
		
		memberMapper.updateMemberForReValidation(member);
		memberMapper.insertMember_detail(member);
		
	}

}
