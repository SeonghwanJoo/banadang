package kr.spring.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

public interface MemberMapper {
	
	@Select("select * from member_detail where id=#{id}")
	public MemberVO getMember(String id);
	
	@Insert("insert into member (id) values (#{id})")
	public void insertMember(MemberVO memberVO);
	
	public void insertMember_detail(MemberVO memberVO);
	
	public void updateMember_detail(MemberVO member);
	
	public List<MatchVO> selectMyRecruitReq(String id);


	
}
