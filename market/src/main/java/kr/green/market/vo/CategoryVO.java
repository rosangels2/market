package kr.green.market.vo;

public class CategoryVO {

	private Integer no;
	private String kind;
	private String detail;
	private String valid;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "CategoryVO [no=" + no + ", kind=" + kind + ", detail=" + detail + ", valid=" + valid + "]";
	}
	
}
