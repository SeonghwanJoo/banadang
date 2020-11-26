package kr.spring.match.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

public interface MatchMapper {
	
	public void insertMatch(MatchVO matchVO);
	
	@Select("select* from (select match_num,id,type,home,away,away_name,start_time,end_time,cancel,address,address_x,address_y,match_detail,match_date,#{club_num} club_num from gentlepro.match where home=#{club_num} or away=#{club_num})a where match_date>date_sub(now(), interval 1 day) order by match_date")
	public List<MatchVO> selectMyMatch(Integer club_num);
	
	@Select("select * from (select match_num,id,type,home,away,away_name,start_time,end_time,address,match_detail,cancel,match_date,#{club_num} club_num from gentlepro.match where (home=#{club_num} or away=#{club_num}) and away not in (0,-1) and home!=away)a where match_date <date_sub(now(), interval 1 day) and match_date>date_sub(now(), interval 14 day) and cancel is null")
	public List<MatchVO> selectMyPastMatch(Integer club_num);
	
	@Select("select * from gentlepro.match where match_num=#{match_num}")
	public MatchVO selectMatchByMatch_num(int match_num);
	
	@Select("select status from gentlepro.match_vote where id=#{id} and match_num=#{match_num} and club_num=#{club_num}")
	public Integer selectMyVoteStatus(MatchVO matchVO);
	
	@Select("select vote_num from gentlepro.match_vote where id=#{id} and match_num=#{match_num} and club_num=#{club_num}")
	public String selectMyVoteNum(MatchVO matchVO);
	
	@Insert("insert into gentlepro.match_vote (match_num,id,club_num,status) values (#{match_num},#{id},#{club_num},#{status})")
	public void insertVoteStatus(MatchVO matchVO);
	
	@Update("update gentlepro.match_vote set status=#{status} where vote_num=#{vote_num}")
	public void updateVoteStatus(MatchVO matchVO);
	
	@Select("select status,count(*) as count from gentlepro.match_vote where match_num=#{match_num} and club_num=#{club_num} group by status")
	public ArrayList<MatchVO> selectVoteStatusByGroup(MatchVO matchVO);
	
	public ArrayList<MatchVO> selectAverageRating(MatchVO matchVO);
	
	@Select("select clubrating_num from gentlepro.club_rating where id=#{id} and match_num=#{match_num} and club_num=#{club_num}")
	public Integer selectMyRating(MatchVO match);
	
	public void insertRating(MatchVO match);
	public void updateRating(MatchVO match);
	public List<MemberVO> selectVote_detail(MatchVO match);
	public List<MatchVO> selectMatchToInvite();
	public List<MatchVO> selectMatchToInviteWithFilter(MatchVO match);
	public MatchVO selectMatchToInviteByMatch_num(Integer match_num);
	@Select("select request_num from gentlepro.match_request where match_num=#{match_num} and away=#{away} ")
	public Integer selectMyRequestForMatchToInvite(MatchVO match);
	
	public void insertMyRequestForMatchToInvite(MatchVO match);
	
	public void insertRecruit(MatchVO match);
	public MatchVO selectRecruitDetail(Integer recruit_num);
	public List<MatchVO> selectRecruit();
	public List<MatchVO> selectRecruitWithFilter(MatchVO match);
	public List<MemberVO> selectRecruitByClub_num(Integer club_num);
	@Select("select recruit_req_num from gentlepro.recruit_req where match_num=#{match_num} and id=#{id}")
	public Integer selectRecruit_req_num(MatchVO match);
	@Select("select recruit_num from gentlepro.match_recruit where match_num=#{match_num} and club_num=#{club_num} ")
	public Integer selectRecruit_num(MatchVO match);
	
	public void insertRecruitRequest(MatchVO match);
	public void updateRecruit(MatchVO match);
	@Delete("delete from gentlepro.match_recruit where recruit_num=#{recruit_num}")
	public void deleteRecruit(Integer recruit_num);
	
	public MatchVO selectPKsforMatch(Integer match_num);
	
	@Delete("delete from gentlepro.match where match_num=#{match_num}")
	public void deleteMatch(Integer match_num);
	
	@Delete("delete from gentlepro.match_vote where match_num=#{match_num}")
	public void deleteVote(Integer match_num);
	
	@Update("update gentlepro.match set cancel=#{cancel} where match_num=#{match_num} ")
	public void updateMatchForCancel(MatchVO match);
	
	public void updateMatch(MatchVO match);
	
	
	
	

}
