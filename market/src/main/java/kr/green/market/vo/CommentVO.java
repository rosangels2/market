package kr.green.market.vo;

import java.util.Date;

public class CommentVO {

	private Integer no;
	private Integer board_no;
	private String to;
	private String writer;
	private String contents;
	private Date time;
	private String valid;
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBoard_no() {
		return board_no;
	}
	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
		return "CommentVO [no=" + no + ", board_no=" + board_no + ", to=" + to + ", writer=" + writer + ", contents="
				+ contents + ", time=" + time + ", valid=" + valid + "]";
	}
	
}
