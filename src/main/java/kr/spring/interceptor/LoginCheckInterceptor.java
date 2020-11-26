package kr.spring.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.member.service.MemberService;

public class LoginCheckInterceptor 
                        extends HandlerInterceptorAdapter{
	
	
	@Resource
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		
		HttpSession session = request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		if(user_id==null) {
			
			response.sendRedirect(
			request.getContextPath()+"/main/main.do");
			return false;
		}
		
		return true;
	}
}






