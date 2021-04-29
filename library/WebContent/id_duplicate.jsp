<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.memberDAO" %>
<%
	
	String id = (String)request.getParameter("id");
	
	memberDAO dao = memberDAO.getInstance();
	boolean notice = (boolean)dao.IdCheck(id);
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/custom-bs.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/line-icons/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/quill.snow.css">
<link rel="stylesheet" href="css/join_style.css">
<script type="text/javascript">
function CheckId()
{
	var id = document.getElementById("id").value;
	location.href = "id_duplicate.jsp?id="+id;
}

</script>
<meta charset="UTF-8">
<title>중복확인</title>
</head>
<body>
	<form name = "check">
	<%if(notice){%>
		<div align="center">
		<br><br>
		<p>입력하신 <%=id %>는 사용 가능한 ID입니다.<br>
		<input type ="button" id="id" value ="닫기" onclick="window.close();">
		</div>
	<% }else{%>
		 <div align="center">
		<br><br>	
		<p>이미 사용 중인 ID입니다.<p>
		<input type="text" id="id">
		<input type="button" value="중복확인" onclick="CheckId()">
		</div>
	<% }%>
	</form>
</body>
</html>