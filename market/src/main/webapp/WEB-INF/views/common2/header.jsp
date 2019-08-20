<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
	<div class="container">
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
	  	<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    	<ul class="navbar-nav">
	    		<li class="nav-item">
	    			<a class="navbar-brand" href="<%=request.getContextPath()%>/">메인 페이지</a>
	    		</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/board/list">공지사항</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/items/list">상품 리스트</a>
		      	</li>
		      	<c:if test="${user.grade eq 'seller'}">
			      	<li class="nav-item">
			        	<a class="nav-link" href="<%=request.getContextPath()%>/items/register">상품 등록</a>
			      	</li>
			      	<li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/items/administration">상품 관리</a>
		      	</li>      	
		      	</c:if>      	
		      	<c:if test="${user.grade eq 'admin'}">
			      	<li class="nav-item">
			        	<a class="nav-link" href="<%=request.getContextPath()%>/admin/board">게시판 관리</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="<%=request.getContextPath()%>/admin/member">회원 관리</a>
			      	</li>      	
		      	</c:if>        			      	
	    	</ul>
		</div> 
		<c:if test="${user eq null}">
			<a href="<%=request.getContextPath()%>/signin" class="float-right" style="color : white; margin-right: 20px;">Signin</a>				
			<a href="<%=request.getContextPath()%>/signup" class="float-right" style="color : white;">Signup</a>
		</c:if>
		<c:if test="${user ne null}">
			<div class="nav-item" style="color: white; margin-right: 20px;">로그인 중 : ${user.id}</div>  		
			<a href="<%=request.getContextPath()%>/myMenu" class="float-right" style="color : white; margin-right: 20px;">My Menu</a>		
			<a href="<%=request.getContextPath()%>/signout" class="float-right" style="color : silver;">로그아웃</a>
		</c:if>
	</div> 
</nav>