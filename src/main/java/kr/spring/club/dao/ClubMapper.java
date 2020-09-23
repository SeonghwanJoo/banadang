package kr.spring.club.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.club.domain.ClubVO;

public interface ClubMapper {
	
	@Select("select * from club_join cj join club c on cj.club_num=c.club_num where cj.id=#{id}")
	public List<ClubVO> selectMyClubs(String id);
	
	@Select("select * from(select * from club where club_num=#{club_num}) a left outer join (select avg(manner) manner,avg(perform) perform, COUNT(*) rating_count,club_num from club_rating group by club_num) b on a.club_num=b.club_num")
	public ClubVO selectClubDetailWithClub_num(String club_num);
	
	@Select("select club_auth from club_join where id=#{id} and club_num=#{club_num}")
	public Integer selectClubAuth(ClubVO club);
	
	public List<ClubVO> selectAwayDetailsForRequestedMatch(String club_num);
	public List<ClubVO> selectHomeDetailsForRequestedMatch(String club_num);
	
	
	@Select("select * from club")
	public List<ClubVO> selectAllClubs();
	
	@Select("select club_num from club_join where id=#{id}")
	public List<String> selectMyClubs_num(String id);
	
	public void insertClub(ClubVO club);
	
	@Insert("insert into club_join (club_num,id) values(#{club_num},#{id})")
	public void insertClubMember(ClubVO club);
	
	@Insert("insert into club_join (club_num,id,club_auth) values(#{club_num},#{id},6)")
	public void joinClubWhenCreated(ClubVO club);
	
	@Select("select club_seq.nextval from dual")
	public String selectNextSeqForClub_num();
}
