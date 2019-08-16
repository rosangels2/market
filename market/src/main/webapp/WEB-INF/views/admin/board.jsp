<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.menu-box{
	min-height: 100px;
	padding: 30px 0;
}
.menu-contents div{
	float: left;
	border: 1px solid gray;
	margin-right: 20px;
}
.table-title{
	text-align: center; 
}
.table-title th{
}
.th-last{
}
.table-contents th{
	text-align: center;
}
.bottom-box{
	min-height: 100px;
}
.search-box{
	margin-bottom: 40px;
}
.search-box div{
	margin-right: 15px;
}
.search-box input{
	width: 300px;
	fint-size: 30px;
}

/* 공통 */
.display-none{
	display: none;
}
</style>
<script type="text/javascript">

</script>
</head>
<div style="min-height: 1000px;">
	<div class="board-box">
		<div class="board-contents">
			<!-- 메뉴 -->
			<div class="menu-box">
				<div class="menu-contents clearfix">
					<div class="notice-board">
						<h4>공지사항 게시판</h4>
					</div>
					<div class="comment-board">
						<h4>댓글 게시판</h4>
					</div>
					<div class="ask-board">
						<h4>문의사항 게시판</h4>
					</div>
				</div>
			</div>
			<!-- 공지사항 게시판 -->
			<div class="notice-board">
				<div class="search-box clearfix">
					<div class="search-img float-right">
						<i class="fas fa-search img" style="font-size: 30px;"></i>
					</div>
					<div class="search-input float-right"><input></div>
					<div class="search-select float-right">
						<select>
							<option>제목</option>
							<option>내용</option>
						</select>
					</div>  
				</div>				
				<table class="table">
					<tr class="table-title">
						<th width="10%">번호</th>
						<th width="40%">제목</th>
						<th width="25%">작성일</th>
						<th width="10%">조회수</th>
						<th width="15%" class="th-last">수정/삭제</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
					<tr class="table-contents">
						<th>52543</th>
						<th>공지사항 게시글</th>
						<th>yyyy-mm-dd</th>
						<th>533</th>
						<th>
							<select>
								<option>수정/삭제</option>
								<option>수정</option>
								<option>삭제</option>
							</select>
						</th>
					</tr>
				</table>
			</div>
			<!-- 댓글 게시판 관리 -->
			<div class="comment-board display-none">
				<div class="comment-contents">
					<div class="search-box clearfix">
					<div class="search-img float-right">
						<i class="fas fa-search img" style="font-size: 30px;"></i>
					</div>
					<div class="search-input float-right"><input></div>
					<div class="search-select float-right">
						<select>
							<option>제목</option>
							<option>내용</option>
						</select>
					</div>  
				</div>
					<table class="table">
						<tr class="table-title">
							<th width="20%">작성자</th>
							<th width="40%">내용</th>
							<th width="25%">등록일</th>
							<th width="20%">댓글 관리</th>	
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
						<tr class="table-contents">
							<th>sdfsadfs</th>
							<th>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</th>
							<th>2019-09-02</th>								
							<th>
								<a>삭제하기</a>
							</th>
						</tr>
					</table>								
				</div>				
				</div>
			</div>
			<!-- 문의글 게시판 관리 -->
			<div class="ask-board display-none">
				<div class="ask-contents">
					<div class="search-box clearfix">
					<div class="search-img float-right">
						<i class="fas fa-search img" style="font-size: 30px;"></i>
					</div>
					<div class="search-input float-right"><input></div>
					<div class="search-select float-right">
						<select>
							<option>제목</option>
							<option>내용</option>
						</select>
					</div>  
				</div>
					<div class="board-box">
						<table class="table">
							<tr>
								<th width="10%">번호</th>		<!-- width를 통해 가로를 지정 -->
								<th width="20%">문의 종류</th>
								<th width="20%">제목</th>
								<th width="20%">작성자</th>
								<th width="10%">등록일</th>
								<th width="10%">답변 상태</th>	
							</tr>
							<tr>
								<th>1</th>	<!-- list의 값이 추가된 변수 board의 getter 호출 -->
								<th>교환</th>
								<th>문의</th>
								<th>roasdlldal</th>
								<th>2019-09-02</th>
								<th>답변 대기</th>
							</tr>
							<tr>
								<th>1</th>	<!-- list의 값이 추가된 변수 board의 getter 호출 -->
								<th>교환</th>
								<th>문의</th>
								<th>roasdlldal</th>
								<th>2019-09-02</th>
								<th>답변 대기</th>
							</tr>
							<tr>
								<th>1</th>	<!-- list의 값이 추가된 변수 board의 getter 호출 -->
								<th>교환</th>
								<th>문의</th>
								<th>roasdlldal</th>
								<th>2019-09-02</th>
								<th>답변 대기</th>
							</tr>
						</table>							
					</div>					
				</div>
			</div>
		</div>	<!-- board-contents 끝 -->
		<!-- 하단  -->
		<div class="bottom">
			<div class="bottom-box">
			
			</div>
		</div>
	</div>
</div>
</html>