package kr.green.market.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommendVO {

	private Integer no;
	private Integer item_no;
	private String id;
	private String valid;
	
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "CommendVO [no=" + no + ", item_no=" + item_no + ", id=" + id + ", valid=" + valid + "]";
	}
	
}
