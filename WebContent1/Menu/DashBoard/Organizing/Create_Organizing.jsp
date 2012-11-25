<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Go with</title>
	<link href="../../../css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../css/index2.css" rel="stylesheet" type="text/css" media="screen, projection" />
  <link href="../../../css/index.css" rel="stylesheet" type="text/css" media="all" /> 
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="../../../js/bootstrap.min.js"></script>
	
	<script type='text/javascript' src='../../../js/jquery-ui-1.8.23.custom.min.js'></script>
  <script type="text/javascript" src="../../../js/jquery-1.8.1.js"></script>
  <link rel='stylesheet' type='text/css' href='../../../jsplugin/fullcalendar/fullcalendar.css' />
  <link rel='stylesheet' type='text/css' href='../../../jsplugin/fullcalendar/fullcalendar.print.css' media='print' />
  <script type='text/javascript' src='../../../jsplugin/fullcalendar/fullcalendar.min.js'></script>
	<link rel='stylesheet' type='text/css' href='../../../jsplugin/redmond/jquery-ui-1.9.1.custom.css' />
</head>
<%@include file="../../../CommonT.jsp" %>
<body>
<% nextpage = request.getParameter("next"); %>
<jsp:include page="../../../Mainview/top/top.jsp"></jsp:include><br><br><br><br><br>

<div class="row offset2">
		<div class="span3" >
				<jsp:include page="Order.jsp"></jsp:include>		
		</div>
		
		<%		if(nextpage==null) {%>
					<jsp:include page="Basic_infor.jsp"></jsp:include>	
		<%}else if(nextpage.equals("photo")){ %>
					<jsp:include page="Photos.jsp"></jsp:include>		
		<%}else if(nextpage.equals("calender")){ %>
					<jsp:include page="Calender.jsp"></jsp:include>	
 		<%} %>
    
  </div>

  
</body>
</html>