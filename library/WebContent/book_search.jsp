<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.bookDTO"%>
<%
	List<bookDTO> bookList = (List) request.getAttribute("bookList");
	
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	int checkVol = ((Integer) request.getAttribute("checkVol")).intValue();
	
	String sessionId = (String) session.getAttribute("sessionId");
	String items = (String) request.getAttribute("items");
	String text = (String) request.getAttribute("text");
	String locations = (String) request.getAttribute("locations");
	String listNum = Integer.toString((int)request.getAttribute("limit"));
	String dataSort = (String) request.getAttribute("dataSort");
	
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
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript">
function CheckForm() {	
	if (${sessionId==null}) {
		alert("로그인 해주세요.");
		return false;
	}
	
	document.books.submit();
	
}
function CheckVol()
{
	if(<%=checkVol%>==0){
		alert("수량이 없는 도서는 예약할 수 없습니다.");
		return false;
	}	
	if(<%=checkVol%>==2){
		alert("도서 예약했습니다");
		return false;
	}	
}
function changeList()
{
	var dataSort = document.getElementById("dataSort").value;
	var listNum = document.getElementById("listNum").value;
		
	location.href="./bookSearchAction.book?text=<%=text%>&items=<%=items%>&locations=<%=locations%>&dataSort="+dataSort+"&listNum="+listNum;
}
</script>
</head>
<body>

<script>CheckVol();</script>	

	<jsp:include page="menu.jsp" />


	<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold"></h1>
					<div class="custom-breadcrumbs">
						<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>도서대출</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="site-section">
		<div class="container" style="min-width: 1200px">
			<div class="row mb-5 justify-content-center">
				<div class="col-md-7 text-center">
					<h2 class="section-title mb-2">도서리스트</h2>
				</div>
			</div>
			<div>
			<div class="text-center text-md-left mb-4 mb-md-2" style="display:inline-block">
				<form name="choice" method="post">
					
						<select name="listNum" id="listNum" onchange="changeList()">
							<option value="<%=listNum%>">출력 지정</option>
							<option value="5">출력 5건</option>
							<option value="10">출력 10건</option>
							<option value="15">출력 15건</option>
						</select>
						<select name="dataSort" id="dataSort" onchange="changeList()">
							<option value="<%=dataSort%>">차순 변경</option>
							<option value="b_registday desc">등록일 내림차순</option>
							<option value="b_registday asc">등록일 오름차순</option>
							<option value="b_name desc">제목 내림차순</option>
							<option value="b_name asc">제목 오름차순</option>
							<option value="b_author desc">저자 내림차순</option>
							<option value="b_author asc">저자 오름차순</option>
							<option value="b_publisher desc">출판사 내림차순</option>
							<option value="b_publisher asc">출판사 오름차순</option>
						</select>
				
				</form>
			</div>
			<div class="text-center text-md-right mb-4 mb-md-2" style="display:inline-block; width:920px">	
				<span>서적 <%=total_record%>권</span>
			</div>
			</div>
			<form method="post" class="mb-4" name="books" action="./AddBookCart.book?pageNum=<%=pageNum%>&text=<%=text%>&items=<%=items%>&locations=<%=locations%>&dataSort=<%=dataSort%>&listNum=<%=listNum%>">
				<div class="job-listings mb-3">
					<div class="job-listing d-block d-sm-flex pb-sm-0 custom-width w-100 justify-content-between" style="background-color: #cccccc57; text-align: center">
						<div style="width: 150px">
							<h5 style="margin: 0.75rem 0.75rem">
								<strong>표지 이미지</strong>
							</h5>
						</div>
						<div class="job-listing-location custom-width mb-3 mb-sm-0" style="min-width: 500px">
							<h5 style="margin: 0.75rem 0.75rem">
								<strong>제목</strong>
							</h5>
						</div>
						<div class="job-listing-location mb-3 mb-sm-0 custom-width" style="min-width: 156px">
							<h5 style="margin: 0.75rem 0.75rem">
								<strong>출판사</strong>
							</h5>
						</div>
						<div class="job-listing-location mb-3 mb-sm-0 custom-width" style="min-width: 145px">
							<h5 style="margin: 0.75rem 0.75rem">
								<strong>도서관 위치</strong>
							</h5>
						</div>
						<div class="job-listing-meta" style="min-width: 155px">
							<h5 style="margin: 0.75rem 0.75rem">
								<strong>대출가능권수</strong>
							</h5>
						</div>
						<div class="job-listing-meta" style="min-width: 60px"></div>
					</div>
					<%
						for (int i = 0; i < bookList.size(); i++) {
						bookDTO list = (bookDTO) bookList.get(i);
					%>

					<div>
						<div class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center" style="display: inline-flex !important; height: 180px; min-width: 1105px; border: 1px solid #ccc; border: none;">
							
							<a href="BookViewAction.book?serial=<%=list.getSerial()%>&pageNum=<%=pageNum%>&text=<%=text%>&items=<%=items%>&locations=<%=locations%>&dataSort=<%=dataSort%>&listNum=<%=listNum%>"></a>

							<div class="job-listing-logo">
								<img src="images/<%=list.getImage()%>" alt="이미지 없음" style="width: 120px; height: 150px; padding: 2px; position: relative; left: 15px">
							</div>
							<div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
								<div class="job-listing-position custom-width w-50 mb-3 mb-sm-0" style="min-width: 460px;max-width:460px">
									<h2><%=list.getName()%></h2>
									<strong><%=list.getAuthor()%></strong>
								</div>
								<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25" style="text-align: center; min-width: 114px; margin-left: 17px">
									<%=list.getPublisher()%>
								</div>
								<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25" style="text-align: center; min-width: 145px; margin-right: 51px">
									<%=list.getLocation()%>
								</div>
								<div class="job-listing-meta" style="margin-right: 28px">
									<span class="badge badge-danger" style="font-size: 100%"><%=list.getVol()%>권</span>
								</div>

							</div>
						</div>
						<div class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center" style="display: inline-flex !important; height: 180px; border: 1px solid #ccc; border: none; min-width: 57px">
							<div class="job-listing-meta" style="margin-left: 18px">
								<input type="checkbox" name="CheckBook<%=i%>" value="<%=list.getSerial()%>" style="width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer;">
							</div>
						</div>
					</div>
					<hr style="margin-top: 0; margin-bottom: 0">
					<%
						}
					%>


				</div>
				<div class="row pagination-wrap">
					<div class="col-md-12 text-center text-md-right">
						<input type="button" value="도서예약" class="btn btn-primary" onclick="CheckForm(); return false;">
					</div>
				</div>
			</form>

			<div class="row pagination-wrap">
				<div class="col-md-6 text-center text-md-left mb-4 mb-md-0">
					<span><strong><%=pageNum%></strong> 페이지/ 총 <strong><%=total_page%></strong> 페이지</span>
				</div>
				<div class="col-md-6 text-center text-md-right">
					<div class="custom-pagination ml-auto">
						<c:set var="pageNum" value="<%=pageNum%>" />
						<c:set var="text" value="<%=text%>" />
						<c:set var="items" value="<%=items%>" />
						<c:set var="locations" value="<%=locations%>" />
						<c:set var="dataSort" value="<%=dataSort%>" />
						<c:set var="listNum" value="<%=listNum%>" />
						
						<div class="d-inline-block">
							<c:forEach var="i" begin="1" end="<%=total_page%>">
								<c:choose>
									<c:when test="${pageNum==i}">
										<a class="active" href="<c:url value="./bookSearchAction.book?pageNum=${i}&text=${text}&items=${items}&locations=${locations}&dataSort=${dataSort}&listNum=${listNum}" /> ">${i}</a>
									</c:when>
									<c:otherwise>
										<a href="<c:url value="./bookSearchAction.book?pageNum=${i}&text=${text}&items=${items}&locations=${locations}&dataSort=${dataSort}&listNum=${listNum}" /> ">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
		
						</div>
				
					</div>
				</div>
			</div>

		</div>
	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>