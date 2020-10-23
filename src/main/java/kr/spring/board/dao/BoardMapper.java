package kr.spring.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.board.domain.BoardVO;

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
	
	@Select("select * from qna order by register_date desc")
	public List<BoardVO> selectQna();
	
	public void insertQna(BoardVO board);
	
	@Select("select * from qna where qna_num=#{qna_num}")
	public BoardVO selectQnaDetail(Integer qna_num);
	
	@Update("update qna set content=#{content},title=#{title} where qna_num=#{qna_num}")
	public void updateQna(BoardVO board);
	
	@Delete("delete from qna where qna_num=#{qna_num}")
	public void deleteQna(Integer qna_num);
}
