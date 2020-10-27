package kr.spring.board.domain;

import java.sql.Date;

public class BoardVO {
	private Integer notice_num;
	private Integer qna_num;
	private String id;
	private String title;
	private String content;
	private Date register_date;
	private Integer fromUser;
	private String answer;
	private String answer_num;
	private String nickname;
	private Integer match_num;
	private Integer club_num;
	private Integer voteAnswer_num;
	public Integer getVoteAnswer_num() {
		return voteAnswer_num;
	}
	public void setVoteAnswer_num(Integer voteAnswer_num) {
		this.voteAnswer_num = voteAnswer_num;
	}
	private boolean isMain;
	
	public boolean getIsMain() {
		return isMain;
	}
	public void setIsMain(boolean isMain) {
		this.isMain = isMain;
	}
	public Integer getMatch_num() {
		return match_num;
	}
	public void setMatch_num(Integer match_num) {
		this.match_num = match_num;
	}
	public Integer getClub_num() {
		return club_num;
	}
	public void setClub_num(Integer club_num) {
		this.club_num = club_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAnswer_num() {
		return answer_num;
	}
	public void setAnswer_num(String answer_num) {
		this.answer_num = answer_num;
	}
	public Integer getFromUser() {
		return fromUser;
	}
	public void setFromUser(Integer fromUser) {
		this.fromUser = fromUser;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(Integer notice_num) {
		this.notice_num = notice_num;
	}
	public Integer getQna_num() {
		return qna_num;
	}
	public void setQna_num(Integer qna_num) {
		this.qna_num = qna_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
}
