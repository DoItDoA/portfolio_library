<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
%>
<html>
<head>
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
<title>아이티 도서관</title>
</head>
<script type="text/javascript">
	function check() {
		if (!document.newWrite.name.value) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		if (!document.newWrite.subject.value) {
			alert("제목을 입력하세요.");
			return false;
		}
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
<body>
	<jsp:include page="./menu.jsp" />
	<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-white font-weight-bold"></h1>
					<div class="custom-breadcrumbs">
						<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>게시판</strong></span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="tabs" class="project-tab site-section">
		<div class="container">

			<form name="newWrite" action="./boardWriteAction.board" class="form-horizontal" method="post" onsubmit="return check()">
				<input name="id" type="hidden" class="form-control" value="${sessionId}">
				<div class="form-group row">
					<label class="col-sm-2 control-label">닉네임</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control" placeholder="nickname">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-5">

						<input name="subject" type="text" class="form-control" placeholder="subject">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea name="content" cols="50" rows="5" class="form-control" placeholder="content"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary " value="등록 "> 
						<input type="reset" class="btn btn-primary " value="취소 ">
					</div>
				</div>
			</form>
			<hr>
		</div>
	</section>
	<jsp:include page="./footer.jsp" />

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



