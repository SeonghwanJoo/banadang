package kr.spring.member.domain;

public class ReportVO {
	
	private Integer report_num;
	private Integer source;
	private String reported_id;
	private String reporting_id;
	private Integer write_num;
	private String content;
	private String reg_date;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getReport_num() {
		return report_num;
	}
	public void setReport_num(Integer report_num) {
		this.report_num = report_num;
	}
	public Integer getSource() {
		return source;
	}
	public void setSource(Integer source) {
		this.source = source;
	}
	public String getReported_id() {
		return reported_id;
	}
	public void setReported_id(String reported_id) {
		this.reported_id = reported_id;
	}
	public String getReporting_id() {
		return reporting_id;
	}
	public void setReporting_id(String reporting_id) {
		this.reporting_id = reporting_id;
	}
	public Integer getWrite_num() {
		return write_num;
	}
	public void setWrite_num(Integer write_num) {
		this.write_num = write_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
}
