package kr.spring.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

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
	
	public String getAccessToken (String authorize_code,int invited,String uri) {
        String access_Token = "";
        String refresh_Token = "";
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
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            logger.info("access_token : " + access_Token);
            logger.info("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return "errors";
        } 
        
        return access_Token;
    }
    public MemberVO getUserInfo (String access_Token) {
        
        MemberVO memberVO = new MemberVO ();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            Integer responseCode = conn.getResponseCode();
            memberVO.setResponseCode(responseCode);
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
            String profile_image=properties.getAsJsonObject().get("profile_image").getAsString();
            String thumbnail_image=properties.getAsJsonObject().get("profile_image").getAsString();
            
            if (profile_image!=null) {
            	
            	if(profile_image.indexOf("http://:")>0) {
            		profile_image.replaceAll("http", "https");
            	}
            	memberVO.setProfile_image(profile_image);
            }
            if ( thumbnail_image!=null){
            	if(thumbnail_image.indexOf("http://:")>0) {
            		thumbnail_image.replaceAll("http://", "https://");
            	}
            	memberVO.setThumbnail_image(thumbnail_image);
            }
            memberVO.setEmail(kakao_account.getAsJsonObject().get("email").getAsString());
            if(kakao_account.getAsJsonObject().get("age_range")!=null) {
            	memberVO.setAge_range(kakao_account.getAsJsonObject().get("age_range").getAsString());
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return memberVO;
    }
    public MemberVO getUpdatedUserInfo (String access_Token) {
    	
        MemberVO member = new MemberVO ();
        String reqURL = "https://kapi.kakao.com/v1/api/talk/profile";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
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
            
            String profile_image=element.getAsJsonObject().get("profile_image").getAsString();
            String thumbnail_image=element.getAsJsonObject().get("profile_image").getAsString();
            
            if (profile_image!=null) {
            	
            	if(profile_image.indexOf("http://:")>0) {
            		profile_image.replaceAll("http", "https");
            	}
            	member.setProfile_image(profile_image);
            }
            if ( thumbnail_image!=null){
            	if(thumbnail_image.indexOf("http://:")>0) {
            		thumbnail_image.replaceAll("http://", "https://");
            	}
            	member.setThumbnail_image(thumbnail_image);
            }
            member.setNickname(element.getAsJsonObject().get("nickName").getAsString());
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return member;
    }
    
    public void kakaoLogout(String access_Token) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
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
    public void kakaoUnlink(String access_Token) {
    	String reqURL = "https://kapi.kakao.com/v1/user/unlink";
    	try {
    		URL url = new URL(reqURL);
    		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    		 conn.setRequestMethod("POST");
             conn.setRequestProperty("Authorization", "Bearer " + access_Token);
             
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
