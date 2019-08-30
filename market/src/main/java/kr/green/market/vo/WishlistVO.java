package kr.green.market.vo;

public class WishlistVO {

	private Integer no;
	private String id;
	private Integer item_no;
	private String image;
	private String item_name;
	private Integer item_price;
	private String valid;
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public Integer getItem_price() {
		return item_price;
	}
	public void setItem_price(Integer item_price) {
		this.item_price = item_price;
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
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "WishlistVO [no=" + no + ", id=" + id + ", item_no=" + item_no + ", image=" + image + ", item_name="
				+ item_name + ", item_price=" + item_price + ", valid=" + valid + "]";
	}
	
}
