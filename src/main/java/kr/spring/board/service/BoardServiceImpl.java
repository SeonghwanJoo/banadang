package kr.spring.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.board.dao.BoardMapper;
import kr.spring.board.domain.BoardVO;
import kr.spring.match.domain.MatchVO;

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

	@Override
	public void insertQna_answer(BoardVO board) {
		
		boardMapper.insertQna_answer(board);
		
	}

	@Override
	public List<BoardVO> selectQna_answer(Integer qna_num) {
		
		return boardMapper.selectQna_answer(qna_num);
	}

	@Override
	public void deleteQna_answer(Integer answer_num) {
		
		boardMapper.deleteQna_answer(answer_num);
		
	}

	@Override
	public BoardVO selectQna_answerByAnswer_num(Integer answer_num) {
		
		return boardMapper.selectQna_answerByAnswer_num(answer_num);
	}

	@Override
	public void updateQna_answer(BoardVO board) {
		
		boardMapper.updateQna_answer(board);
		
	}

	@Override
	public void insertVote_answer(BoardVO board) {
		
		boardMapper.insertVote_answer(board);
		
	}

	@Override
	public List<BoardVO> selectVote_answer(MatchVO match) {
		
		return boardMapper.selectVote_answer(match);
	}
	
	
}
