package kr.spring.club.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.club.domain.ClubVO;

public interface ClubMapper {
	
	@Select("select * from club_join cj join club c on cj.club_num=c.club_num where cj.id=#{id}")
	public List<ClubVO> selectMyClubs(String id);
	
	@Select("select * from(select * from club where club_num=#{club_num}) a join (select avg(manner) manner,avg(perform) perform, COUNT(*) rating_count,club_num from club_rating group by club_num) b on a.club_num=b.club_num")
	public ClubVO selectClubDetailWithClub_num(String club_num);
	
	public List<ClubVO> selectAwayDetailsForRequestedMatch(String club_num);
	public List<ClubVO> selectHomeDetailsForRequestedMatch(String club_num);
	
	
	@Select("select * from club")
	public List<ClubVO> selectAllClubs();
	
	@Select("select club_num from club_join where id=#{id}")
	public List<String> selectMyClubs_num(String id);
	
	public Integer insertClub(ClubVO club);
	
	@Insert("")
	public void joinClubWhenCreated(String id);
	
	@Select("select club_seq.nextval from dual")
	public String selectNextSeqForClub_num();
}
