package kr.spring.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.domain.MsgVO;

public interface MemberMapper {
	
	@Select("select * from(select * from member_detail where id=#{id}) join member using(id)")
	public MemberVO getMember(String id);
	
	@Insert("insert into member (id) values (#{id})")
	public void insertMember(MemberVO memberVO);
	
	public void insertMember_detail(MemberVO memberVO);
	
	public void updateMember_detail(MemberVO member);
	
	public List<MatchVO> selectMyRecruitReq(String id);
	
	@Delete("delete from recruit_req where recruit_req_num=#{recruit_req_num}")
	public void deleteRecruitReq(Integer recruit_req_num);

	@Update("update recruit_req set isCanceled=1 where recruit_req_num=#{recruit_req_num}")
	public void updateRecruitReqForCancel(Integer recruit_req_num);
	
	public void insertClubRecruit(MatchVO match);
	public MatchVO selectClubRecruitWithClubDetail(Integer clubRecruit_num);
	public List<MatchVO> selectClubRecruits();
	
	@Delete("delete from club_recruit where clubRecruit_num=#{clubRecruit_num}")
	public void deleteClubRecruit(Integer clubRecruit_num);
	
	public void updateClubRecruit(MatchVO match);
	
	public void insertClubRecruitReq(MatchVO match);
	public List<MatchVO> selectMyClubRecruitReq(String id);
	
	@Delete("delete from clubRecruit_req where clubRecruit_req_num=#{clubRecruit_req_num}")
	public void deleteClubRecruitReq(Integer clubRecruit_req_num);
	
	@Select("select clubRecruit_req_num from clubRecruit_req where id=#{id} and clubRecruit_num=#{clubRecruit_num}")
	public Integer selectClubRecruit_reqForDuplicate(MatchVO match);
	
	public MsgVO selectMatchForMsg(MsgVO input);
	
	public MsgVO selectReceiverDetailWithoutMatch(MsgVO input);
	
	public void insertMsg(MsgVO msg);
	
	@Select("select * from(select * from (select * from msg where sender=#{sender} and s_del=1 order by register_date desc)a left outer join member_detail b on a.receiver=b.id ) join club using(club_num) ")
	public List<MsgVO> selectSentMsg(String sender);
	
	@Select("select * from(select * from (select * from msg where receiver=#{receiver} and r_del=1 order by register_date desc) a left outer join member_detail b on a.sender=b.id) join club using(club_num)")
	public List<MsgVO> selectReceivedMsg(String receiver);
	
	@Update("update msg set r_del=2 where msg_num=#{msg_num}")
	public void deleteMsgFromReceiver(Integer msg_num);
	
	@Select("select count(*) from msg where receiver=#{user_id} and status=1")
	public Integer selectCountMsg(String user_id);
	
	@Update("update msg set s_del=2 where msg_num=#{msg_num}")
	public void deleteMsgFromSender(Integer msg_num);
	
	@Select("select s_del from msg where msg_num=#{msg_num}")
	public Integer selectS_Del(Integer msg_num);
	
	@Select("select r_del from msg where msg_num=#{msg_num}")
	public Integer selectR_Del(Integer msg_num);
	
	@Delete("delete from msg where msg_num=#{msg_num}")
	public void deleteMsg(Integer msg_num);
	
	@Update("update msg set status=2 where receiver=#{receiver}")
	public void updateMsgStatus(Integer receiver);
	
	
}
