package kr.green.market.vo;

import java.util.Date;

public class BoardVO {
	
	private Integer no;
	private Integer category_no;
	private Integer item_no;
	private String writer;
	private String title;
	private String contents;
	private Date time;
	private String valid;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getCategory_no() {
		return category_no;
	}
	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}
	public Integer getItem_no() {
		return item_no;
	}
	public void setItem_no(Integer item_no) {
		this.item_no = item_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", category_no=" + category_no + ", item_no=" + item_no + ", writer=" + writer
				+ ", title=" + title + ", contents=" + contents + ", time=" + time + ", valid=" + valid + "]";
	}
	
}
