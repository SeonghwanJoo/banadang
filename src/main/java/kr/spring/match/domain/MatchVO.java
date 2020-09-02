package kr.spring.match.domain;

import java.sql.Date;

public class MatchVO {
	
	public int getMatch_num() {
		return match_num;
	}
	public void setMatch_num(int match_num) {
		this.match_num = match_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String away) {
		this.away = away;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getMatch_detail() {
		return match_detail;
	}
	public void setMatch_detail(String match_detail) {
		this.match_detail = match_detail;
	}
	public String getVote_num() {
		return vote_num;
	}
	public void setVote_num(String vote_num) {
		this.vote_num = vote_num;
	}
	public String getClub_num() {
		return club_num;
	}
	public void setClub_num(String club_num) {
		this.club_num = club_num;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private int match_num;
	private String id;
	private int type;
	private String home;
	private String away;
	private String address;
	private Date match_date;
	private String start_time;
	private String end_time;
	private String match_detail;
	private String vote_num;
	private String club_num;
	private int status;
	private int count;

	@Override
	public String toString() {
		return "MatchVO [match_num=" + match_num + ", id=" + id + ", type=" + type + ", home=" + home + ", away=" + away
				+ ", address=" + address + ", match_date=" + match_date + ", start_time=" + start_time + ", end_time="
				+ end_time + ", match_detail=" + match_detail + ", vote_num=" + vote_num + ", club_num=" + club_num
				+ ", status=" + status + "]";
	}


	
	
	
}
