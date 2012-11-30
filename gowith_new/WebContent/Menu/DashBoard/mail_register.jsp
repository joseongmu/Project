<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date"%>
   <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
    
 <% 
	request.setCharacterEncoding("UTF-8");
  new_message = request.getParameter("new_message");
  reserve_id = request.getParameter("reserve_id");
  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  String strToday = sdf.format(new java.util.Date());

  if (new_message == null || new_message.trim().length() == 0) {
	%>
	  	<script>history.back(); alert("메세지 내용을 입력해주세요")</script>
<%
  }else{
		try{
			Conn = DriverManager.getConnection(url,db_user,db_passwd); 
			query = "UPDATE reserve SET inbox=?, cratedat=?,booking=?,inbox2=? WHERE Id=?";
			pstmt = Conn.prepareStatement(query);
			pstmt.setString(1,new_message);
			pstmt.setString(2,strToday);	 
			pstmt.setString(3,"1");	 
			pstmt.setString(4,null);	
			pstmt.setString(5,reserve_id);	 
	    pstmt.executeUpdate();
			%>
			<script>location.href="<%=MailingLink%>";</script>
			<%
	}catch(Exception e){
			out.print("SQL 에러: " + e.getMessage());		
	}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if (Conn != null) try{Conn.close();} catch(SQLException e) {}
	}
}
%>
