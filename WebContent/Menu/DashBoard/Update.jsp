<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%
String errorMsg = "";
String email_address = "";
String nickname = "";
String profile_img = "";
String introduce = "";
String password = "";
try{
		email_address = request.getParameter("email_address");
	  nickname = request.getParameter("nickname");
	  profile_img = request.getParameter("profile_img");
	  introduce = request.getParameter("introduce");
	 	password = request.getParameter("password");
	  
		if (email_address == null || userid.trim().length() == 0) {
			errorMsg += "<span id='error_Msg'> 이메일을 반드시 입력해주세요.</span><br>";
		}
		
		if (nickname == null || nickname.trim().length() == 0) {
			errorMsg += " <span id='error_Msg'>닉네임을 반드시 입력해주세요.</span><br>";
		}
		if (password == null || password.trim().length() > 6){
			errorMsg += " <span id='error_Msg'>비밀번호를 반드시 입력해주세요.</span><br>";
		}
	  if(errorMsg.trim().length() == 0 && errorMsg==""){
		  String query= "UPDATE user SET email_address=?, nickname=?, profile_img=?, introduce=?, password=?, WHERE id=1";
			Conn=DriverManager.getConnection(url,db_user,db_passwd);	  
			pstmt = Conn.prepareStatement(
					"UPDATE users " +
					"SET  userid=?, name=?, email=?, country=?, gender=?, favorites=? " +
					"WHERE id=?"
					);
			pstmt.setString(1,  email_address);
			pstmt.setString(2,  nickname);
			pstmt.setString(3,  profile_img);
			pstmt.setString(4,  introduce);
			pstmt.setString(5,  password);
			
			pstmt.executeUpdate();
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
<div id="update_successed">
	<div id="update_successed_msg">
	
	<%if(errorMsg == "") {%>
		<h4><%=nickname%>회원 정보가 변경 되었습니다.</h4>
			<a href="../../index.jsp" id=update>메인 페이지로</a>
			<button class="gidsy-button green-button left" id="search-submit">Search</button>
	<%}else{ %>
		<h4><%=nickname%>회원 정보 변경에 실패 하셧습니다.</h4>
	<%
			out.println(errorMsg);
		}%>
	
	</div>
</div>