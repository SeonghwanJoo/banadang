package kr.spring.board.service;


import java.util.List;

import kr.spring.board.domain.BoardVO;


public interface BoardService {
	public void insertNotice(BoardVO board);
	public List<BoardVO> selectNotice();
	public BoardVO selectNoticeDetail(Integer notice_num);
	public void updateNotice(BoardVO board);
	public void deleteNotice(Integer notice_num);
	public List<BoardVO> selectQna();
	public BoardVO selectQnaDetail(Integer qna_num);
	public void updateQna(BoardVO board);
	public void deleteQna(Integer qna_num);
	public void insertQna(BoardVO board);
	public List<BoardVO> selectPersonQna(String id);

}
