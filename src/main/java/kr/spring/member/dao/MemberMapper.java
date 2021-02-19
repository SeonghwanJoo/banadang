package kr.spring.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;
import kr.spring.member.domain.ReportVO;

public interface MemberMapper {
	
	@Select("select * from(select * from gentlepro.member where id=#{id}) a left outer join gentlepro.member_detail using(id)")
	public MemberVO getMember(String id);
	
	@Insert("insert into gentlepro.member (id) values (#{id})")
	public void insertMember(MemberVO memberVO);
	
	public void insertMember_detail(MemberVO memberVO);
	
	public void updateMember_detail(MemberVO member);
	
	public List<MatchVO> selectMyRecruitReq(String id);
	
	@Delete("delete from gentlepro.recruit_req where recruit_req_num=#{recruit_req_num}")
	public void deleteRecruitReq(Integer recruit_req_num);

	@Update("update gentlepro.recruit_req set isCanceled=1 where recruit_req_num=#{recruit_req_num}")
	public void updateRecruitReqForCancel(Integer recruit_req_num);
	
	public void insertClubRecruit(MatchVO match);
	public MatchVO selectClubRecruitWithClubDetail(Integer clubRecruit_num);
	public List<MatchVO> selectClubRecruits(MatchVO match);
	
	@Delete("delete from gentlepro.club_recruit where clubRecruit_num=#{clubRecruit_num}")
	public void deleteClubRecruit(Integer clubRecruit_num);
	
	public void updateClubRecruit(MatchVO match);
	
	public void insertClubRecruitReq(MatchVO match);
	public List<MatchVO> selectMyClubRecruitReq(String id);
	
	@Delete("delete from gentlepro.clubrecruit_req where clubRecruit_req_num=#{clubRecruit_req_num}")
	public void deleteClubRecruitReq(Integer clubRecruit_req_num);
	
	@Select("select clubRecruit_req_num from gentlepro.clubrecruit_req where id=#{id} and clubRecruit_num=#{clubRecruit_num}")
	public Integer selectClubRecruit_reqForDuplicate(MatchVO match);
	
	public MsgVO selectMatchForMsg(MsgVO input);
	
	public MsgVO selectReceiverDetailWithoutMatch(MsgVO input);
	
	public void insertMsg(MsgVO msg);
	
	@Select("select * from (select * from gentlepro.msg where sender=#{sender} and s_del=1 )a left outer join gentlepro.member_detail b on a.receiver=b.id order by register_date desc")
	public List<MsgVO> selectSentMsg(String sender);
	
	@Select("select * from (select * from gentlepro.msg where receiver=#{receiver} and r_del=1 ) a left outer join gentlepro.member_detail b on a.sender=b.id order by register_date desc")
	public List<MsgVO> selectReceivedMsg(String receiver);
	
	@Update("update gentlepro.msg set r_del=2 where msg_num=#{msg_num}")
	public void deleteMsgFromReceiver(Integer msg_num);
	
	@Select("select count(*) from gentlepro.msg where receiver=#{user_id} and status=1")
	public Integer selectCountMsg(String user_id);
	
	@Update("update gentlepro.msg set s_del=2 where msg_num=#{msg_num}")
	public void deleteMsgFromSender(Integer msg_num);
	
	@Select("select s_del from gentlepro.msg where msg_num=#{msg_num}")
	public Integer selectS_Del(Integer msg_num);
	
	@Select("select r_del from gentlepro.msg where msg_num=#{msg_num}")
	public Integer selectR_Del(Integer msg_num);
	
	@Delete("delete from gentlepro.msg where msg_num=#{msg_num}")
	public void deleteMsg(Integer msg_num);
	
	@Update("update gentlepro.msg set status=2 where receiver=#{receiver}")
	public void updateMsgStatus(Integer receiver);
	
	@Delete("delete from gentlepro.club_join where id=#{id}")
	public void deleteIDFromclub_join(MemberVO member);
	
	@Delete("delete from gentlepro.club_recruit where id=#{id}")
	public void deleteIDFromClub_Recruit(MemberVO member);
	
	@Delete("delete from gentlepro.clubrecruit_req where id=#{id}")
	public void deleteIDFromclubRecruit_req(MemberVO member);
	
	@Delete("delete from gentlepro.match_recruit where id=#{id}")
	public void deleteIDFromMatch_Recruit(MemberVO member);
	
	@Delete("delete from gentlepro.match_request where id=#{id}")
	public void deleteIDFromMatch_Request(MemberVO member);
	
	@Delete("delete from gentlepro.member_detail where id=#{id}")
	public void deleteIDFromMember_Detail(MemberVO member);
	
	@Delete("delete from gentlepro.msg where (receiver=#{id} or sender=#{id})")
	public void deleteIDFromMsg(MemberVO member);
	
	@Delete("delete from gentlepro.notice where id=#{id}")
	public void deleteIDFromNotice(MemberVO member);
	
	@Delete("delete from gentlepro.qna where id=#{id}")
	public void deleteIDFromQna(MemberVO member);
	
	@Delete("delete from gentlepro.qna_answer where id=#{id}")
	public void deleteIDFromQna_Answer(MemberVO member);
	
	@Delete("delete from gentlepro.recruit_req where id=#{id}")
	public void deleteIDFromRecruit_Req(MemberVO member);
	
	@Delete("delete from gentlepro.vote_answer where id=#{id}")
	public void deleteIDFromVote_Answer(MemberVO member);
	
	@Delete("delete from gentlepro.match_vote where id=#{id}")
	public void deleteIDFromVMatch_Vote(MemberVO member);
	
	@Update("update gentlepro.member set mem_auth=3, reason=#{reason} where id=#{id}")
	public void updateIDFromMemberForUnlink(MemberVO member);
	
	@Update("update gentlepro.member set mem_auth=1 where id=#{id}")
	public void updateMemberForReValidation(MemberVO member);
	
	@Insert("insert into gentlepro.msg (sender,receiver,content,club_num) values (#{id},#{home_name},'팀 가입 신청합니다.   ',#{club_num})")
	public void insertMsgForClubRecruitReq(MatchVO match);
	
	@Insert("insert into gentlepro.report (source, reported_id, reporting_id, write_num, name, content, reason) values (#{source}, #{reported_id}, #{reporting_id}, #{write_num}, #{name}, #{content}, #{reason})")
	public void insertReport(ReportVO report);
	
}
