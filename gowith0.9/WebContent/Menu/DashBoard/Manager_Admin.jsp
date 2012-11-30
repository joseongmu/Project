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
		
		int numInPage = 7;												// 한페이지에 출력할 아이템 개수
		int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
		int numItems, numPages;
		try {

		    // DB 접속
			Conn = DriverManager.getConnection(url,db_user,db_passwd);
	 		
			stmt = Conn.createStatement();
			
			// users 테이블: user 수 페이지수 개산
	 		rs = stmt.executeQuery("SELECT COUNT(*) FROM content WHERE promote=1");
			rs.next();
			numItems = rs.getInt(1);
			numPages = (int) Math.ceil((double)numItems / (double)numInPage);
			rs.close();
			stmt.close();
		
 		// users 테이블 SELECT
			pstmt = Conn.prepareStatement("SELECT * FROM content WHERE promote=1 ORDER BY Id LIMIT " + startPos + ", " + numInPage);
			rs2 = pstmt.executeQuery();
 	%>
 		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					Total <b><%=numItems %></b> content 
				</div>
				<div class="pull-right">
					<b><%= pageNo%></b> page / total <b><%= numPages %></b> pages
				</div>
 			</div>
 		</div>
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>User_Id</th>
					<th>Title</th>
					<th>Category</th>
					<th>Num_People</th>
					<th>Duration</th>
					<th>Price</th>
					<th>Admin</th>
				</tr>
			</thead>
			<tbody>
			<%
				while(rs2.next()) {
					promote = rs2.getInt("promote");
						%>
						<tr>
							<td><%=rs2.getInt("user_id") %></td>
							<td><%=rs2.getString("title") %></td>
							<td><%=rs2.getString("category") %></td>
							<td><%=rs2.getInt("num_people") %></td>
							<td><%=rs2.getString("duration") %></td>
							<td><%=rs2.getInt("price") %></td>
							<td>
								<a href="Menu/DashBoard/Manager_Update.jsp?Id=<%=rs2.getInt("Id")%>" class="btn btn-mini btn-primary" >promote</a>
							</td>
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
        	out.println("<a href='http://localhost:8080/gowith/DashBoardView.jsp?page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="http://localhost:8080/gowith/DashBoardView.jsp?page=<%= pageNo + 1%>">&raquo;</a></li>
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
			if (rs2 != null) try{rs2.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if (Conn != null) try{Conn.close();} catch(SQLException e) {}
		}
		%>