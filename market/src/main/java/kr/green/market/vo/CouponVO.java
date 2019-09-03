package kr.green.market.vo;

public class CouponVO {

	private Integer no;
	private String title;
	private Integer discount;
	private String period;
	private String state;
	private String valid;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "CouponVO [no=" + no + ", title=" + title + ", discount=" + discount + ", period=" + period + ", state="
				+ state + ", valid=" + valid + "]";
	}
	
}
