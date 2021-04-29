<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.wishDTO"%>
<%
	wishDTO notice = (wishDTO) request.getAttribute("wish");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String[] select = (String[])request.getAttribute("select");
	
	for(int i=0 ; i<select.length; i++)
	{
		if(select[i].equals("selected"))
			select[i]="selected";
		else
			select[i]="";	
	}
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
			location.href="./boardWishDeleteAction.board?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>";
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
	<section class="site-section" id="next-section">
		<div class="container">

			<div class="row justify-content-center">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<form method="post" action="boardWishUpdateAction.board?num=<%=notice.getNum()%>">
						<div class="row form-group">
						<div class="col-md-6">
								<label class="text-black" for="lname">아이디</label> <input type="text" name="id" class="form-control" value="<%=notice.getId()%>" readonly>
							</div>					
							</div>		
						<div class="row form-group">
							
							
							<div class="col-md-6">
								<label class="text-black" for="lname">*희망 소장처<br /></label>
								<p>
									<select class="form-control" name="location" required>
										<option value="의창도서관" <%=select[0] %>>의창도서관</option>
										<option value="고향의봄" <%=select[1] %>>고향의봄</option>
										<option value="명곡도서관" <%=select[2] %>>명곡도서관</option>
										<option value="성산도서관" <%=select[3] %>>성산도서관</option>
										<option value="상남도서관" <%=select[4] %>>상남도서관</option>
										<option value="마산합포도서관" <%=select[5] %>>마산합포도서관</option>
										<option value="마산회원도서관" <%=select[6] %>>마산회원도서관</option>
										<option value="내서도서관" <%=select[7] %>>내서도서관</option>
										<option value="중리초등도서관" <%=select[8] %>>중리초등도서관</option>
									</select>
							</div>
							
							<div class="col-md-6">
								<label class="text-black" for="lname">*도서명</label> <input type="text" name="name" class="form-control" value="<%=notice.getName()%>" required>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-6 mb-3 mb-md-0">
								<label class="text-black" for="fname">*저자</label> <input type="text" name="author" class="form-control" value="<%=notice.getAuthor()%>" required>
							</div>
							<div class="col-md-6">
								<label class="text-black" for="lname">출판사</label> <input type="text" name="publisher" class="form-control" value="<%=notice.getPublisher()%>">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-6 mb-3 mb-md-0">
								<label class="text-black" for="fname">출판연도</label> <input type="text" name="year" class="form-control" value="<%=notice.getYear()%>">
							</div>
							<div class="col-md-6">
								<label class="text-black" for="lname">가격<br /></label> <input type="text" name="price" class="form-control" value="<%=notice.getPrice()%>">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<label class="text-black" for="message">추천사유</label>
								<textarea name="description" cols="30" rows="3" class="form-control" style="resize: none"><%=notice.getDescription()%></textarea>
							</div>
						</div>
						<hr style="color: black;">

						<div class="row form-group">
							<div class="col-md-6 mb-3 mb-md-0">
								<label class="text-black" for="fname">SMS 희망신청 </label>
								<p>
									<c:set var="sms" value="<%=notice.getSms()%>"></c:set>
									<c:choose>
										<c:when test="${empty sms}">
											<input type="radio" value="y" name="sms">예 <input type="radio" value="n" name="sms">아니오
										</c:when>
										<c:when test="${sms eq 'y'}">
											<input type="radio" value="y" name="sms" checked>예 <input type="radio" value="n" name="sms">아니오
										</c:when>
										<c:otherwise>
											<input type="radio" value="y" name="sms">예 <input type="radio" value="n" name="sms" checked>아니오
										</c:otherwise>
									</c:choose>
							</div>
							<div class="col-md-6">
								<label class="text-black" for="lname">연락처</label> <input type="text" name="phone" class="form-control" value="<%=notice.getPhone()%>">
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
								<a href="./boardListAction.board?pageNum2=<%=nowpage%>" class="btn btn-primary"> 목록</a>
							</div>
						</div>
					</form>

				</div>

			</div>
		</div>
	</section>
	<jsp:include page="./footer.jsp" />
</body>
</html>


