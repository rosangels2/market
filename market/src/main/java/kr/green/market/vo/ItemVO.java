package kr.green.market.vo;

public class ItemVO {

	private Integer no;
	private Integer seller_no;
	private Integer category_no;
	private String name;
	private String information;
	private Integer commend;
	private String valid;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getSeller_no() {
		return seller_no;
	}
	public void setSeller_no(Integer seller_no) {
		this.seller_no = seller_no;
	}
	public Integer getCategory_no() {
		return category_no;
	}
	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public Integer getCommend() {
		return commend;
	}
	public void setCommend(Integer commend) {
		this.commend = commend;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "ItemVO [no=" + no + ", seller_no=" + seller_no + ", category_no=" + category_no + ", name=" + name
				+ ", information=" + information + ", commend=" + commend + ", valid=" + valid + "]";
	}
	
}
