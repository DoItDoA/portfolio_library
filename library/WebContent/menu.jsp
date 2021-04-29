<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<script type="text/javascript">
function checkForm() {	
	if (${sessionId==null}) {
		alert("로그인 해주세요.");
		location.href="LoginAction.member";
		return false;
	}
	location.href="GetBookList.book";
	
}

function checkId() {	
	if (${sessionId==null}) {
		alert("로그인 해주세요.");
		location.href="LoginAction.member";
		return false;
	}
	location.href="requestBookAction.board";
	
}
</script>

<!-- NAVBAR -->
<header class="site-navbar mt-3">
	<div class="container-fluid">
		<div class="row align-items-center">
			<div class="site-logo col-2">
				<a href="home.jsp">아이티도서관</a>
			</div>

			<nav class=" site-navigation col-7">
				<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
					<li><a href="home.jsp" class="nav-link active">Home</a></li>
					<li><a href="bookSearchAction.book?pageNum=1">도서대출</a></li>
					<li><a href="#" onclick="checkForm()">도서대출조회</a></li>
					<li><a href="BestBookList.book">베스트도서</a></li>
					<li><a href="#" onclick="checkId()">희망도서신청</a></li>
					<li><a href="boardListAction.board">게시판</a></li>
				</ul>
			</nav>

			<div class="right-cta-menu text-right d-flex aligin-items-center col-3">
				<div class="ml-auto">
					<c:choose>
						<c:when test="${empty sessionId}">
							<a href="JoinAction.member" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-person_add"></span>회원 가입
							</a>
							<a href="LoginAction.member" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-lock_outline"></span>로그인
							</a>
						</c:when>
						<c:otherwise>
							<a href="UpdateAction.member" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-person"></span>회원 수정
							</a>
							<a href="LogoutAction.member" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-unlock"></span>로그아웃
							</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</header>