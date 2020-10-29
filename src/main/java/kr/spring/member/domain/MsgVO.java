package kr.spring.member.domain;

import java.sql.Date;
import java.util.Arrays;

public class MsgVO {
	private Integer msg_num;
	private String sender;
	private String receiver;
	private Integer status;
	private Integer r_del;
	private Integer s_del;
	private String content;
	private Date register_date;
	private String club_name;
	private Integer match_num;
	private String address;
	private String start_time;
	private String end_time;
	private String nickname;
	private String id;
	private byte[] club_img;
	private Integer club_num;
	private Date match_date;
	private String thumbnail_image;
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public Integer getClub_num() {
		return club_num;
	}
	public void setClub_num(Integer club_num) {
		this.club_num = club_num;
	}
	public Date getMatch_date() {
		return match_date;
	}
	public void setMatch_date(Date match_date) {
		this.match_date = match_date;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public Integer getMatch_num() {
		return match_num;
	}
	public void setMatch_num(Integer match_num) {
		this.match_num = match_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public byte[] getClub_img() {
		return club_img;
	}
	public void setClub_img(byte[] club_img) {
		this.club_img = club_img;
	}
	public String getThumbnail_image() {
		return thumbnail_image;
	}
	public void setThumbnail_image(String thumbnail_image) {
		this.thumbnail_image = thumbnail_image;
	}
	public Integer getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(Integer msg_num) {
		this.msg_num = msg_num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getR_del() {
		return r_del;
	}
	public void setR_del(Integer r_del) {
		this.r_del = r_del;
	}
	public Integer getS_del() {
		return s_del;
	}
	public void setS_del(Integer s_del) {
		this.s_del = s_del;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	@Override
	public String toString() {
		return "MsgVO [msg_num=" + msg_num + ", sender=" + sender + ", receiver=" + receiver + ", status=" + status
				+ ", r_del=" + r_del + ", s_del=" + s_del + ", content=" + content + ", register_date=" + register_date
				+ ", club_name=" + club_name + ", match_num=" + match_num + ", address=" + address + ", start_time="
				+ start_time + ", end_time=" + end_time + ", nickname=" + nickname + ", id=" + id + ", club_img="
				+ Arrays.toString(club_img) + ", club_num=" + club_num + ", match_date=" + match_date
				+ ", thumbnail_image=" + thumbnail_image + "]";
	}
	
}
