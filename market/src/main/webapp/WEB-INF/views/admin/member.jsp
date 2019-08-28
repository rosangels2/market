<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 	<!-- c태그를 이용하기 위한 링크 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 	<!-- UTF-8 인코딩 -->
<html>
<head>
<style type="text/css">
.menu-contents{
	padding: 20px 0 20px 70px;
}
.menu-contents div{
	border: 1px solid gray;
	margin-right: 30px;
}
.table-title{
	text-align: center; 
}
.table-contents th{
	text-align: center;
}
.bottom-box{
	min-height: 100px;
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
	<div class="contents">
		<div class="contents-box">
			<!-- 메뉴 -->
			<div class="menu-box">
				<div class="menu-contents clearfix">
					<div class="all-member float-left">
						<h3>전체 회원 관리</h3>
					</div>
					<div class="seller-request float-left">
						<h3>판매자 신청 보기</h3>
					</div>
				</div>
			</div>
			<!-- 게시판 -->
			<div class="board-box">
				<div class="board-contents">
					<!-- 전체 회원 보기 -->
					<div class="member-board">
						<table class="table">
							<tr class="table-title">
								<th width="20%">ID</th>
								<th width="20%">name</th>
								<th width="30%">email</th>
								<th width="10%">등급</th>
								<th width="15%" class="th-last">등급 관리</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>배송자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
									<select>
										<option>등급 변경</option>
										<option>회원</option>
										<option>판매자</option>
										<option>탈퇴</option>
									</select>
								</th>
							</tr>
						</table>		
					</div>		
					<!-- 판매자 신청 보기 -->
					<div class="seller-request-board display-none">
						<table class="table">
							<tr class="table-title">
								<th width="20%">ID</th>
								<th width="20%">name</th>
								<th width="30%">email</th>
								<th width="10%">등급</th>
								<th width="15%" class="th-last">신청글</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
							<tr class="table-contents">
								<th>52543</th>
								<th>공지사항 게시글</th>
								<th>yyyy-mm-dd</th>
								<th>회원</th>
								<th>
								 	<a>신청글 보기</a>
								</th>
							</tr>
						</table>		
					</div>							
				</div>
			</div>
			<!-- 하단 -->
			<div class="bottom-box">
				<div class="bottom-contents">
				
				</div>
			</div>
		</div>
	</div>
</div>
</html>