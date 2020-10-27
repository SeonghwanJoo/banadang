package kr.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.domain.BoardVO;
import kr.spring.board.service.BoardService;

@Controller
public class BoardAjaxController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@RequestMapping("/board/postAnswer.do")
	@ResponseBody
	public Map<String,Object> postAnswer(BoardVO board){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			
			boardService.insertQna_answer(board);
			List<BoardVO> answers=boardService.selectQna_answer(board.getQna_num());
			map.put("result", "success");
			map.put("answers", answers);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		
		return map;
	}
	@RequestMapping("/board/deleteAnswer.do")
	@ResponseBody
	public Map<String,Object> deleteAnswer(Integer answer_num){
		
		Map<String, Object> map=new HashMap<String,Object>();
		try {
			boardService.deleteQna_answer(answer_num);
			map.put("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
			
		}
		return map;
	}
	@RequestMapping("/board/updateAnswer.do")
	@ResponseBody
	public Map<String,Object> updateAnswer(BoardVO board){
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			boardService.updateQna_answer(board);
			map.put("result", "success");
		}catch(Exception e) {
			map.put("result", "errors");
		}
				
		return map;
	}
}
