<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.boardDTO"%>
<%@ page import="mvc.model.wishDTO"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	String items = (String) request.getAttribute("items");
	String text = (String) request.getAttribute("text");
	
	List wishList = (List) request.getAttribute("wishlist");
	int total_record2 = ((Integer) request.getAttribute("total_record2")).intValue();
	int pageNum2 = ((Integer) request.getAttribute("pageNum2")).intValue();
	int total_page2 = ((Integer) request.getAttribute("total_page2")).intValue();
	int on = ((Integer) request.getAttribute("on")).intValue();
	

	String active = "show active";
	String active2 = "";
	if(on == 2){
		active = "";
		active2 = "show active";
	}
	else if(on == 1){
		active = "show active";
		active2 = "";
	}
		
%>
<!DOCTYPE html>
<html>
<head>

<title>아이티 도서관</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon" href="ftco-32x32.png">

<link rel="stylesheet" href="css/custom-bs.css">
<link rel="stylesheet" href="css/table_style.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/line-icons/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function check() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}
		location.href="./boardWriteForm.board"
	}
	
	function checkID(Id, num) {
				
		if("<%=sessionId%>" != Id){
			alert("글쓴이만 접속이 가능합니다.");
			return false;
		}
		location.href="./wishBoardViewAction.board?num="+num+"&pageNum=<%=pageNum2%>";
	}
</script>
</head>
<body>

	<div class="site-wrap">

		<!-- NAVBAR -->
		<jsp:include page="menu.jsp" />


		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<h1 class="text-white font-weight-bold"></h1>
						<div class="custom-breadcrumbs">
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>게시판</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="tabs" class="project-tab site-section">
			<div class="container">
				<form action="<c:url value="./boardListAction.board"/>" method="post">
					<div class="row mb-5 justify-content-center">
						<div class="col-md-7 text-center">
							<h2 class="section-title mb-2">게시판</h2>
						</div>
					</div>

					
					<div class="row">
						<div class="col-md-12">
							<nav>
								<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
									<c:set var="on" value="<%=on%>"></c:set>
									<c:choose>
									<c:when test="${on==2}">
									<a class="nav-item nav-link " id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="false">자유게시판</a> 
									<a class="nav-item nav-link active" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="true">희망도서신청</a>
									</c:when>
									<c:otherwise>
									<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">자유게시판</a> 
									<a class="nav-item nav-link " id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">희망도서신청</a>
									</c:otherwise>
									</c:choose>
								</div>
							</nav>
							
							<div class="tab-content" id="nav-tabContent">
								
								<div class="tab-pane fade <%=active %>" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>닉네임</th>
												<th>조회</th>
												<th>작성일</th>
											</tr>
										</thead>

										<tbody>
											<%
												for (int j = 0; j < boardList.size(); j++) {
												boardDTO notice = (boardDTO) boardList.get(j);
											%>
												
											<tr onclick = "location.href='./boardViewAction.board?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>&items=<%=items%>&text=<%=text%>'" style="cursor:pointer">
												<td><%=notice.getNum()%></td>
												<td><%=notice.getSubject()%></td>
												<td><%=notice.getName()%></td>
												<td><%=notice.getHit()%></td>
												<td><%=notice.getRegist_day()%></td>
											
											</tr>
											
											<%
												}
											%>
										</tbody>
									</table>
									<div class="text-right">
										<span class="badge badge-success">전체 <%=total_record%>건
										</span>
									</div>
									<div align="center">
										<c:set var="pageNum" value="<%=pageNum%>" />
										<c:set var="items" value="<%=items%>" />
										<c:set var="text" value="<%=text%>" />
										<c:forEach var="i" begin="1" end="<%=total_page%>">
											<a href="<c:url value="./boardListAction.board?pageNum=${i}&text=${text}&items=${items}" /> "> <c:choose>
													<c:when test="${pageNum==i}">
														<font color='4C5317'><b> [${i}]</b></font>
													</c:when>
													<c:otherwise>
														<font color='4C5317'> [${i}]</font>
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
									</div>
									<div align="left">
										<table>
											<tr>
												<td width="100%" align="left">
													&nbsp;&nbsp;
													<select name="items" class="txt">
														<option value="subject">제목</option>
														<option value="content">내용</option>
														<option value="name">닉네임</option>
													</select>
													<input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />
												</td>
												<td width="100%" style="min-width:85px" align="right">
													<a href="#" onclick="check(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
												</td>
											</tr>
										</table>
										
									</div>
								</div>

								<div class="tab-pane fade <%=active2 %>" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>
												<th>도서명</th>
												<th>저자</th>
												<th>출판사</th>
												<th>희망도서관</th>
												
											</tr>
										</thead>
										<tbody>
											<%
												for (int j = 0; j < wishList.size(); j++) {
													wishDTO notice = (wishDTO) wishList.get(j);
											%>
											<tr onclick="checkID('<%=notice.getId()%>', '<%=notice.getNum()%>')" style="cursor:pointer">
												<td><%=notice.getNum() %></td>
												<td><%=notice.getName() %></td>
												<td><%=notice.getAuthor() %></td>
												<td><%=notice.getPublisher() %></td>
												<td><%=notice.getLocation() %></td>
												
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
									<div class="text-right">
										<span class="badge badge-success">전체 <%=total_record2%>건
										</span>
									</div>
									<div align="center">
										<c:set var="pageNum2" value="<%=pageNum2%>" />
										<c:forEach var="i" begin="1" end="<%=total_page2%>">
											<a href="<c:url value="./boardListAction.board?pageNum2=${i}" /> "> <c:choose>
													<c:when test="${pageNum2==i}">
														<font color='4C5317'><b> [${i}]</b></font>
													</c:when>
													<c:otherwise>
														<font color='4C5317'> [${i}]</font>
													</c:otherwise>
												</c:choose>
											</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>

				</form>
			</div>
		</section>
		<jsp:include page="footer.jsp" />
	</div>
	<!-- SCRIPTS -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/stickyfill.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/quill.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>