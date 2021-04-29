<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
<script type = "text/javascript" src="./js/login_validation.js"></script>
</head>
<script type="text/javascript">
		function login_error() {
		alert("가입된 회원아이디가 아니거나 비밀번호가 틀립니다.\n비밀번호는 대소문자를 구분합니다.");
		}
</script>
<body id="top">

<%	String error = (String)request.getAttribute("error");
	if(error != null)
	{
%>
	<script>login_error();</script>
<%	} %>

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
						<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>도서대출</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>
		


		<section class="site-section">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-lg-6 mb-5">
						<h2 class="mb-4">Please sign in</h2>
						<form action="Login.member" name="login" class="p-4 border rounded" method="post">
							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">아이디</label> <input type="text" name="ID" class="form-control" placeholder="ID">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12 mb-3 mb-md-0">
									<label class="text-black" for="fname">비밀번호</label> <input type="password" name="PASSWORD" class="form-control" placeholder="Password">
								</div>
							</div>

							<div class="row form-group" >
								<div class="col-md-12" style="left:58%">
									<a href="JoinAction.member" style="border:1px solid #6c757d66; color:#495057b8" class="btn border-width-2 d-none d-lg-inline-block">회원 가입</a>
									<input type="submit" value="로그인" class="btn px-3 btn-primary text-white"> 
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	
		<jsp:include page="footer.jsp"/>
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