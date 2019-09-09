package kr.green.market.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DeliveryVO {

	private Integer no;
	private Integer buy_no;
	private String seller_name;
	private String contents;
	private String request;
	private String start;
	private String end;
	private String company;
	private String deliverer;
	private String phone;
	private Date startTime;
	private Date endTime;
	private String valid;
	
	
	public String getSeller_name() {
		return seller_name;
	}
	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
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
	public String getStartTime() {
		if(startTime == null) {
			return "";
		}
		SimpleDateFormat f = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");	//원하는 형식으로 시간을 보여주게 만드는 클래스
		return f.format(startTime);	//변수 registered를 위의 형식으로 변환하여 반환
	}
	public void setStartTime(String startTime) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		try {
			this.startTime = transFormat.parse(startTime);
		}catch(ParseException e) {
			e.printStackTrace();
		}
	}
	public String getEndTime() {
		if(endTime == null) {
			return "";
		}
		SimpleDateFormat f = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");	//원하는 형식으로 시간을 보여주게 만드는 클래스
		return f.format(endTime);	//변수 registered를 위의 형식으로 변환하여 반환
	}
	public void setEndTime(String endTime) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		try {
			this.endTime = transFormat.parse(endTime);
		}catch(ParseException e) {
			e.printStackTrace();
		}
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "DeliveryVO [no=" + no + ", buy_no=" + buy_no + ", seller_name=" + seller_name + ", contents=" + contents
				+ ", request=" + request + ", start=" + start + ", end=" + end + ", company=" + company + ", deliverer="
				+ deliverer + ", phone=" + phone + ", startTime=" + startTime + ", endTime=" + endTime + ", valid="
				+ valid + "]";
	}

}
