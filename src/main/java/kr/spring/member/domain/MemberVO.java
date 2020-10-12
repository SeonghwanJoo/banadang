package kr.spring.member.domain;

import java.sql.Date;

public class MemberVO {
	
	private String nickname;
	private String profile_image;
	private String thumbnail_image;
	private String email;
	private String age_range;
	private String id;
	private Integer club_num;
	private Integer match_num;
	private Integer recruit_req_num;
	private String recruit_req_detail;
	private String recruit_position;
	private Integer recruit_accept;
	private Date match_date;
	private String start_time;
	private String end_time;
	private String address;
	private Integer club_auth;
	private Float attendance_rate;
	public Integer getMatch_num() {
		return match_num;
	}
	public void setMatch_num(Integer match_num) {
		this.match_num = match_num;
	}
	public Integer getRecruit_req_num() {
		return recruit_req_num;
	}
	public void setRecruit_req_num(Integer recruit_req_num) {
		this.recruit_req_num = recruit_req_num;
	}
	public String getRecruit_req_detail() {
		return recruit_req_detail;
	}
	public void setRecruit_req_detail(String recruit_req_detail) {
		this.recruit_req_detail = recruit_req_detail;
	}
	public String getRecruit_position() {
		return recruit_position;
	}
	public void setRecruit_position(String recruit_position) {
		this.recruit_position = recruit_position;
	}
	public Integer getRecruit_accept() {
		return recruit_accept;
	}
	public void setRecruit_accept(Integer recruit_accept) {
		this.recruit_accept = recruit_accept;
	}
	public Date getMatch_date() {
		return match_date;
	}
	public void setMatch_date(Date match_date) {
		this.match_date = match_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
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
