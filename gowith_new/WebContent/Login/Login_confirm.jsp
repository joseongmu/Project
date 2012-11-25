<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../DBcon.jsp" %>
 <%@include file="../CommonT.jsp" %>
 
 <% 
	request.setCharacterEncoding("UTF-8");
 	email_address=request.getParameter("email_address");
  password=request.getParameter("password");
	try{				
							Conn=DriverManager.getConnection(url,db_user,db_passwd);
							query = "SELECT * FROM user where email_address=? and password=?";
							
							pstmt = Conn.prepareStatement(query);
							pstmt.setString(1,email_address);
							pstmt.setString(2,password);
							rs = pstmt.executeQuery();
							
							if(rs.next()) {
									DB_email_address= rs.getString("email_address"); 
									DB_password= rs.getString("password"); 
									SESSION_USER_ID=rs.getString("Id");
									SESSION_Name=rs.getString("nickname");
									SESSION_PF_IMG=rs.getString("profile_img");
									SESSION_INTRODUCE=rs.getString("introduce");
									SESSION_AUTH=rs.getString("auth");
									if(email_address.equals(DB_email_address) && password.equals(DB_password)){//로그인 성공
										  session.setAttribute("SESSION_USER_ID", SESSION_USER_ID);
										  session.setAttribute("SESSION_Email", DB_email_address);
										  session.setAttribute("SESSION_Name", SESSION_Name);
										  session.setAttribute("SESSION_PF_IMG", SESSION_PF_IMG);
										  session.setAttribute("SESSION_INTRODUCE", SESSION_INTRODUCE);
										  session.setAttribute("SESSION_AUTH", SESSION_AUTH);
										  response.sendRedirect("../index.jsp");
									}
							}else{//로그인 불일치시
								  response.sendRedirect("../Login.jsp");
							}
					}catch(Exception e){
						out.print("SQL 에러: " + e.getMessage());		
					}finally {
							// 무슨 일이 있어도 리소스를 제대로 종료
							if (rs != null) try{rs.close();} catch(SQLException e) {}
							if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
							if (Conn != null) try{Conn.close();} catch(SQLException e) {}
					}
%>
