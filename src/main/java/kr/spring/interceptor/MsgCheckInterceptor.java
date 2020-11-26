package kr.spring.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.member.service.MemberService;

public class MsgCheckInterceptor 
                        extends HandlerInterceptorAdapter{
	
	
	@Resource
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//濡쒓렇 �몴�떆
		//濡쒓렇�씤 �뿬遺� 泥댄겕
		HttpSession session = request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		if(user_id!=null) {
			//�떊洹� 硫붿떆吏� �닔 session�꽕�젙
			Integer count_msg=memberService.selectCountMsg(user_id);
	    	session.setAttribute("count_msg", count_msg);
		}
		
		return true;
	}
}






