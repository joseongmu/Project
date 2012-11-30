<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date"%>
   <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
    
 <% 
		request.setCharacterEncoding("UTF-8");
 		content_id = request.getParameter("Id");
		try{
			Conn = DriverManager.getConnection(url,db_user,db_passwd); 
			query = "UPDATE reserve SET sign=? WHERE content_id=?";
			pstmt = Conn.prepareStatement(query);
			pstmt.setInt(1,1);
			pstmt.setString(2,content_id);	 
	    pstmt.executeUpdate();
			%>
			<script>location.href="<%=BookLink%>"; </script>
			<%
	}catch(Exception e){
			out.print("SQL 에러: " + e.getMessage());		
	}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if (Conn != null) try{Conn.close();} catch(SQLException e) {}
	}
%>