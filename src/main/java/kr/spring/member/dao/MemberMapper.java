package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.domain.MemberVO;

public interface MemberMapper {
	
	@Select("select * from member_detail where id=#{id}")
	public MemberVO getMember(String id);
	
	@Insert("insert into member (id) values (#{id})")
	public void insertMember(MemberVO memberVO);
	
	@Insert("insert into member_detail(id,nickname,profile_image,thumbnail_image,email,age_range) values(#{id},#{nickname},#{profile_image},#{thumbnail_image},#{email},#{age_range})")
	public void insertMember_detail(MemberVO memberVO);
	


	
}
