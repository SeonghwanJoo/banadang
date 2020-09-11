package kr.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PostInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,
            HttpServletResponse response,
          Object handler)throws Exception {
		
		try {
			response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT"); 
			response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
			response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
			response.setHeader("Pragma", "no-cache");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
		
	}
}
