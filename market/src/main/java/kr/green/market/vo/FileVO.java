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
	public String getFileName(){	//파일명 추출 getter
		if(route == null){
			return "";
		}
		int index = route.indexOf("_");	//UUID 뒤에 오는 첫번째 _의 위치를 찾아서 저장
		if(index == -1){	//파일이 없을 때의 예외처리
			return "";
		}
		return route.substring(index+1);	// _ 다음 위치의 문자열을 서브스트링으로 변환하여 반환
	}
	
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", item_no=" + item_no + ", route=" + route + ", valid=" + valid + "]";
	}
	
}
