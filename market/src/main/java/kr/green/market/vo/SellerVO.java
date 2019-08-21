package kr.green.market.vo;

public class SellerVO {

	private Integer no;
	private String id;
	private String code;
	private String name;
	private String phone;
	private String bank;
	private String account;
	private String place;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "SellerVO [no=" + no + ", id=" + id + ", code=" + code + ", name=" + name + ", phone=" + phone
				+ ", bank=" + bank + ", account=" + account + ", place=" + place + ", valid=" + valid + "]";
	}
	
}
