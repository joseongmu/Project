<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>
<%
		int Id = Integer.parseInt(request.getParameter("Id"));
		try{
					query="UPDATE content SET promote=? WHERE Id=?";
					Conn = DriverManager.getConnection(url,db_user,db_passwd);
					pstmt = Conn.prepareStatement(query);
					pstmt.setInt(1, 2);
					pstmt.setInt(2, Id);
					pstmt.executeUpdate();
					}catch (SQLException e){
						errorMsg = "SQL 에러:" + e.getMessage();
					}finally{
						if(rs != null) try{rs.close();}catch(SQLException e){}
						if(stmt != null) try{stmt.close();}catch(SQLException e){}
						if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
						if(Conn != null) try{Conn.close();}catch(SQLException e){}
			}
			%>
