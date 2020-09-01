package kr.spring.club.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.spring.club.domain.ClubVO;

public interface ClubMapper {
	
	@Select("select * from club_join cj join club c on cj.club_num=c.club_num where cj.id=#{id}")
	public List<ClubVO> selectMyClubs(String id);
	
	@Select("select * from club")
	public List<ClubVO> selectAllClubs();
	
	@Select("select club_num from club_join where id=#{id}")
	public List<String> selectMyClubs_num(String id);
}
