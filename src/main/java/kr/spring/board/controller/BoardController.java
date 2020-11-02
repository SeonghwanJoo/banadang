package kr.spring.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.domain.BoardVO;
import kr.spring.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/board/notice.do")
	public ModelAndView notice() {
		
		ModelAndView mav=new ModelAndView();
		
		List<BoardVO> boards=boardService.selectNotice();
		mav.addObject("boards", boards);
		mav.addObject("title","공지사항");
		mav.setViewName("notice");
		
		return mav;
	}
	@RequestMapping("/board/qna.do")
	public ModelAndView qna() {
		
		ModelAndView mav=new ModelAndView();
		
		List<BoardVO> boards=boardService.selectQna();
		mav.addObject("boards",boards);
		mav.addObject("title","자주 묻는 질문");
		mav.setViewName("qna");
		return mav;
		
	}
	@RequestMapping("board/writeNotice.do")
	public ModelAndView writeNotice() {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title","공지사항 작성");
		mav.setViewName("writeNotice");
		
		
		return mav;
	}
	@RequestMapping("board/writeQna.do")
	public ModelAndView writeQna() {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("title","자주 묻는 질문 작성");
		mav.setViewName("writeQna");
		
		return mav;
	}
	@RequestMapping("/board/postNotice.do")
	public String postNotice(BoardVO board) {
		
		boardService.insertNotice(board);
		
		return "redirect:/board/noticeDetail.do?notice_num="+board.getNotice_num();
		
	}
	@RequestMapping("/board/postQna.do")
	public String postQna(BoardVO board) {
		
		logger.info("fromUser : "+board.getFromUser());
		boardService.insertQna(board);
		
		return "redirect:/board/qnaDetail.do?qna_num="+board.getQna_num();
		
	}
	@RequestMapping("/board/noticeDetail.do")
	public ModelAndView noticeDetail(Integer notice_num) {
		
		ModelAndView mav=new ModelAndView();
		BoardVO board=boardService.selectNoticeDetail(notice_num);
		mav.addObject("board", board);
		mav.addObject("title","공지사항");
		mav.setViewName("noticeDetail");
		
		return mav;
	}
	@RequestMapping("/board/qnaDetail.do")
	public ModelAndView qnaDetail(Integer qna_num) {
		
		ModelAndView mav=new ModelAndView();
		BoardVO board=boardService.selectQnaDetail(qna_num);
		List<BoardVO> answers=boardService.selectQna_answer(qna_num);
		mav.addObject("board", board);
		mav.addObject("answers",answers);
		if(board.getFromUser()==null) {
			mav.addObject("title","자주 묻는 질문");
		}else if(board.getFromUser()==1) {
			mav.addObject("title","나의 문의 사항");
		}
		
		mav.setViewName("qnaDetail");
		
		return mav;
	}
	@RequestMapping("/board/modifyNotice.do")
	public ModelAndView modifyNotice(Integer notice_num) {
		ModelAndView mav=new ModelAndView();
		BoardVO board=boardService.selectNoticeDetail(notice_num);
		mav.addObject("title","공지사항 수정");
		mav.addObject("board",board);
		mav.setViewName("modifyNotice");
		
		return mav;
	}
	@RequestMapping("/board/modifyQna.do")
	public ModelAndView modifyQna(Integer qna_num) {
		ModelAndView mav=new ModelAndView();
		BoardVO board=boardService.selectQnaDetail(qna_num);
		mav.addObject("title","질문 수정");
		mav.addObject("board",board);
		mav.setViewName("modifyQna");
		
		return mav;
	}
	@RequestMapping("/board/updateNotice.do")
	public String updateNotice(BoardVO board) {
		
		boardService.updateNotice(board);
		
		return "redirect:/board/noticeDetail.do?notice_num="+board.getNotice_num();
	}
	@RequestMapping("/board/updateQna.do")
	public String updateQna(BoardVO board) {
		
		boardService.updateQna(board);
		
		return "redirect:/board/qnaDetail.do?qna_num="+board.getQna_num();
	}
	@RequestMapping("/board/deleteNotice.do")
	public String deleteNotice(Integer notice_num) {
		
		boardService.deleteNotice(notice_num);
		
		return "redirect:/board/notice.do";
		
	}
	@RequestMapping("/board/deleteQna.do")
	public String deleteQna(Integer qna_num) {
		
		boardService.deleteQna(qna_num);
		
		return "redirect:/board/qna.do";
		
	}
	@RequestMapping("/board/personalQnaWrite.do")
	public ModelAndView personalQnaWrite() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("title","문의 사항 작성");
		mav.addObject("fromUser",1);
		mav.setViewName("writeQna");
		return mav;
	}
	@RequestMapping("/board/personalQna.do")
	public ModelAndView personalQna(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		String id=(String)session.getAttribute("user_id");
		List<BoardVO> boards=boardService.selectPersonQna(id);
		mav.addObject("title","나의 문의 사항");
		mav.addObject("boards",boards);
		mav.addObject("fromUser",1);
		mav.setViewName("qna");
		return mav;
	}
	@RequestMapping("/board/replytoQna.do")
	public ModelAndView replyToQna(Integer qna_num) {
		
		ModelAndView mav=new ModelAndView();
		BoardVO board=boardService.selectQnaDetail(qna_num);
		List<BoardVO> answers=boardService.selectQna_answer(qna_num);
		mav.addObject("answers",answers);
		mav.addObject("board", board);
		mav.addObject("qna_num",qna_num);
		mav.addObject("title","답글 쓰기");
		mav.setViewName("replytoQna");
		
		return mav;
		
	}
	@RequestMapping("/board/modifyAnswer.do")
	public ModelAndView modifyAnswer(Integer answer_num) {
		
		ModelAndView mav=new ModelAndView();
		BoardVO board=boardService.selectQna_answerByAnswer_num(answer_num);
		mav.addObject("board",board);
		mav.addObject("title","답글 수정");
		mav.setViewName("modifyAnswer");
		return mav;
		
	}

			
}
