<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <a href="bookSearchAction.book?pageNum=1">도서등록내역</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>도서등록</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="site-section">
			<div class="container" style="max-width: 768px">
				<div class="row align-items-center mb-5">
					<div class="col-lg-8 mb-4 mb-lg-0">
						<div class="d-flex align-items-center">
							<div>
								<h2>도서 등록</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-5">
					<div class="col-lg-12">
						<form class="p-4 p-md-5 border rounded" method="post" enctype="multipart/form-data" action="bookRegistAction.book">
							<h3 class="text-black mb-5 border-bottom pb-2">도서 상세 입력</h3>
							<div class="form-group">
								<label for="company-website-tw d-block">표지 이미지</label> <br>
								<input type="file" name="b_image" class="form-control" style="height: max-content; width:65% ">
							</div>
							<div class="form-group">
								<label for="b_name">도서명</label> 
								<input type="text" class="form-control" style="width:65%" name="b_name">
							</div>
							<div class="form-group">
								<label for="b_author">저자/역자</label> 
								<input type="text" class="form-control" style="width:65%" name="b_author">
							</div>
							<div class="form-group">
								<label for="b_publisher">출판사</label> 
								<input type="text" class="form-control" style="width:65%" name="b_publisher">
							</div>
							<div class="form-group">
								<label for="b_serial">ISBN</label> 
								<input type="text" class="form-control" style="width:65%" name="b_serial">
							</div>
							<div class="form-group">
								<label for="b_vol">수량</label> 
								<input type="number" class="form-control" min="0" value="0" style="width: 100px;" name="b_vol">
							</div>
							<div class="form-group">
								<label for="b_state">도서 기호</label><br>
								<select class="selectpicker border rounded" name="b_state" data-style="btn-black" data-width="45%" >
									<option>A</option>
									<option>B</option>
									<option>C</option>
									<option>D</option>
									<option>E</option>
									<option>F</option>
								</select>
							</div>
							<div class="form-group">
								<label for="b_location">도서관 위치</label><br>
								<select class="selectpicker border rounded" name="b_location" data-style="btn-black" data-width="55%">
									<option>의창도서관</option>
									<option>고향의봄</option>
									<option>명곡도서관</option>
									<option>성산도서관</option>
									<option>상남도서관</option>
									<option>마산합포도서관</option>
									<option>마산회원도서관</option>
									<option>내서도서관</option>
									<option>중리초등도서관</option>
								</select>
								
							</div>
							<div class="form-group">
								<label for="b_description">상세 입력</label> <br>
								<textarea class="selectpicker border rounded" style="resize:none" cols="75" rows="3" name="b_description"></textarea>
							</div>
							
							<div class="col-lg-4 ml-auto">
								<div class="row">
									<div class="col-6">
										<input type="submit" value="등록" class="btn btn-block btn-primary btn-md">
									</div>
									<div class="col-6">
										<input type="reset" value="취소" style="background-color:#e9ecef5e; border-color: #e9ecef5e" class="btn btn-block btn-light btn-md">
									</div>
								</div>
							</div>
						</form>
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