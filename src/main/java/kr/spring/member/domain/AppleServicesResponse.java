package kr.spring.member.domain;

public class AppleServicesResponse {
	
	
	private String state;
	private String code;
	private String id_token;
	private String nickname;
	private String email;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getId_token() {
		return id_token;
	}
	public void setId_token(String id_token) {
		this.id_token = id_token;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "AppleServicesResponse [state=" + state + ", code=" + code + ", id_token=" + id_token + ", nickname="
				+ nickname + ", email=" + email + "]";
	}
	
	
}
