package kr.green.market.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {
	
	private Integer no;
	private String category;
	private Integer board_no;
	private String writer;
	private String title;
	private String contents;
	private Date time;
	private String state;
	private String valid;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getBoard_no() {
		return board_no;
	}
	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
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
	public String getTime() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");	//원하는 형식으로 시간을 보여주게 만드는 클래스
		return f.format(time);	//변수 registered를 위의 형식으로 변환하여 반환
	}
	public void setTime(String time) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
		try {
			this.time = transFormat.parse(time);
		}catch(ParseException e) {
			e.printStackTrace();
		}
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", category=" + category + ", board_no=" + board_no + ", writer=" + writer
				+ ", title=" + title + ", contents=" + contents + ", time=" + time + ", state=" + state + ", valid="
				+ valid + "]";
	}
}
