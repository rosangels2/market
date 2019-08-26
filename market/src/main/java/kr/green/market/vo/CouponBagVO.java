package kr.green.market.vo;

public class CouponBagVO {
	
	private Integer no;
	private String id;
	private Integer coupon_no;
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
	public Integer getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(Integer coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "CouponBagVO [no=" + no + ", id=" + id + ", coupon_no=" + coupon_no + ",  valid=" + valid + "]";
	}
	
}
