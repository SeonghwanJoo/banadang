package kr.spring.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.spring.member.domain.MemberVO;

@Service  
public class LoginAPI {
    
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public Map<String,String> getAccessToken (String authorize_code,int invited,String uri) {
        
		Map<String, String> map = new HashMap<String, String>();
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=0646bcb11e5b9bbdb24fc9153f7693ae");
            if(invited==0) {
            	sb.append("&redirect_uri="+uri+"/member/invitedLogin.do");
            }else if(invited==1) {
            	sb.append("&redirect_uri="+uri+"/member/login.do");
            }else if(invited==2) {
            	sb.append("&redirect_uri="+uri+"/member/voteLogin.do");
            }
            
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            map.put("access_token", element.getAsJsonObject().get("access_token").getAsString());
            map.put("refresh_token", element.getAsJsonObject().get("refresh_token").getAsString());
            
            logger.info("access_token : " + map.get("access_token"));
            logger.info("refresh_token : " + map.get("refresh_token"));
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            map.put("result", "errors");
            return map;
        } 
        
        return map;
    }
    public MemberVO getUserInfo (String access_token) {
        
        MemberVO memberVO = new MemberVO ();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_token);
            
            Integer responseCode = conn.getResponseCode();
            if (responseCode != 200) {
            	memberVO.setResponseCode(responseCode);
            	return memberVO;
            }
            
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            memberVO.setNickname(properties.getAsJsonObject().get("nickname").getAsString()); 
            memberVO.setId(element.getAsJsonObject().get("id").getAsString());
            
            
            String profile_image="";
            String thumbnail_image="";
            
            if (properties.getAsJsonObject().get("profile_image")!=null) {
            	 profile_image=properties.getAsJsonObject().get("profile_image").getAsString();
            	if(profile_image.indexOf("http:")>-1) {
            		profile_image=profile_image.replace("http:", "https:");
            	}
            	memberVO.setProfile_image(profile_image);
            }
            if ( properties.getAsJsonObject().get("thumbnail_image")!=null){
            	thumbnail_image=properties.getAsJsonObject().get("thumbnail_image").getAsString();
            	if(thumbnail_image.indexOf("http:")>-1) {
            		thumbnail_image=thumbnail_image.replace("http:", "https:");
            	}
            	memberVO.setThumbnail_image(thumbnail_image);
            }
            if(kakao_account.getAsJsonObject().get("email")!=null) {
            	memberVO.setEmail(kakao_account.getAsJsonObject().get("email").getAsString());
            }
            if(kakao_account.getAsJsonObject().get("age_range")!=null) {
            	memberVO.setAge_range(kakao_account.getAsJsonObject().get("age_range").getAsString());
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return memberVO;
    }
    public MemberVO getUpdatedUserInfo (String access_token) {
    	
        MemberVO member = new MemberVO ();
        String reqURL = "https://kapi.kakao.com/v1/api/talk/profile";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            String profile_image="";
            String thumbnail_image="";
            
            if (element.getAsJsonObject().get("profileImageURL")!=null) {
            	profile_image=element.getAsJsonObject().get("profileImageURL").getAsString();
            	if(profile_image.indexOf("http:")>-1) {
            		profile_image=profile_image.replaceAll("http:", "https:");
            	}
            	member.setProfile_image(profile_image);
            }
            if ( element.getAsJsonObject().get("thumbnailURL")!=null){
            	thumbnail_image=element.getAsJsonObject().get("thumbnailURL").getAsString();
            	if(thumbnail_image.indexOf("http:")>-1) {
            		thumbnail_image=thumbnail_image.replaceAll("http:", "https:");
            	}
            	member.setThumbnail_image(thumbnail_image);
            }
            member.setNickname(element.getAsJsonObject().get("nickName").getAsString());
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return member;
    }
    public Map<String, Object> refreshTokens (String refresh_token){
    	
    	Map<String, Object> map = new HashMap<String ,Object>();
    	String reqURL = "https://kauth.kakao.com/oauth/token";
    	try {
    		URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=refresh_token");
            sb.append("&client_id=0646bcb11e5b9bbdb24fc9153f7693ae");
            sb.append("&refresh_token=" + refresh_token);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
    		map.put("access_token", element.getAsJsonObject().get("access_token").getAsString());
    		if(element.getAsJsonObject().get("refresh_token")!=null) {
    			map.put("refresh_token", element.getAsJsonObject().get("refresh_token").getAsString());
    		}
    		if(element.getAsJsonObject().get("refresh_token_expires_in")!=null) {
    			map.put("expires_in", element.getAsJsonObject().get("refresh_token_expires_in"));
    		}
    		map.put("result", "success");
    		
    		
    	} catch (Exception e) {
    		map.put("result", "errors");
    		e.printStackTrace();
    	}
    	return map;
    	
    }
    
    public void kakaoLogout(String access_token) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String result = "";
            String line = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void kakaoUnlink(String access_token) {
    	String reqURL = "https://kapi.kakao.com/v1/user/unlink";
    	try {
    		URL url = new URL(reqURL);
    		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    		 conn.setRequestMethod("POST");
             conn.setRequestProperty("Authorization", "Bearer " + access_token);
             
             int responseCode = conn.getResponseCode();
             System.out.println("responseCode : " + responseCode);
             
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             
             String result = "";
             String line = "";
             
             while ((line = br.readLine()) != null) {
                 result += line;
             }
             System.out.println(result);
    		
    	}catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
