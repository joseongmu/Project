<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%
		// 페이지 설정
		int pageNo = 1;
		
		try {
			pageNo = Integer.parseInt(request.getParameter("page"));
		} catch (NumberFormatException ex) {}
		
		int numInPage = 10;												// 한페이지에 출력할 아이템 개수
		int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
		int numItems, numPages;
		try {
		    // DB 접속
			Conn = DriverManager.getConnection(url,db_user,db_passwd);
	 		
			stmt = Conn.createStatement();
			
			// users 테이블: user 수 페이지수 개산
	 		rs = stmt.executeQuery("SELECT COUNT(*) FROM user");
			rs.next();
			numItems = rs.getInt(1);
			numPages = (int) Math.ceil((double)numItems / (double)numInPage);
			rs.close();
			stmt.close();
		
 		// users 테이블 SELECT
		stmt = Conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM user ORDER BY Id LIMIT " + startPos + ", " + numInPage);
 	%>
 		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					Total <b><%=numItems %></b> users 
				</div>
				<div class="pull-right">
					<b><%= pageNo%></b> page / total <b><%= numPages %></b> pages
				</div>
 			</div>
 		</div>
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>Id</th>
					<th>E-Mail</th>
					<th>Nickname</th>
					<th>Local</th>
				</tr>
			</thead>
			<tbody>
			<%
				while(rs.next()) {
			%>
				<tr>
					<td><%=rs.getInt("Id") %></td>
					<td><%=rs.getString("email_address") %></td>
					<td><%=rs.getString("nickname") %></td>
					<td><%=rs.getString("local") %></td>
				</tr>
				<%
				}
			%>
			</tbody>
		</table> 


		<div class="pagination pagination-centered">
      <ul>
      	<%
      	// 페이지 네비게이션을 위한 준비
      	int startPageNo, endPageNo;
      	int delta = 5;
      	startPageNo = (pageNo <= delta) ? 1: pageNo - delta;
      	endPageNo = startPageNo + (delta * 2) + 1;
      	
      	if (endPageNo > numPages) {
      		endPageNo = numPages;
      	}
      	
      	// 이전 페이지로
      	if (pageNo <= 1) { 
      	%>
        	<li class="disabled"><a href="#">&laquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="index.jsp?page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="index.jsp?page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
		<%
		} catch (SQLException e) {
			out.print("<div class='alert'>" + e.getLocalizedMessage() + "</div>");
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (Conn != null) try{Conn.close();} catch(SQLException e) {}
		}
		%>