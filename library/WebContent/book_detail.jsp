<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="mvc.model.bookDTO" %>
<%
	int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
	int checkVol =1; 
	
	if(request.getAttribute("checkVol") != null)
		checkVol= ((Integer)request.getAttribute("checkVol")).intValue();
	
	String sessionId = (String) session.getAttribute("sessionId");
	String serial = (String)request.getAttribute("serial"); 
	String text = (String)request.getAttribute("text");
	String items = (String)request.getAttribute("items");
	String locations = (String)request.getAttribute("locations");
	String dataSort = (String)request.getAttribute("dataSort");
	String listNum = (String)request.getAttribute("listNum");
	
	bookDTO book =(bookDTO)request.getAttribute("BookDetail");
	
%>


<!doctype html>
<html>
<head>
<title>아이티 도서관</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/custom-bs.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/line-icons/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function checkI() {	
	if (${sessionId==null}) {
		alert("로그인 해주세요.");
		return false;
	}
	
	location.href = "AddOneBookCart.book?CheckBook=<%=serial%>&pageNum=<%=pageNum%>&text=<%=text%>&items=<%=items%>&locations=<%=locations%>&dataSort=<%=dataSort%>&listNum=<%=listNum%>";
}
function CheckVol()
{
	if(<%=checkVol%>==0){
		alert("수량이 없는 도서는 예약할 수 없습니다.");
	}	
}
</script>

</head>
<body id="top">
<script>CheckVol();</script>

	<div class="site-wrap">

		<!-- NAVBAR -->
		<jsp:include page="menu.jsp" />

		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="custom-breadcrumbs">
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>도서 상세 내용</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="site-section">
			<div class="container">
				<div class="row align-items-center mb-5">
					<div class="col-lg-8 mb-4 mb-lg-0">
						<div class="d-flex align-items-center"></div>
					</div>

					<div class="col-lg-4">
						<div class="row">
							<div class="col-6">
								<a href="#" onclick="checkI(); return false;" class="btn btn-block btn-primary btn-md">도서 대여 신청</a>
							</div>
							<div class="col-6">
								<a href="./bookSearchAction.book?pageNum=<%=pageNum %>&text=<%=text%>&items=<%=items%>&locations=<%=locations%>&dataSort=<%=dataSort%>&listNum=<%=listNum%>" class="btn btn-block btn-light btn-md">목록</a>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-7">
						<div class="mb-5">
							<figure class="mb-5">
								<img src="images/<%=book.getImage()%>" alt="Image" class="img-fluid rounded" style="width: 600px; height: 800px;">
							</figure>
						</div>
					</div>
					<div class="col-lg-5">
						<div class="bg-light p-3 border rounded mb-4">
							<h3 class="text-primary  mt-3 pl-3 mb-3"><%=book.getName()%></h3>
							<br>
							<ul class="list-unstyled pl-3 mb-0">
								<li class="mb-2"><strong class="text-black" style="font-size: 20px;">저자 </strong><%=book.getAuthor()%></li>
								<li class="mb-2"><strong class="text-black" style="font-size: 20px;">출판사 </strong><%=book.getPublisher()%></li>
								<li class="mb-2"><strong class="text-black" style="font-size: 20px;">도서관 위치 </strong><%=book.getLocation()%></li>
								<li class="mb-2"><strong class="text-black" style="font-size: 20px;">현재 권수 </strong><%=book.getVol()%>권</li>
								<li class="mb-2"><strong class="text-black" style="font-size: 20px;">도서기호 </strong><%=book.getState()%></li>
								<li class="mb-2"><strong class="text-black" style="font-size: 20px;">ISBN </strong><%=book.getSerial()%></li>
							</ul>
						</div>
						<br>
						<h3 class="h5 d-flex align-items-center mb-4 text-primary">
								<span class="icon-align-left mr-3"></span>도서 소개
						</h3>
							<p><%=book.getDescription()%></p>
					</div>
				</div>
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
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>