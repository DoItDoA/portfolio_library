<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="mvc.model.bookDTO" %>
<%
	List<bookDTO> bookList = (List)request.getAttribute("HitBook");
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
</head>
<body id="top">
	<jsp:include page="menu.jsp" />
	<div class="site-wrap">
		
		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold"></h1>
					<div class="custom-breadcrumbs">
						<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>베스트 도서</strong></span>
					</div>
				</div>
			</div>
		</div>
		</section>

		<section class="site-section" id="next-section">
			<div class="container">
				<div class="row">
				<% for(int i=0; i<bookList.size(); i++) {
					bookDTO book = (bookDTO)bookList.get(i);
				%>
					<div class="col-md-6 col-lg-4 item" style = "text-align:center">
						<div style = "height:540px; vertical-align:middle">
							<a href="BookViewAction.book?serial=<%=book.getSerial()%>&pageNum=1&text=&items=&locations=&dataSort=b_registday desc&listNum=5" class="item-wrap"> <span class="icon-search2"></span> 
							<img class="img-fluid" src="images/<%=book.getImage()%>" alt="이미지 없음">
							</a>
						</div>
							<h4><%=i+1 %>위</h4>
							<h5><%=book.getName() %></h5>
							<p><%=book.getLocation() %></p>
					
					</div>
					
				<%	if(i>=14)
						break;
				} %>	
					
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
	<script src="js/quill.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>