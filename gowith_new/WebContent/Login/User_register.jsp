<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../DBcon.jsp" %>
    <%@include file="../CommonT.jsp" %>
    
 <% 
	request.setCharacterEncoding("UTF-8");
  email_address = request.getParameter("email_address");
  password = request.getParameter("password");
  nickname = request.getParameter("nickname");
  Introduce = request.getParameter("Introduce");
  if (email_address == null || email_address.trim().length() == 0) {
	  %>
	  	<script>history.back(); alert("이메일을 입력해주세요")</script>
	 <%
	}else if (password == null || password.length() < 6) {
		  %>
		  	<script>history.back(); alert("비밀번호 6자리 입력해주세요")</script>
		 <%
	}else if (nickname == null || nickname.trim().length() == 0) {
		  %>
		  	<script>history.back(); alert("닉네임을 입력해주세요")</script>
		 <%
	}else if (Introduce == null || Introduce.trim().length() == 0) {
		  %>
		  	<script>history.back(); alert("자기소개를 입력해주세요")</script>
		 <%
	}else{

					try{
							Conn = DriverManager.getConnection(url,db_user,db_passwd); 
						  stmt = Conn.createStatement();  
						  String sql="SELECT * FROM user where email_address='"+email_address+"'";
							rs=stmt.executeQuery(sql);  
							if(rs.next()) {
								%>
								<script>history.back(); alert("중복 이메일 입니다. 다른 이메일 입력해주세요")</script>
								<%
							} else{
							query = "INSERT INTO user(email_address,nickname,password,profile_img,introduce,auth) VALUES(?, ?, ?, ?, ?, ?) ";
							pstmt = Conn.prepareStatement(query);
							pstmt.setString(1,email_address);
							pstmt.setString(2,nickname);
							pstmt.setString(3,password);
							pstmt.setString(4,"noface.png");
							pstmt.setString(5,Introduce);
							pstmt.setInt(6,2);
					  	pstmt.executeUpdate();
					  	
					  	%>
					  	<script>location.href="<%=HomeLink%>";alert("등록이 완료되었습니다. 로그인해주세요!")</script>
					  	<%				  	
					  	//response.sendRedirect("../index.jsp");
							}
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