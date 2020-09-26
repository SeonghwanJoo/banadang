package kr.spring.club.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.club.domain.ClubVO;
import kr.spring.member.domain.MemberVO;

public interface ClubMapper {
	
	@Select("select * from club_join cj join club c on cj.club_num=c.club_num where cj.id=#{id}")
	public List<ClubVO> selectMyClubs(String id);
	
	@Select("select * from(select * from club where club_num=#{club_num}) a left outer join (select avg(manner) manner,avg(perform) perform, COUNT(*) rating_count,club_num from club_rating group by club_num) b on a.club_num=b.club_num")
	public ClubVO selectClubDetailWithClub_num(Integer club_num);
	
	@Select("select club_auth from club_join where id=#{id} and club_num=#{club_num}")
	public Integer selectClubAuth(ClubVO club);
	
	public List<ClubVO> selectAwayDetailsForRequestedMatch(Integer club_num);
	public List<ClubVO> selectHomeDetailsForRequestedMatch(Integer club_num);
	
	
	@Select("select * from club")
	public List<ClubVO> selectAllClubs();
	
	@Select("select club_num from club_join where id=#{id}")
	public List<Integer> selectMyClubs_num(String id);
	
	public void insertClub(ClubVO club);
	
	@Insert("insert into club_join (club_num,id) values(#{club_num},#{id})")
	public void insertClubMember(ClubVO club);
	
	@Insert("insert into club_join (club_num,id,club_auth) values(#{club_num},#{id},6)")
	public void joinClubWhenCreated(ClubVO club);
	
	@Select("select club_seq.nextval from dual")
	public String selectNextSeqForClub_num();
	
	@Update("update match_request set acceptance=#{acceptance} where request_num=#{request_num}")
	public void updateAcceptance(ClubVO club);
	
	@Update("update match_request set acceptance=3 where match_num=#{match_num} and away not in #{club_num}")
	public void rejectOthers(ClubVO club);
	
	@Update("update match set away=#{club_num} where match_num=#{match_num}")
	public void updateAwayforMatch(ClubVO club);
	
	public float selectAttendaceRate(MemberVO member);
}
