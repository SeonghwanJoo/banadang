package kr.spring.interceptor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.LoginAPI;
import kr.spring.member.service.MemberService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	@Resource
	private MemberService memberService;
	
	@Resource
	private ClubService clubService;
	
	@Resource
	private LoginAPI loginAPI;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			                 HttpServletResponse response,
			               Object handler)throws Exception {
		HttpSession session = request.getSession();
		Logger logger = LoggerFactory.getLogger(this.getClass());
		String user_id=(String)session.getAttribute("user_id");
		if(user_id==null) {
			
			Cookie loginCookie= WebUtils.getCookie(request, "GpFHzB");
			if(loginCookie != null) {
				String refresh_token=loginCookie.getValue();
				Map<String,Object> map= new HashMap<String,Object>();
				map=loginAPI.refreshTokens(refresh_token);
				if (map.get("result").equals("success")) {
					MemberVO member=new MemberVO();
					member = loginAPI.getUserInfo((String)map.get("access_token"));
					try {
						
						if (member!=null) {
							String id=member.getId();
							MemberVO existingMember=memberService.getMember(id);
							if(existingMember !=null && existingMember.getMem_auth()!=3) {
			            		session.setAttribute("mem_auth", existingMember.getMem_auth());
			            		List<ClubVO> myClubs=clubService.selectMyClubs(id);
			                	session.setAttribute("user_id", id);
			                    session.setAttribute("myClubs", myClubs);
			                    
			                    int expires_in=Integer.parseInt((String)map.get("expires_in"));
			                    if(expires_in<(60*60*24*30)) {
			                    	logger.info("refresh_token refreshed");
			                    	Cookie refreshCookie=new Cookie("GpFHzB",refresh_token);
			                    	refreshCookie.setPath("/");
			                    	refreshCookie.setMaxAge(60*60*24*60);
			            			response.addCookie(refreshCookie);
			                    }
			                    
			                    if(myClubs.size()>0) {
			                    	ClubVO club=new ClubVO();
			                        club.setId(id);
			                        club.setClub_num(myClubs.get(0).getClub_num());
			                    	session.setAttribute("myClub", clubService.selectMyClubDetails(club));
			                    }
			                    
			            	}
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
					
				}
			}
		
		}
		return true;
	}
}