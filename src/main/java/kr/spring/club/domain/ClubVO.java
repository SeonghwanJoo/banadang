package kr.spring.club.domain;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class ClubVO {
	
	private Integer match_num;
	private String request_detail;
	private String match_detail;
	private Integer request_num;
	private Integer acceptance;
	private String[] club_ages;
	private String club_address;
	private Integer club_num;
	private String id;
	private String club_loc;
	private int club_auth;
	private String club_name;
	private String club_detail;
	private MultipartFile upload;
	private byte[] club_img;
	private String filename;
	private String club_color;
	private String club_age="";
	private double club_locX;
	private double club_locY;
	private double perform;
	private double manner;
	private int rating_count;
	private Date match_date;
	private String start_time;
	private String end_time;
	private String address;
	public String getRequest_detail() {
		return request_detail;
	}
	public void setRequest_detail(String request_detail) {
		this.request_detail = request_detail;
	}
	public String getMatch_detail() {
		return match_detail;
	}
	public void setMatch_detail(String match_detail) {
		this.match_detail = match_detail;
	}
	public Integer getMatch_num() {
		return match_num;
	}
	public void setMatch_num(Integer match_num) {
		this.match_num = match_num;
	}
	public Integer getAcceptance() {
		return acceptance;
	}
	public void setAcceptance(Integer acceptance) {
		this.acceptance = acceptance;
	}
	public Integer getRequest_num() {
		return request_num;
	}
	public void setRequest_num(Integer request_num) {
		this.request_num = request_num;
	}
	public String[] getClub_ages() {
		return club_ages;
	}
	public void setClub_ages(String[] club_ages) {
		this.club_ages = club_ages;
		setClub_age(Arrays.toString(club_ages));
	}
	public String getClub_address() {
		return club_address;
	}
	public void setClub_address(String club_address) {
		this.club_address = club_address;
	}
	public int getClub_auth() {
		return club_auth;
	}
	public void setClub_auth(int club_auth) {
		this.club_auth = club_auth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	private int type;
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
	
	public Date getMatch_date() {
		return match_date;
	}
	public void setMatch_date(Date match_date) {
		this.match_date = match_date;
	}
	public double getPerform() {
		return perform;
	}
	public void setPerform(double perform) {
		this.perform = perform;
	}
	public double getManner() {
		return manner;
	}
	public void setManner(double manner) {
		this.manner = manner;
	}
	public int getRating_count() {
		return rating_count;
	}
	public void setRating_count(int rating_count) {
		this.rating_count = rating_count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getClub_age() {
		return club_age;
	}
	public void setClub_age(String club_age) {
		this.club_age = club_age;
	}
	public double getClub_locX() {
		return club_locX;
	}
	public void setClub_locX(double club_locX) {
		this.club_locX = club_locX;
	}
	public double getClub_locY() {
		return club_locY;
	}
	public void setClub_locY(double club_locY) {
		this.club_locY = club_locY;
	}
	public Integer getClub_num() {
		return club_num;
	}
	public void setClub_num(Integer club_num) {
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
	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		
		if(filename.contains(".")) {
			//byte[]로 변환
			setClub_img(upload.getBytes());
		}else {
			setClub_img(new byte[0]);
		}
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
		return "ClubVO [club_ages=" + Arrays.toString(club_ages) + ", club_address=" + club_address + ", club_num="
				+ club_num + ", id=" + id + ", club_loc=" + club_loc + ", club_auth=" + club_auth + ", club_name="
				+ club_name + ", club_detail=" + club_detail + ", upload=" + upload + ", club_img="
				+ Arrays.toString(club_img) + ", filename=" + filename + ", club_color=" + club_color + ", club_age="
				+ club_age + ", club_locX=" + club_locX + ", club_locY=" + club_locY + ", perform=" + perform
				+ ", manner=" + manner + ", rating_count=" + rating_count + ", match_date=" + match_date
				+ ", start_time=" + start_time + ", end_time=" + end_time + ", address=" + address + ", type=" + type
				+ "]";
	}
	
	


	
}
	
	