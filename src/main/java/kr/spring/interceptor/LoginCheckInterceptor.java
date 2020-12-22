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

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	
	
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
			
			//쿠키가 있는지 확인한다
			//쿠키 refresh_token으로 access_token을 갱신한다
			//refresh token만료 일이 한달이내로 남았을 때는 refresh token을 업데이트하고 쿠키를 저장한다**
			//access_token으로 유저 정보를 받는다
			//db에 유효한 회원인지 확인한다
			//유효한 회원이면 로그인 처리한다(로그아웃시에는 refresh token을 삭제한다**)
			//Login check interceptor외에 추가적으로 token갱신할 부분은 추가적인 interceptor작성**
			//voteForm과 같은 페이지는 해당 페이지에 맞는 myClub을 session에 설정해줘야 함
			Cookie loginCookie= WebUtils.getCookie(request, "GpFHzB");
			if(loginCookie != null) {
				String refresh_token=loginCookie.getValue();
				Map<String,Object> map= new HashMap<String,Object>();
				map=loginAPI.refreshTokens(refresh_token);
				if (map.get("result").equals("success")) {
					MemberVO member=new MemberVO();
					String access_token=(String)map.get("access_token");
					member = loginAPI.getUserInfo(access_token);
					if(member.getResponseCode()!=null && member.getResponseCode()!=200) {
						response.sendRedirect(request.getContextPath()+"/main/main.do");
						return false;
					}
					try {
						
						if (member!=null) {
							String id=member.getId();
							MemberVO existingMember=memberService.getMember(id);
							if(existingMember !=null && existingMember.getMem_auth()!=3) {
			            		session.setAttribute("mem_auth", existingMember.getMem_auth());
			            		List<ClubVO> myClubs=clubService.selectMyClubs(id);
			                	session.setAttribute("user_id", id);
			                    session.setAttribute("myClubs", myClubs);
			                    session.setAttribute("access_token", access_token );
			                    
			                    if ((String)map.get("expires_in")!=null) {
			                    	int expires_in=Integer.parseInt((String)map.get("expires_in"));
			                    	if(expires_in<(60*60*24*30)) {
				                    	logger.info("refresh_token refreshed");
				                    	Cookie refreshCookie=new Cookie("GpFHzB",refresh_token);
				                    	refreshCookie.setPath("/");
				                    	refreshCookie.setMaxAge(60*60*24*60);
				            			response.addCookie(refreshCookie);
				                    }
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
						response.sendRedirect(request.getContextPath()+"/main/main.do");
						return false;
					}
					
					return true;
					
				}
				
			}
			
			response.sendRedirect(request.getContextPath()+"/main/main.do");
			return false;
		}
		
		return true;
	}
}






