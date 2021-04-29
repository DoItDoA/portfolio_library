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
		alert("아이디, 비밀번호가 틀립니다.");
		}

</script>
<body id="top">

<%
	String error = (String)request.getAttribute("error");
	if(error != null)
	{
%>
	<script>login_error();</script>
<%
	}
%>

	<div class="site-wrap">

		<!-- NAVBAR -->
		<jsp:include page="menu.jsp" />

		<!-- HOME -->
		<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
			<div class="container">
				<div class="row">
					<div class="col-md-7">

						<div class="custom-breadcrumbs">
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>로그인</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>


		<section class="site-section">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-lg-8 mb-5">
						<form action="Login.member" name="login" class="p-4 border rounded" method="post">
							<h2 style="color:50f"><strong>아이디, 비밀번호 확인</strong></h2>
							<p><strong>아이디, 비밀번호를 한번 더 입력해주세요.</strong><br>회원님의 정보를 안전하게 보호하기 위해 <strong>아이디, 비밀번호</strong>를 한번 더 확인합니다.<hr>
							<div class="row form-group">
								<div>
									<div style="display:inline-block; position:relative; left:4%">
									<label class="text-black"  for="fname">아이디</label> 
									<input type="text" style="display:inline-block; width:65%; margin-left:10px" name="ID" class="form-control" placeholder="로그인 아이디">
									</div>
									<div style="display:inline-block; position:relative; left:4%">
									<label class="text-black" for="fname">비밀번호</label> 
									<input type="password" style="display:inline-block; width:65%; margin-left:10px" name="PASSWORD" class="form-control" placeholder="로그인 비밀번호">
									</div>
									<div style="display:inline-block; position:absolute; right:6%">
									<input type="submit" value="확인" class="btn px-4 btn-primary text-white" >
									</div> 
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