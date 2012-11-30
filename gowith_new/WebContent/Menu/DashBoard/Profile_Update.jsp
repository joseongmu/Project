<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%
int Result =0;
SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");

request.setCharacterEncoding("utf-8");

try{
	  query="SELECT * From user WHERE Id=?";
		Conn=DriverManager.getConnection(url,db_user,db_passwd);	  
		pstmt = Conn.prepareStatement(query);
		pstmt.setString(1,SESSION_USER_ID );
		rs = pstmt.executeQuery();
		if(rs.next()){
			DB_password =rs.getString("password");
			DB_profile_img=rs.getString("profile_img");
		}
		pstmt.close();
		rs.close();
		
		email_address = request.getParameter("email_address");
	  nickname = request.getParameter("nickname");
	  profile_img = request.getParameter("profile_img");
	  if(profile_img==null){
		  profile_img=DB_profile_img;
	  }
	  Introduce = request.getParameter("introduce");
	  password_current = request.getParameter("password_current");
	  password_new = request.getParameter("password_new");
	  password_confirm = request.getParameter("password_confirm");
	  
		if (email_address == null || email_address.trim().length() == 0) {
			errorMsg += "<span id='error_Msg'> 이메일을 반드시 입력해주세요.</span><br>";
		}
		
		if (nickname == null || nickname.trim().length() == 0) {
			errorMsg += " <span id='error_Msg'>닉네임을 반드시 입력해주세요.</span><br>";
		}
		if (password_current == null || password_current.trim().length() < 6 || !(password_current.equals(DB_password))) {
			errorMsg += " <span id='error_Msg'>현재 비밀번호와 같지 않습니다.</span><br>";
		}
		if (!(password_new.equals(password_confirm)) || password_new == null || password_new.trim().length() < 6) {
			errorMsg += " <span id='error_Msg'>새로운 비밀번호가 잘못되었습니다.(6자리 이상) </span><br>";
		}
	  if(errorMsg==null){
			pstmt = Conn.prepareStatement("UPDATE user SET email_address=?, nickname=?, profile_img=?, introduce=?, password=? WHERE Id=?");
			pstmt.setString(1,  email_address);
			pstmt.setString(2,  nickname);
			pstmt.setString(3,  profile_img);
			pstmt.setString(4,  Introduce);
			pstmt.setString(5,  password_new);
			pstmt.setString(6, SESSION_USER_ID);
			Result = pstmt.executeUpdate();
			%>
			<script>location.href="<%=ProfileLink%>";</script>
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
		 		<a onclick="location.href='<%=ProfileLink %>'" class="btn">뒤로 돌아가기</a>
		 	</div>
	 	<% } else if (Result == 1) { %>
	 		<div class="alert alert-success">
	 			<b><%= nickname %></b>님 정보가 수정되었습니다.
	 		</div>
		 	<div class="form-action">
		 		<a href="<%=ProfileLink %>" class="btn">목록으로</a>
		 	</div>
	 	<%}%>
 	</div>
</body>
</html>

