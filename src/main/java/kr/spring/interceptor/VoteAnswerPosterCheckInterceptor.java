package kr.spring.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.board.domain.BoardVO;
import kr.spring.board.service.BoardService;

public class VoteAnswerPosterCheckInterceptor extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//로그 표시
		logger.info("<VoteAnswerPosterCheckInterCeptor 진입>");
		
		//voteAnswer  작성자 여부 체크
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("user_id");
		
		Integer voteAnswer_num=Integer.parseInt(request.getParameter("voteAnswer_num"));
		BoardVO board=boardService.selectVote_AnswerByVoteAnswer_num(voteAnswer_num);
		logger.info("id / borad.getId : "+id+"/"+board.getId());
		try {
			if(!id.equals(board.getId())) {
				
				//관리자가 아니면 redirect
				response.sendRedirect(request.getContextPath()+"/main/posterCheck.do");
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return true;
	}
}
