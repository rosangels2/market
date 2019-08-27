package kr.green.market.vo;

import java.util.Date;

public class BuyVO {

	private Integer no;
	private String id;
	private Integer item_no;
	private Integer option_no;
	private String select;
	private String detail;
	private Integer count;
	private Integer price;
	private String request;
	private Date time;
	private String state;
	private String valid;
	
	
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getItem_no() {
		return item_no;
	}
	public void setItem_no(Integer item_no) {
		this.item_no = item_no;
	}
	public Integer getOption_no() {
		return option_no;
	}
	public void setOption_no(Integer option_no) {
		this.option_no = option_no;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "BuyVO [no=" + no + ", id=" + id + ", item_no=" + item_no + ", option_no=" + option_no + ", select="
				+ select + ", detail=" + detail + ", count=" + count + ", price=" + price + ", request=" + request
				+ ", time=" + time + ", state=" + state + ", valid=" + valid + "]";
	}

}
