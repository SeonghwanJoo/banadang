package kr.spring.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.member.service.MemberService;

public class MsgCheckInterceptor 
                        extends HandlerInterceptorAdapter{
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//로그 표시
		if(log.isDebugEnabled()) {
			log.debug("<<MsgCheckInterceptor 진입>>");
		}
		//로그인 여부 체크
		HttpSession session = request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		if(user_id!=null) {
			//신규 메시지 수 session설정
			Integer count_msg=memberService.selectCountMsg(user_id);
	    	session.setAttribute("count_msg", count_msg);
		}
		
		return true;
	}
}






