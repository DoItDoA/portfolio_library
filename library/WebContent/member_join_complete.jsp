<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = (String) request.getAttribute("name");
%>
<!doctype html>
<html lang="ko">
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
<link rel="stylesheet" href="css/quill.snow.css">
<link rel="stylesheet" href="css/join_style.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<body id="top">


<div class="site-wrap">

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->


		<!-- NAVBAR -->
		<jsp:include page="menu.jsp" />

		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="custom-breadcrumbs">
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>회원가입</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="tabs" class="project-tab">
			<div class="container" style="width: 720px;">
				<form name="newMember" class="form-horizontal" action="member_join_process.jsp" method="post">
					<div class="row">
						<div class="col-md-12">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
									<h4>회원 가입</h4>
									<hr>
									<p><%=name%>님의 회원 가입을 진심으로 축하합니다.
									<br>회원님의 비밀번호는 아무도 알 수 없는 암호화 코드로 저장되므로 안심하셔도 좋습니다.
									<br>회원탈퇴는 언제든지 가능하며 일정기간이 지난 후, 회원님의 정보는 삭제하고 있습니다.
									<br> 감사합니다.
									<div class="col-lg-4">
										<div class="row">
											<div class="col-6" style="width: 50px;">
												<a href="LoginAction.member" class="btn btn-block btn-primary btn-md" style="width: 130px;">로그인</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</div>

	<jsp:include page="footer.jsp" />

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