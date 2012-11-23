<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import ="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to GoWith</title>
	<%@include file="../../cssCon.jsp" %>
	
</head>
<body class="homepage" id="top">
<jsp:include page="../top/top.jsp"></jsp:include>
<div id="foot_wrap">
	<div id="foot_header">
		<div id="foot_header_left">
			<h1>이것만은 꼭 한번 해보고싶다..... 생각만 하지 마시고 지금 참여하세요!!</h1>
			저희 GO WITH는 이러한 활동들을 등록하고 예약하는 기능을 제공합니다.
			후회하지 않으시도록 많은 서비스를 제공하겠습니다. 
		</div>
		<div id="foot_header_right"><img src="" id="foot_img"></div>
	</div>
	<div id="foot_content">
		<h1 class="foot_content_title">돈도 벌고 하고싶은 것도 하고 일석이조!</h1>
		<div id="foot_contents">
			<div class="foot_con"></div>
			<div class="foot_con"></div>
			<div class="foot_con"></div>
		</div>
	</div>
	<div id=foot_footer>
		<div class="foot_foot"></div>
		<div class="foot_foot"></div>
		<div class="foot_foot"></div>
		<div class="foot_foot"></div>
		<h1 class="foot_content_title">고민 끝나셧나요! 한번 참여 해볼까요?</h1>
		<a href="#">Stated Now</a>
	</div>
</div>
<jsp:include page="../footer/footer.jsp"></jsp:include>
</body>
</html>