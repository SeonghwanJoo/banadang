package kr.spring.member.service;

import java.util.List;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;
import kr.spring.member.domain.ReportVO;

public interface MemberService {
	public MemberVO getMember(String id);
	public void insertMember(MemberVO memberVO);
	public void updateMember_detail(MemberVO member);
	public List<MatchVO> selectMyRecruitReq(String id);
	public void deleteRecruitReq(Integer recruit_req_num);
	public void updateRecruitReqForCancel(Integer recruit_req_num);
	public void insertClubRecruit(MatchVO match);
	public MatchVO selectClubRecruitWithClubDetail(Integer clubRecruit_num);
	public List<MatchVO> selectClubRecruits(MatchVO match);
	public void deleteClubRecruit(Integer clubRecruit_num);
	public void updateClubRecruit(MatchVO match);
	public void insertClubRecruitReq(MatchVO match);
	public List<MatchVO> selectMyClubRecruitReq(String id);
	public void deleteClubRecruitReq(Integer clubRecruit_req_num);
	public Integer selectClubRecruit_reqForDuplicate(MatchVO match);
	public MsgVO selectMatchForMsg(MsgVO input);
	public void insertMsg(MsgVO msg);
	public List<MsgVO> selectSentMsg(String sender);
	public List<MsgVO> selectReceivedMsg(String receiver);
	public void deleteMsgFromReceiver(Integer msg_num);
	public Integer selectS_Del(Integer msg_num);
	public void deleteMsg(Integer msg_num);
	public Integer selectR_Del(Integer msg_num);
	public void deleteMsgFromSender(Integer msg_num);
	public void updateMsgStatus(Integer receiver);
	public Integer selectCountMsg(String user_id);
	public void deleteMember(MemberVO member);
	public void updateMemberForReValidation(MemberVO member);
	public void insertReport(ReportVO report);
	public void updateProfile(MemberVO member);
	
}
