<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import ="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to GoWith</title>
		<%@include file="cssCon.jsp" %>
		<script  type='text/javascript'>
		function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
			$('#PreviewImage').attr('src', e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		} 
		else {
			$('#PreviewImage').attr('src', "#");
			}
		}
</script>
</head>
<body>
<jsp:include page="Mainview/top/top.jsp"></jsp:include><br>
<jsp:include page="Menu/DashBoard/DashBoard.jsp"></jsp:include><br>

</body>
</html>