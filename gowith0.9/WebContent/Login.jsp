<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import ="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to GoWith</title>
	<%@include file="../cssCon.jsp" %>
	
</head>
<body class="homepage" id="top">
<jsp:include page="Mainview/top/top.jsp"></jsp:include><br>
<jsp:include page="Login/Login_error.jsp"></jsp:include>
<jsp:include page="Mainview/footer/footer.jsp"></jsp:include>
</body>
</html>