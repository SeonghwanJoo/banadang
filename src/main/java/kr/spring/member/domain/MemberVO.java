package kr.spring.member.domain;

public class MemberVO {
	
	private String nickname;
	private String profile_image;
	private String thumbnail_image;
	private String email;
	private String age_range;
	private String id;
	private Integer club_num;
	private Integer club_auth;
	private Float attendance_rate;
	public Float getAttendance_rate() {
		return attendance_rate;
	}
	public void setAttendance_rate(Float attendance_rate) {
		this.attendance_rate = attendance_rate;
	}
	public Integer getClub_auth() {
		return club_auth;
	}
	public void setClub_auth(Integer club_auth) {
		this.club_auth = club_auth;
	}
	public Integer getClub_num() {
		return club_num;
	}
	public void setClub_num(Integer club_num) {
		this.club_num = club_num;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	private Integer status=0;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge_range() {
		return age_range;
	}
	public void setAge_range(String age_range) {
		this.age_range = age_range;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "MemberVO [nickname=" + nickname + ", profile_image=" + profile_image + ", thumbnail_image="
				+ thumbnail_image + ", email=" + email + ", age_range=" + age_range + ", id=" + id + ", club_num="
				+ club_num + ", status=" + status + "]";
	}
	
	
}
