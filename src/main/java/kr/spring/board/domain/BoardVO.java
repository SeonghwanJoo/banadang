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
	private Date answer_reg_date;
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
	public Date getAnswer_reg_date() {
		return answer_reg_date;
	}
	public void setAnswer_reg_date(Date answer_reg_date) {
		this.answer_reg_date = answer_reg_date;
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
