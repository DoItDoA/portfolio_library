<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html lang="kor">
<head>
<title>아이티 도서관 &mdash;</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/custom-bs.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/line-icons/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/quill.snow.css">


<!-- MAIN CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<body id="top">
	<div class="site-wrap">
		<!-- NAVBAR -->
		<jsp:include page="menu.jsp" />

		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="custom-breadcrumbs">
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>관리자 로그인</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 mb-5" style="margin-left: 270px;">
						<h2 class="mb-4">아이티 도서관</h2>
						<%
							String error = request.getParameter("error");
						if (error != null) {
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해주세요.");
							out.println("</div>");
						}
						%>

						<form action="j_security_check" name="login" class="p-4 border rounded" method="post">
							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">아이디</label> <input type="text" name="j_username" required class="form-control" placeholder="ID">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">비밀번호</label> <input type="password" name="j_password" class="form-control" required placeholder="Password">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<input type="submit" value="로그인" class="btn px-4 btn-primary text-white">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<br>
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