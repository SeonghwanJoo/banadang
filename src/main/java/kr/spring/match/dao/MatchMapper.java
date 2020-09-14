package kr.spring.match.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.match.domain.MatchVO;
import kr.spring.member.domain.MemberVO;

public interface MatchMapper {
	
	public void insertMatch(MatchVO matchVO);
	
	@Select("select match_num,id,type,home,away,start_time,end_time,address,match_detail,match_date,#{club_num} club_num from match where home=#{club_num} or away=#{club_num} and match_date>sysdate-1 order by match_date")
	public List<MatchVO> selectMyMatch(String club_num);
	
	@Select("select * from (select match_num,id,type,home,away,start_time,end_time,address,match_detail,match_date,#{club_num} club_num from match where home=#{club_num} or away=#{club_num}) where match_date <sysdate-1 and match_date>sysdate-14")
	public List<MatchVO> selectMyPastMatch(String club_num);
	
	@Select("select * from match where match_num=#{match_num}")
	public MatchVO selectMatchByMatch_num(int match_num);
	
	@Select("select status from match_vote where id=#{id} and match_num=#{match_num} and club_num=#{club_num}")
	public Integer selectMyVoteStatus(MatchVO matchVO);
	
	@Select("select vote_num from match_vote where id=#{id} and match_num=#{match_num} and club_num=#{club_num}")
	public String selectMyVoteNum(MatchVO matchVO);
	
	@Insert("insert into match_vote (vote_num,match_num,id,club_num,status) values (vote_seq.nextval,#{match_num},#{id},#{club_num},#{status})")
	public void insertVoteStatus(MatchVO matchVO);
	
	@Update("update match_vote set status=#{status} where vote_num=#{vote_num}")
	public void updateVoteStatus(MatchVO matchVO);
	
	@Select("select status,count(*) as count from match_vote where match_num=#{match_num} and club_num=#{club_num} group by status")
	public ArrayList<MatchVO> selectVoteStatusByGroup(MatchVO matchVO);
	
	public List<MatchVO> selectAverageRating(MatchVO matchVO);
	
	@Select("select clubrating_num from club_rating where id=#{id} and match_num=#{match_num} and club_num=#{club_num}")
	public Integer selectMyRating(MatchVO match);
	
	public void insertRating(MatchVO match);
	public void updateRating(MatchVO match);
	public List<MemberVO> selectVote_detail(MatchVO match);
	public List<MatchVO> selectMatchToInvite();
	public MatchVO selectMatchToInviteByMatch_num(Integer match_num);

}
