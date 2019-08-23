package kr.green.market.vo;

public class FileVO {

	private Integer no;
	private Integer item_no;
	private String route;
	private String valid;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBoard_no() {
		return item_no;
	}
	public void setBoard_no(Integer board_no) {
		this.item_no = board_no;
	}
	public String getRoute() {
		return route;
	}
	public void setRoute(String route) {
		this.route = route;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", item_no=" + item_no + ", route=" + route + ", valid=" + valid + "]";
	}
	
}
