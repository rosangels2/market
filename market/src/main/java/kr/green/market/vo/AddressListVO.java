package kr.green.market.vo;

public class AddressListVO {
	
	private Integer no;
	private String id;
	private String name;
	private String phone;
	private String address;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "AddressListVO [no=" + no + ", id=" + id + ", name=" + name + ", phone=" + phone + ", address=" + address
				+ ", valid=" + valid + "]";
	}
	
}
