package kr.spring.club.domain;

import org.springframework.web.multipart.MultipartFile;

public class ClubVO {
	
	private String club_num;
	private String id;
	private String club_loc;
	private String club_name;
	private String club_detail;
	private MultipartFile upload;
	private byte[] image;
	public String getClub_num() {
		return club_num;
	}
	public void setClub_num(String club_num) {
		this.club_num = club_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClub_loc() {
		return club_loc;
	}
	public void setClub_loc(String club_loc) {
		this.club_loc = club_loc;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_detail() {
		return club_detail;
	}
	public void setClub_detail(String club_detail) {
		this.club_detail = club_detail;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
}
