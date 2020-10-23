package kr.spring.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.board.dao.BoardMapper;
import kr.spring.board.domain.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardMapper boardMapper;

	@Override
	public void insertNotice(BoardVO board) {
		
		boardMapper.insertNotice(board);
		
	}

	@Override
	public List<BoardVO> selectNotice() {
		
		return boardMapper.selectNotice();
	}

	@Override
	public BoardVO selectNoticeDetail(Integer notice_num) {
		
		return boardMapper.selectNoticeDetail(notice_num);
	}

	@Override
	public void updateNotice(BoardVO board) {
		
		boardMapper.updateNotice(board);
		
	}

	@Override
	public void deleteNotice(Integer notice_num) {
		
		boardMapper.deleteNotice(notice_num);
		
	}

	@Override
	public List<BoardVO> selectQna() {
		
		return boardMapper.selectQna();
	}

	@Override
	public BoardVO selectQnaDetail(Integer qna_num) {
		
		return boardMapper.selectQnaDetail(qna_num);
	}

	@Override
	public void updateQna(BoardVO board) {
		
		boardMapper.updateQna(board);
		
	}

	@Override
	public void deleteQna(Integer qna_num) {
		
		boardMapper.deleteQna(qna_num);
		
	}

	@Override
	public void insertQna(BoardVO board) {
		
		boardMapper.insertQna(board);
		
	}

	@Override
	public List<BoardVO> selectPersonQna(String id) {
		
		return boardMapper.selectPersonQna(id);
	}
	
}
