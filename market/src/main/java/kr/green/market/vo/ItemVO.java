package kr.green.market.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ItemVO {

	private Integer no;
	private Integer category_no;
	private String seller_id;
	private String title;
	private String price;
	private String information;
	private String file;
	private Date time;
	private Integer commend;
	private String valid;
	
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public Integer getCategory_no() {
		return category_no;
	}
	public void setCategory_no(Integer category_no) {
		this.category_no = category_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
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
	public String getFileName(){	//파일명 추출 getter
		if(file == null){
			return "";
		}
		int index = file.indexOf("_");	//UUID 뒤에 오는 첫번째 _의 위치를 찾아서 저장
		if(index == -1){	//파일이 없을 때의 예외처리
			return "";
		}
		return file.substring(index+1);	// _ 다음 위치의 문자열을 서브스트링으로 변환하여 반환
	}

	
	@Override
	public String toString() {
		return "ItemVO [no=" + no + ", category_no=" + category_no + ", seller_id=" + seller_id + ", title=" + title
				+ ", price=" + price + ", information=" + information + ", file=" + file + ", time=" + time
				+ ", commend=" + commend + ", valid=" + valid + "]";
	}

}
