<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="CommonT.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Go with</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/screen.css" rel="stylesheet" type="text/css" media="screen, projection" />
  <link href="css/all.css" rel="stylesheet" type="text/css" media="all" />
  
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery-1.8.3.js"></script>
	  <script src="js/jquery-ui-1.9.2.custom.js"></script> 
	  
	<link rel='stylesheet' type='text/css' href='jsplugin/fullcalendar/fullcalendar.css' />
  <link rel='stylesheet' type='text/css' href='jsplugin/fullcalendar/fullcalendar.print.css' media='print' />
  <script type='text/javascript' src='jsplugin/fullcalendar/fullcalendar.min.js'></script>
	<link rel='stylesheet' type='text/css' href='jsplugin/redmond/jquery-ui-1.9.1.custom.css' />
</head>
<body>
<% nextpage = request.getParameter("next"); %>
<jsp:include page="Mainview/top/top.jsp"></jsp:include><br><br><br><br><br>


		<%		if(nextpage==null) {%>
		<div class="span12 offset2">
				<div class="span3" >
				<jsp:include page="Menu/DashBoard/Organizing/Order.jsp"></jsp:include>		
				</div>
					<jsp:include page="Menu/DashBoard/Organizing/Basic_infor.jsp"></jsp:include>	
		<%}else if(nextpage.equals("photo")){ %>
			<div class="span12 offset2">
				<div class="span3" >
				<jsp:include page="Menu/DashBoard/Organizing/Order.jsp"></jsp:include>		
				 </div>
					<jsp:include page="Menu/DashBoard/Organizing/Photos.jsp"></jsp:include>		
		<%}else if(nextpage.equals("modi")){ %>
			<div class="span12 offset2">
				<div class="span3" >
				<jsp:include page="Menu/DashBoard/Organizing/Order.jsp"></jsp:include>		
				 </div>
					<jsp:include page="Menu/DashBoard/Organizing/Modify.jsp"></jsp:include>		
		<%}else if(nextpage.equals("calender")){ %>
		   <div class="span12 offset0">
						<div class="span3" >
						<jsp:include page="Menu/DashBoard/Organizing/Order.jsp"></jsp:include>		
					</div>
					<jsp:include page="Menu/DashBoard/Organizing/Calender.jsp"></jsp:include>	
 		<%} %>
    
  </div>
   <jsp:include page="Mainview/footer/footertable.jsp"></jsp:include>
  

  
</body>
</html>