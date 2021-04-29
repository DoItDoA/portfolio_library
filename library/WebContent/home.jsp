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
</head>
<body id="top">
	<div class="site-wrap">
		<jsp:include page="menu.jsp" />
		<!-- HOME -->
		<section class="home-section section-hero overlay bg-image" style="background-image: url('images/hero_1.svg');" id="home-section">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-12">
						<div class="mb-5 text-center">
							<h1 class="text-white font-weight-bold">The Easiest Way To Search Your Books</h1>
						</div>
						<form method="post" action="bookSearchAction.book" class="search-jobs-form">
							<div class="row mb-5">
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<input type="text" name="text" class="form-control form-control-lg" placeholder="검색어 입력">
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<select class="selectpicker" name="items" data-style="btn-white btn-lg" data-width="100%">
										<option value="b_name">도서명</option>
										<option value="b_author">저자</option>
										<option value="b_publisher">출판사</option>
										<option value="b_serial">ISBN(13)</option>
									</select>
								</div>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<select class="selectpicker" name="locations" data-style="btn-white btn-lg" data-width="100%">
										<option value="">도서관 전체</option>
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
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<button type="submit" class="btn btn-primary btn-lg btn-block text-white btn-search">
										<span class="icon-search icon mr-2"></span>검색
									</button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12 popular-keywords">
									<h3>Trending Keywords:</h3>
									<ul class="keywords list-unstyled m-0 p-0">
										<li><a href="bookSearchAction.book?text=무라카미 하루키&items=b_author">무라카미 하루키</a></li>
										<li><a href="bookSearchAction.book?text=해리포터&items=b_name">해리포터</a></li>
										<li><a href="bookSearchAction.book?text=공병호&items=b_author">공병호</a></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<a href="#next" class="scroll-button smoothscroll"> <span class=" icon-keyboard_arrow_down"></span>
			</a>
		</section>
		<section class="site-section py-4">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-12 text-center mt-4 mb-5">
						<div class="row justify-content-center">
							<div class="col-md-7">
								<h2 class="section-title mb-2">책과 함께 문화를 열어나갑니다.</h2>
								<p class="lead">다양한 독서장려 시책과 인문학 강좌 및 문화교실 운영으로 책을 통해 공감, 소통하는 시민독서문화를 조성하는 도서관이 되겠습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="bg-light pt-5 testimony-full" id="next">
			<div class="owl-carousel single-carousel">
				<div class="container">
					<div class="row">
						<div class="col-lg-5 align-self-end text-center text-lg-right">
							<blockquote>
								<p>&ldquo;내가 우울한 생각의 공격을 받을 때 내 책에 달려가는 일처럼 도움이 되는 것은 없다. 책은 나를 빨아들이고 마음의 먹구름을 지워준다.&rdquo;</p>
								<p>
									<cite> &mdash;미셸 드 몽테뉴</cite>
								</p>
							</blockquote>
						</div>
						<div class="col-lg-7 align-self-end text-center text-lg-right">
							<img src="images/inside_library.png" alt="Image" style="min-width: 465px; height: 500px;" class="img-fluid mb-0">
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-lg-6 align-self-center text-center text-lg-left">
							<blockquote>
								<p>&ldquo;내가 책을 좋아한다는 것을 알고 그는 내가 내 공작의 작위보다 더 소중히 여길 책들로 내 서재를 채워 주었다.&rdquo;</p>
								<p>
									<cite> &mdash; 윌리엄 셰익스피어</cite>
								</p>
								<p>&ldquo;좋은 책을 읽는 것은 과거 몇 세기의 가장 훌륭한 사람들과 이야기를 나누는 것과 같다.&rdquo;</p>
								<p>
									<cite> &mdash; 르네 데카르트</cite>
								</p>
							</blockquote>
						</div>
						<div class="col-lg-6 align-self-end text-center text-lg-right">
							<img src="images/inside_library2.png" alt="Image" style="min-width: 465px; height: 500px;" class="img-fluid mb-0">
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
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/custom.js"></script>

</body>
</html>