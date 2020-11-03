package kr.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemAuthCheckInterceptor extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//로그 표시
		logger.info("<<ClubAuthCheckInterCeptor 진입>>");
		
		//mem_auth 체크
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("mem_auth")<2) {
			
			//관리자가 아니면 redirect
			response.sendRedirect(request.getContextPath()+"/main/memberAuthCheck.do");
			return false;
		}
		
		return true;
	}
}
