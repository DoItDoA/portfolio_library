<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.privateBookDTO" %>
<%
	List<privateBookDTO> list = (List) request.getAttribute("list");
	int[] currentLoan = (int[])request.getAttribute("currentLoan");
	int size=list.size();
%>    
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
function DeleteCheck()
{
	if(confirm("정말로 삭제하시겠습니까?"))
		document.deleteBooks.submit();
	else
		return;
}
</script>

</head>
<body>
	<jsp:include page="menu.jsp" />
	<section class="section-hero overlay inner-page bg-image" style="background-image: url('images/hero_1.jpg');" id="home-section"></section>
	<section class="py-5 bg-image overlay-primary fixed" id="next" style="background-image: url('images/hero_1.jpg');">
		<div class="container">
			<div class="row mb-5 justify-content-center">
				<div class="col-md-7 text-center">
					<h2 class="section-title mb-2 text-white">도서 대출 현황</h2>
				</div>
			</div>
			<div class="row pb-0 block__19738 section-counter justify-content-center">
				
				<div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
					<div class="d-flex align-items-center justify-content-center mb-2">
						<strong class="number" data-number="1930"><%=currentLoan[0]%></strong>
					</div>
					<span class="caption">전체 권수</span>
				</div>

				<div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
					<div class="d-flex align-items-center justify-content-center mb-2">
						<strong class="number" data-number="54"><%=currentLoan[1]%></strong>
					</div>
					<span class="caption">대출 권수</span>
				</div>
				<div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
					<div class="d-flex align-items-center justify-content-center mb-2">
						<strong class="number" data-number="120"><%=currentLoan[2]%></strong>
					</div>
					<span class="caption">미납 권수</span>
				</div>
			</div>
		</div>
	</section>
	<section class="site-section">
		<div class="container">
			<div class="row">
				<section class="content">
					<div class="col-md-8" style="width: 1720px;">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-container"></div>
								<h1>신청내역조회</h1>
								<form name="deleteBooks" method="post" action="./DeleteBookList.book?size=<%=size%>">
								<table class="table table-filter">
									<colgroup>
										<col width="3%" />
										<col width="28%" />
										<col width="12%" />
										<col width="10%" />
										<col width="10%" />
										<col width="7%" />
										<col width="7%" />
										<col width="10%" />
										<col width="10%" />
										<col width="3%" />
									</colgroup>
									<tr style="text-align: center; vertical-align: middle;">
										<th style="vertical-align: middle;width:5%"><p><Strong>번호</Strong></th>
										<th style="vertical-align: middle;width:15%"><h5><strong>제목</strong></h5></th>
										<th style="vertical-align: middle;width:10%"><h5><strong>저자</strong></h5></th>
										<th style="vertical-align: middle"><h5><strong>출판사</strong></h5></th>
										<th style="vertical-align: middle"><h5><strong>도서관</strong></h5></th>
										<th style="vertical-align: middle"><p><strong>도서<br>기호</strong></th>
										<th style="vertical-align: middle"><p><strong>대출<br>권수</strong></th>
										<th style="vertical-align: middle"><h5><strong>대출일</strong></h5></th>
										<th style="vertical-align: middle"><h5><strong>반납일</strong></h5></th>
										<th style="vertical-align: middle"><h5><strong></strong></h5></th>
									</tr>
									<tbody>
										<%
											for(int i =0; i<list.size() ; i++)
											{
												privateBookDTO book = (privateBookDTO)list.get(i);
										%>
										<tr data-status="pagado" style="text-align: center;">
											<td style="vertical-align: middle"><%=book.getNum() %></td>
											<td style="vertical-align: middle"><%=book.getName() %></td>
											<td style="vertical-align: middle"><%=book.getAuthor() %></td>
											<td style="vertical-align: middle"><%=book.getPublisher() %></td>
											<td style="vertical-align: middle"><%=book.getLocation() %></td>
											<td style="vertical-align: middle"><%=book.getState() %></td>
											<td style="vertical-align: middle"><%=book.getVol() %></td>
											<td style="vertical-align: middle"><%=book.getRegistday() %></td>
											<td style="vertical-align: middle"><%=book.getLateRegistday() %></td>
											<td style="vertical-align: middle"><input type="checkbox" name="CheckBook<%=i%>" value="<%=book.getSerial()%>" style="width: 20px; height: 20px; border: 2px solid #bcbcbc; cursor: pointer;"></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<div class="pull-right text-md-right">
									<div class="btn-group">
										<button type="button" class="btn btn-success btn-filter" data-target="pagado" onclick="DeleteCheck()">삭제</button>
									</div>
								</div>
								</form>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>