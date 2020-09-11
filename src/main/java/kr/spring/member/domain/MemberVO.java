package kr.spring.member.domain;

public class MemberVO {
	
	private String nickname;
	private String profile_image;
	private String thumbnail_image;
	private String email;
	private String age_range;
	private String id;
	private String club_num;
	public String getClub_num() {
		return club_num;
	}
	public void setClub_num(String club_num) {
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
