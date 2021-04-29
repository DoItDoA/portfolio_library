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
<script type="text/javascript">
	function alarm() {	
		var name = document.getElementById("name").value;
		var author = document.getElementById("author").value;
		
		if(name == "" || author == ""){
			alert("*(필수입력)에 입력해주세요.");
			return false;
		}
		
		alert("신청이 되었습니다");
		document.request.submit();
	}
	
</script>
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
						<h1 class="text-white font-weight-bold"></h1>
						<div class="custom-breadcrumbs">
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>희망도서신청</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="site-section" id="next-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 mb-5 mb-lg-0">
						<form method="post" name="request" action="requestBookRegist.board">
							<div class="row form-group">
								<div class="col-md-6">
									<label class="text-black" for="lname">*희망 소장처<br /></label>
									<p>
										<select class="form-control" name="location" required>
											<option value="의창도서관">의창도서관</option>
											<option value="고향의봄">고향의봄</option>
											<option value="명곡도서관">명곡도서관</option>
											<option value="성산도서관">성산도서관</option>
											<option value="상남도서관">상남도서관</option>
											<option value="마산합포도서관">마산합포도서관</option>
											<option value="마산회원도서관">마산회원도서관</option>
											<option value="내서도서관">내서도서관</option>
											<option value="중리초등도서관">중리초등도서관</option>
										</select>
								</div>
								<div class="col-md-6">
									<label class="text-black" for="lname">*도서명</label> <input id="name" type="text" name="name" class="form-control" required>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-6 mb-3 mb-md-0">
									<label class="text-black" for="fname">*저자</label> <input id="author" type="text" name="author" class="form-control" required>
								</div>
								<div class="col-md-6">
									<label class="text-black" for="lname">출판사</label> <input type="text" name="publisher" class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-6 mb-3 mb-md-0">
									<label class="text-black" for="fname">출판연도</label> <input type="text" name="year" class="form-control">
								</div>
								<div class="col-md-6">
									<label class="text-black" for="lname">가격<br/></label> <input type="text" name="price" class="form-control">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label class="text-black" for="message">추천사유</label>
									<textarea name="description" cols="30" rows="3" class="form-control" style="resize: none"></textarea>
								</div>
							</div>
							<hr style="color: black;">
							
							<div class="row form-group">
								<div class="col-md-6 mb-3 mb-md-0">
									<label class="text-black" for="fname">SMS 희망신청 </label>
									<p>
										<input type="radio" value="y" name="sms">예 <input type="radio" value="n" name="sms">아니오
								</div>
								<div class="col-md-6">
									<label class="text-black" for="lname">연락처</label> <input type="text" name="phone" class="form-control">
								</div>
								
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<input type="button" value="신청하기" onclick="alarm()" class="btn btn-primary btn-md text-white">
								</div>
							</div>
						</form>

					</div>
					<div class="col-lg-5 ml-auto">
						<div class="p-4 mb-3 bg-white">
							<p class="mb-0 font-weight-bold">주 소</p>
							<p class="mb-4">주소: (51171) 경상남도 창원시 의창구 서곡길 21(명서동)</p>
							<p class="mb-0 font-weight-bold">전화번호</p>
							<p class="mb-4">055-225-7321</p>
							<p class="mb-0 font-weight-bold">Email Address</p>
							<p class="mb-0">youremail@domain.com</p>
						</div>
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
	<script src="js/quill.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>