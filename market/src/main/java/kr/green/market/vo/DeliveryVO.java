package kr.green.market.vo;

import java.util.Date;

public class DeliveryVO {

	private Integer no;
	private Integer buy_no;
	private String start;
	private String end;
	private String company;
	private String deliverer;
	private String phone;
	private Date startTime;
	private Date endTime;
	private String valid;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(Integer buy_no) {
		this.buy_no = buy_no;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDeliverer() {
		return deliverer;
	}
	public void setDeliverer(String deliverer) {
		this.deliverer = deliverer;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "DeliveryVO [no=" + no + ", buy_no=" + buy_no + ", start=" + start + ", end=" + end + ", company="
				+ company + ", deliverer=" + deliverer + ", phone=" + phone + ", startTime=" + startTime + ", endTime="
				+ endTime + ", valid=" + valid + "]";
	}
	
}
