package kr.green.market.vo;

import java.util.Date;

public class BuyVO {

	private Integer no;
	private String id;
	private Integer item_no;
	private Integer count;
	private String information;
	private Integer price;
	private Date time;
	private String state;
	private String valid;
	
	
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
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
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
		return "BuyVO [no=" + no + ", id=" + id + ", item_no=" + item_no + ", count=" + count + ", information="
				+ information + ", price=" + price + ", time=" + time + ", state=" + state + ", valid=" + valid + "]";
	}
	
	
}
