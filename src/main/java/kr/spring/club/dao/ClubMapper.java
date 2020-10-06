package kr.spring.club.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.club.domain.ClubVO;
import kr.spring.member.domain.MemberVO;

public interface ClubMapper {
	
	@Select("select * from club_join cj join club c on cj.club_num=c.club_num where cj.id=#{id} and club_auth>3")
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
	
	public Float selectAttendanceRate(MemberVO member);
	
	@Select("select * from (select * from club_join where club_num=#{club_num} order by club_auth desc) a join member_detail b on a.id=b.id")
	public List<MemberVO> selectClubMembers(Integer club_num);
	
	
	@Update("update club_join set club_auth=#{club_auth} where id=#{id} and club_num=#{club_num}")
	public void updateMemberAuth(MemberVO memberVO);
	
	@Delete("delete from club_join where id=#{id} and club_num=#{club_num}")
	public void deleteMemberFromClub(MemberVO memberVO);
	
	@Select("select count(*) from club_join where club_num=#{club_num} and club_auth>3")
	public Integer selectNumberOfMembers(Integer club_num);
	
	@Select("select count(*) from club_join where club_num=#{club_num} and club_auth>4")
	public Integer selectNumberOfManagers(Integer club_num);
	
	@Delete("delete from club_join where club_num=#{club_num}")
	public void deleteClubFromClubJoin(Integer club_num);
	
	@Delete("delete from club where club_num=#{club_num}")
	public void deleteClubFromClub(Integer club_num);
	
	@Delete("delete from club_rating where club_num=#{club_num}")
	public void deleteClubFromclub_rating(Integer club_num);
	
	@Select("select * from (select * from club_rating where club_num=#{club_num} ) a join match b on a.match_num = b.match_num order by match_date desc")
	public List<ClubVO> selectRatings(Integer club_num);
	
	public void updateClub(ClubVO club);
}
