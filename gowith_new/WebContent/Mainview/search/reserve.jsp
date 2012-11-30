<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
    
 <% 
	 SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");
	request.setCharacterEncoding("UTF-8");
  content_id= request.getParameter("Id");
  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  String strToday = sdf.format(new java.util.Date());
					try{
							Conn = DriverManager.getConnection(url,db_user,db_passwd); 
							query = "INSERT INTO reserve(user_id,content_id,cratedat,sign) VALUES(?, ?, ?,?) ";
							pstmt = Conn.prepareStatement(query);
							pstmt.setString(1,SESSION_USER_ID);
							pstmt.setString(2,content_id);
							pstmt.setString(3,strToday);
							pstmt.setInt(4,2);
					  	pstmt.executeUpdate();
					  	%>
						<script>location.href="<%=MailingLink%>&page=1";</script>
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