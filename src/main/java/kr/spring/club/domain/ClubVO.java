package kr.spring.club.domain;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class ClubVO {
	
	private String club_num;
	private String id;
	private String club_loc;
	private String club_name;
	private String club_detail;
	private MultipartFile upload;
	private byte[] club_img;
	private String club_color;
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
	public byte[] getClub_img() {
		return club_img;
	}
	public void setClub_img(byte[] club_img) {
		this.club_img = club_img;
	}
	public String getClub_color() {
		return club_color;
	}
	public void setClub_color(String club_color) {
		this.club_color = club_color;
	}
	@Override
	public String toString() {
		return "ClubVO [club_num=" + club_num + ", id=" + id + ", club_loc=" + club_loc + ", club_name=" + club_name
				+ ", club_detail=" + club_detail + ", upload=" + upload + ", club_img=" + Arrays.toString(club_img)
				+ ", club_color=" + club_color + "]";
	}
	
	
}
	
	