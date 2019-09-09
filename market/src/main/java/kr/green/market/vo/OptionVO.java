package kr.green.market.vo;

public class OptionVO {

	private Integer no;
	private Integer item_no;
	private String item_title;
	private String select;
	private String detail;
	private Integer stock;
	private Integer price;
	private String valid;
	
	
	public OptionVO(){
		no = 0;
		item_no = 0;
		item_title = "";
		select = "";
		detail = "";
		price = 0;
		stock = 0;
		valid = "I";
	}
	public OptionVO(OptionVO oVo){
		this.no = oVo.getNo();
		this.item_no = oVo.getItem_no();
		this.item_title = oVo.getItem_title();
		this.select = oVo.getSelect();
		this.detail = oVo.getDetail();
		this.stock = oVo.getStock();
		this.price = oVo.getPrice();
		this.valid = oVo.getValid();
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getItem_no() {
		return item_no;
	}
	public void setItem_no(Integer item_no) {
		this.item_no = item_no;
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
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "OptionVO [no=" + no + ", item_no=" + item_no + ", item_title=" + item_title + ", select=" + select
				+ ", detail=" + detail + ", stock=" + stock + ", price=" + price + ", valid=" + valid + "]";
	}
	
}
