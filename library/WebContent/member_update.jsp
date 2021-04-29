<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="mvc.model.memberDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	memberDTO info = (memberDTO)request.getAttribute("member");
%>
<!doctype html>
<html>
<head>
<title>아이티 도서관 &mdash; Website Template by Colorlib</title>
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
<script type="text/javascript" src="./js/update_validation.js"></script>

<!-- MAIN CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<script type="text/javascript">
function deleteCheck()
{
	if(confirm("정말로 탈퇴하시겠습니까?"))
		location.href = "DeleteAction.member";
	else
		return;
}
</script>

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
							<a href="home.jsp">Home</a> <span class="mx-2 slash">/</span> <span class="text-white"><strong>회원수정</strong></span>
						</div>
					</div>
				</div>
			</div>
		</section>
						
		<section id="tabs" class="project-tab">
			<div class="container" style="width: 720px;">
				<form name="updateMember" class="form-horizontal" action="Update.member" method="post">
					<div class="row">
						<div class="col-md-12">
							<div class="tab-content" id="nav-tabContent">
								<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
									<p style="text-align: right; color: #333;">
										<span class="fontsize">*(별표)항목은 필수입력 항목을 나타냅니다.</span>
									</p>
									<h4>아이디(ID)정보 입력</h4>
									<table class="table" style="border-bottom: solid 1px #cccccc9c;">
										<colgroup>
											<col width="22%" />
											<col width="78%" />
										</colgroup>
										<tbody>
											<tr>
												<th><strong>*이름(실명)</strong></th>
												<td>
													<input name="name" type="text" value="<%=info.getName()%>" class="form-control" style="width: 20%;" readonly required>
												</td>
											</tr>
											<tr>
												<th><strong>*아이디</strong></th>
												<td>
													<input name="id" type="text" value="<%=info.getId()%>" id="id" class="form-control" style="width: 35%;" readonly required><br />
													<span class="fontsize" >4~20자 사이의 영문, 숫자로 이루어져야 하며 영문으로 시작되어야 합니다.</span>
												</td>
											</tr>
											<tr>
												<th><strong>*비밀번호</strong></th>
												<td>
													<input name="password" id="password" type="password" class="form-control" style="width: 35%;" required>
												</td>
											</tr>
											<tr>
												<th><strong>*비밀번호 확인</strong><br></th>
												<td>
													<input name="password_confirm" id="password_confirm" type="password" class="form-control" style="width: 35%;" required><br> 
													<span class="fontsize">-반드시 <span class="red-font">8~20자의 영문,숫자,특수문자 조합</span>으로 되어야 합니다.<br> 
													-학번, 전화번호 혹은 연속된 숫자 및 문자 등 타인이 쉽게 알아낼 수 있는 비밀번호 사용은 위험합니다.<br> 
													-비밀번호는 <span class="green-font">3~6개월 단위로 주기적으로 변경</span>하시는 것이 안전합니다.<br> 
													-비밀번호는 <span class="red-font">문자,숫자,특수문자(!,@,#,$,%,^,&,*,?,_,~)의 조합으로 8자 이상으로 입력</span></span>
												</td>
											</tr>
										</tbody>
									</table>
									<br>
									<br>
									<h4>개인정보 입력</h4>
									<table class="table" style="border-bottom: solid 1px #cccccc9c;">
										<colgroup>
											<col width="22%" />
											<col width="78%" />
										</colgroup>
										<tbody>
											<c:set var="m_gender" value="<%=info.getGender()%>"></c:set>
											<tr>
												<th><strong>성별</strong></th>
												<c:choose>
													<c:when test="${empty m_gender}">
													<td>
														<input type="radio" name="gender" value="man">남자 
														<input type="radio" name="gender" value="woman">여자
													</td>
													</c:when>
													
													<c:when test="${m_gender eq 'man'}">
													<td>
														<input type="radio" name="gender" value="man" checked>남자 
														<input type="radio" name="gender" value="woman">여자
													</td>
													</c:when>
													
													<c:otherwise>
													<td>
														<input type="radio" name="gender" value="man">남자 
														<input type="radio" name="gender" value="woman" checked>여자
													</td>
													</c:otherwise>
												</c:choose>
											</tr>
											
											<tr>
												<th><strong>전화번호</strong></th>
												<td>
													<input type="text" id="tel" value="<%=info.getTel()%>" name="tel" class=form-control style="width: 35%;">
												</td>
											</tr>
											<tr>
												<th><strong>*휴대폰 번호</strong></th>
												<td>
													<input type="text" id="phone" value="<%=info.getPhone()%>" name="phone" class=form-control style="width: 35%;" placeholder="01012345678" required>
												</td>
											</tr>
											<tr>
												<th><strong>이메일 주소</strong></th>
												<td>
													<input type="text" name="email1" value="<%=info.getMailId() %>" maxlength="50" class=form-control style="width: 35%; display: inline;"> <span style="color: black">@</span> 
													<input type="text" name="email2" value="<%=info.getMailAddress() %>" class=form-control style="width: 45%; display: inline;"> <br> 
													<span class="red-font"><span class="fontsize">*이메일 미입력 시,도서관 공지사항(휴먼계정 전환, 개인정보 보유기간 안내 등)을 수신할 수 없습니다.</span></span>
												</td>
											</tr>
										</tbody>
									</table>
									<div>
										<div>
											<a href="javascript:deleteCheck()" class="btn btn-danger" style="color:white; font-weight: 500">회원탈퇴</a>
											<input type="button" class="btn btn-primary " value="수정하기" onclick="CheckUpdate()" style="float: right; margin-left: 15px;"> 
											<a href="home.jsp" class="btn btn-light" style="float:right">취소</a>											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
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