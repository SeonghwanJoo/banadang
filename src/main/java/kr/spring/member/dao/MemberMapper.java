package kr.spring.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

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
}
