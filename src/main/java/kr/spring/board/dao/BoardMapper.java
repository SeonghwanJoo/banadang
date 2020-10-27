package kr.spring.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.domain.BoardVO;
import kr.spring.match.domain.MatchVO;

public interface BoardMapper {
	
	public void insertNotice(BoardVO board);
	
	@Select("select * from notice order by register_date desc")
	public List<BoardVO> selectNotice();
	
	@Select("select * from notice where notice_num=#{notice_num}")
	public BoardVO selectNoticeDetail(Integer notice_num);
	
	@Update("update notice set content=#{content},title=#{title} where notice_num=#{notice_num}")
	public void updateNotice(BoardVO board);
	
	@Delete("delete from notice where notice_num=#{notice_num}")
	public void deleteNotice(Integer notice_num);
	
	@Select("select * from qna where fromuser is null order by register_date desc")
	public List<BoardVO> selectQna();
	
	public void insertQna(BoardVO board);
	
	@Select("select * from qna where qna_num=#{qna_num}")
	public BoardVO selectQnaDetail(Integer qna_num);
	
	@Update("update qna set content=#{content},title=#{title} where qna_num=#{qna_num}")
	public void updateQna(BoardVO board);
	
	@Delete("delete from qna where qna_num=#{qna_num}")
	public void deleteQna(Integer qna_num);
	
	@Select("select * from qna where id=#{id} and fromUser=1 order by register_date desc")
	public List<BoardVO> selectPersonQna(String id);
	
	@Insert("insert into qna_answer (qna_num,id,content) values(#{qna_num},#{id},#{content})")
	public void insertQna_answer(BoardVO board);
	
	@Select("select * from(select  * from qna_answer where qna_num=#{qna_num} order by register_date) join member_detail using(id)")
	public List<BoardVO> selectQna_answer(Integer qna_num);
	
	@Delete("delete from qna_answer where answer_num=#{answer_num}")
	public void deleteQna_answer(Integer answer_num);
	
	@Select("select * from qna_answer where answer_num=#{answer_num}")
	public BoardVO selectQna_answerByAnswer_num(Integer answer_num);
	
	@Update("update qna_answer set content=#{content} where answer_num=#{answer_num}")
	public void updateQna_answer(BoardVO board);
	
	@Insert("insert into vote_answer (club_num,match_num,id,content) values(#{club_num},#{match_num},#{id},#{content})")
	public void insertVote_answer(BoardVO board);
	
	@Select("select* from(select * from vote_answer where club_num=#{club_num} and match_num=#{match_num}) join member_detail using(id)")
	public List<BoardVO> selectVote_answer(MatchVO match);
}
