<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%
Del_Id = Integer.parseInt(request.getParameter("id"));
try{
	  query="DELETE FROM reserve WHERE id=?";
		Conn=DriverManager.getConnection(url,db_user,db_passwd);	  
		pstmt = Conn.prepareStatement(query);
		pstmt.setInt(1,Del_Id);
		pstmt.executeUpdate();
		%>
		<script>location.href="<%=BookLink%>"; alert("결제 내역이 삭제 되었습니다.");</script>
		<%
}catch(SQLException e){
	   errorMsg = "SQL 에러: "+e.getMessage();
}finally{
			if(rs != null) try{rs.close();}catch(SQLException e){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
			if(Conn != null) try{Conn.close();}catch(SQLException e){}
}
%>