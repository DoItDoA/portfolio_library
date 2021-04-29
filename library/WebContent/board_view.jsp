<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.boardDTO"%>
<%
	boardDTO notice = (boardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String items = (String) request.getAttribute("items");
	String text = (String) request.getAttribute("text");
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>아이티 도서관</title>
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
	function check() {	
		if(confirm("게시물을 삭제하시겠습니까?"))
			location.href="./boardDeleteAction.board?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>";
		else
			false;
	}
</script>
</head>
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
			<form name="newUpdate" action="boardUpdateAction.board?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post">
				<div class="form-group row">
					<label class="col-sm-2 control-label">성명</label>
					<div class="col-sm-3">
						<input name="name" class="form-control" value="<%=notice.getName()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-5">
						<input name="subject" class="form-control" value="<%=notice.getSubject()%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8" style="word-break: break-all;">
						<textarea name="content" class="form-control" cols="50" rows="5"><%=notice.getContent()%></textarea>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<c:set var="userId" value="<%=notice.getId()%>" />
						<c:if test="${sessionId==userId}">
							<p>
								<a href="#" onclick="check()" class="btn btn-danger"> 삭제</a> 
								<input type="submit" class="btn btn-success" value="수정 ">
						</c:if>
						<a href="./boardListAction.board?pageNum=<%=nowpage%>&items=<%=items%>&text=<%=text%>" class="btn btn-primary"> 목록</a>
					</div>
				</div>
			</form>
			<hr>
		</div>
	</section>
	<jsp:include page="./footer.jsp" />
</body>
</html>


