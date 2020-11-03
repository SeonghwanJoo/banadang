package kr.spring.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;

public class AwayCheckInterceptor extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private MatchService matchService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//로그 표시
		logger.info("<<AwayCheckInterCeptor 진입>>");
		
		
		Integer match_num=Integer.parseInt(request.getParameter("match_num"));
		MatchVO match=matchService.selectMatchByMatch_num(match_num);
		try {
			if(match.getAway()!=0) {
				
				//상대팀 모집중인 경기가 아니면 redirect
				response.sendRedirect(request.getContextPath()+"/main/posterCheck.do");
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return true;
	}
}
