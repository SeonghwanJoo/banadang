package kr.spring.match.domain;

import java.sql.Date;
import java.util.Arrays;
import java.util.Collections;

public class MatchVO {
	public void setMax() {
		Integer arr[]= {attend,not_attend,undefined};
		Arrays.sort(arr,Collections.reverseOrder());
		this.max = arr[0];
	}

	public int getAttend() {
		return attend;
	}
	public void setAttend(int attend) {
		this.attend = attend;
	}
	public int getNot_attend() {
		return not_attend;
	}
	public void setNot_attend(int not_attend) {
		this.not_attend = not_attend;
	}
	public int getUndefined() {
		return undefined;
	}
	public void setUndefined(int undefined) {
		this.undefined = undefined;
	}
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
	public String getHome_name() {
		return home_name;
	}
	public void setHome_name(String home_name) {
		this.home_name = home_name;
	}
	public double getHome_manner() {
		return home_manner;
	}
	public void setHome_manner(double home_manner) {
		this.home_manner = home_manner;
	}
	public double getHome_perform() {
		return home_perform;
	}
	public void setHome_perform(double home_perform) {
		this.home_perform = home_perform;
	}
	public String getAway_name() {
		return away_name;
	}
	public void setAway_name(String away_name) {
		this.away_name = away_name;
	}
	public double getAway_manner() {
		return away_manner;
	}
	public void setAway_manner(double away_manner) {
		this.away_manner = away_manner;
	}
	public double getAway_perform() {
		return away_perform;
	}
	public void setAway_perform(double away_perform) {
		this.away_perform = away_perform;
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
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public int getMax() {
		return max;
	}
	public String getRating_detail() {
		return rating_detail;
	}

	public void setRating_detail(String rating_detail) {
		this.rating_detail = rating_detail;
	}
	public int getClubrating_num() {
		return clubrating_num;
	}

	public void setClubrating_num(int clubrating_num) {
		this.clubrating_num = clubrating_num;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}
	public double getAddress_x() {
		return address_x;
	}

	public void setAddress_x(double address_x) {
		this.address_x = address_x;
	}

	public double getAddress_y() {
		return address_y;
	}

	public void setAddress_y(double address_y) {
		this.address_y = address_y;
	}
	private String cost;
	private int attend;
	private int not_attend;
	private int undefined;
	private int match_num;
	private String id;
	private int type;
	private String home;
	private String away;
	private String address;
	private double address_x;
	private double address_y;
	private Date match_date;
	private String start_time;
	private String end_time;
	private String match_detail;
	private String rating_detail;
	private String vote_num;
	private String club_num;
	private int status;
	private int count;
	private int max;
	private String home_name;
	private double home_manner;
	private double home_perform;
	private String away_name;
	private double away_manner;
	private double away_perform;
	private double perform;
	private double manner;
	private String club_name;
	private int clubrating_num;
	
	@Override
	public String toString() {
		return "MatchVO [cost=" + cost + ", attend=" + attend + ", not_attend=" + not_attend + ", undefined="
				+ undefined + ", match_num=" + match_num + ", id=" + id + ", type=" + type + ", home=" + home
				+ ", away=" + away + ", address=" + address + ", match_date=" + match_date + ", start_time="
				+ start_time + ", end_time=" + end_time + ", match_detail=" + match_detail + ", rating_detail="
				+ rating_detail + ", vote_num=" + vote_num + ", club_num=" + club_num + ", status=" + status
				+ ", count=" + count + ", max=" + max + ", home_name=" + home_name + ", home_manner=" + home_manner
				+ ", home_perform=" + home_perform + ", away_name=" + away_name + ", away_manner=" + away_manner
				+ ", away_perform=" + away_perform + ", perform=" + perform + ", manner=" + manner + ", club_name="
				+ club_name + ", clubrating_num=" + clubrating_num + "]";
	}
	

	


}
