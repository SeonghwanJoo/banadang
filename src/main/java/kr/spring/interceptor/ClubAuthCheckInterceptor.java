package kr.spring.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;

public class ClubAuthCheckInterceptor 
                        extends HandlerInterceptorAdapter{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ClubService clubService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//로그 표시
		logger.info("<<ClubAuthCheckInterCeptor 진입>>");
		//로그인 여부 체크
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("user_id");
		ClubVO myClub=(ClubVO)session.getAttribute("myClub");
		if(myClub!=null) {
			myClub.setId(id);
			int club_auth=clubService.selectClubAuth(myClub);
			if(club_auth==4) {
				//포워드 방식으로 view 호출
				response.sendRedirect(
						request.getContextPath()+"/main/authcheck.do");
				return false;
			}
		}else if(myClub==null) {
			response.sendRedirect(
					request.getContextPath()+"/main/myClubcheck.do");
			return false;
		}
		
		
		return true;
	}
}






