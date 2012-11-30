<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%

int Result =0;
request.setCharacterEncoding("utf-8");
local =request.getParameter("area");
SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");

try{
		Conn=DriverManager.getConnection(url,db_user,db_passwd);	  
		pstmt = Conn.prepareStatement("SELECT * From user WHERE Id=?");
		pstmt.setString(1, SESSION_USER_ID);
		rs = pstmt.executeQuery();
		if(rs.next()){
			local =request.getParameter("area");
		}
			if (local == null || local.trim().length() == 0) {
				errorMsg += "<span id='error_Msg'> 변경 하시는 내용을 입력해주세요.</span><br>";
			}
		
	  	if(errorMsg==null){
				pstmt = Conn.prepareStatement("UPDATE user SET local=? WHERE Id=?");
				pstmt.setString(1, local);
				pstmt.setString(2, SESSION_USER_ID);
				Result = pstmt.executeUpdate();
				%>
				<script>location.href="<%=AccountLink%>";</script>
				<%
	  	}
 }catch(SQLException e){
   errorMsg = "SQL 에러: "+e.getMessage();
 }finally{
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
		if(Conn != null) try{Conn.close();}catch(SQLException e){}
 }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
 	<div class="container">
 		<% if (errorMsg!=null) { %>
 			<div class="alert alert-error">
 				<h3>Errors:</h3>
 				<ul>
 						<li><%=errorMsg %></li>
 				</ul>
 			</div>
		 	<div class="form-action">
		 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
		 	</div>
	 	<% } else if (Result == 1) { %>
	 		<div class="alert alert-success">
	 			메일을 받기 원하는 지역이 <b><%= local %></b>로 수정되었습니다.
	 		</div>
		 	<div class="form-action">
		 		<a href="<%=AccountLink%>" class="btn">목록으로</a>
		 	</div>
	 	<%}%>
 	</div>
</body>
</html>

