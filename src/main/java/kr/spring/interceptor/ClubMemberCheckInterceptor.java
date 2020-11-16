package kr.spring.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;

public class ClubMemberCheckInterceptor  extends HandlerInterceptorAdapter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ClubService clubService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		//로그 표시
		logger.info("<<ClubMemberCheckInterCeptor 진입>>");
		//requestParameter에서 club_num을 받는다
		//session에서 myClubs를 받는다
		//myClubs에 club_num이 있는지 확인 한다
		//myClubs가 null이 거나 club_num이 없으면 redirect한다
		Integer club_num=Integer.parseInt((String)request.getParameter("club_num"));
		
		HttpSession session = request.getSession();
		List<ClubVO> myClubs=null;
		myClubs=(List)session.getAttribute("myClubs");
		
		try {
			if(myClubs!=null) {
				int count=0;
				for(ClubVO myClub : myClubs) {
					if(myClub.getClub_num().equals(club_num)) {
						count++;
					}
				}
				if(count==0) {
					response.sendRedirect(
							request.getContextPath()+"/main/membercheck.do");
					return false;
				}
				
			}
			/*else if(myClubs==null) {
				response.sendRedirect(
						request.getContextPath()+"/main/myClubCheck.do");
				return false;
			}*/
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
}
