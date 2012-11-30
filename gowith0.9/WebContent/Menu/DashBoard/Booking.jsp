<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>
<%
SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID"); 
%>
  <script>
$(function(){
	$("a[data-action='delete']").click(function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location = 'Menu/DashBoard/reserveDel.jsp?id=' + $(this).attr('data-id');
		}
		return false;
	});
	$("a[data-action='delete2']").click(function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location = 'Menu/DashBoard/reserveDel2.jsp?id=' + $(this).attr('data-id');
		}
		return false;
	});
	$("a[data-action='account']").click(function() {
		if (confirm("결제하시겠습니까?")) {
			location = '<%=accountviewLink%>?id=' + $(this).attr('data-id');
		}
		return false;
	});
});
</script>

  <div class="span11">
  		<div class="content-box list-view">
  		 			<div class="box-header">
	 								<h4>Your bookings > <a>Upcoming events</a>  </h4>
		     		 </div>  
 <% 
 // 페이지 설정
	int pageNo = 1;
try {
	pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}

	int numInPage = 3;												// 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
		Conn=DriverManager.getConnection(url,db_user,db_passwd);
	stmt = Conn.createStatement();
	
		// users 테이블: user 수 페이지수 개산
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM  content as C, reserve as R, user as U where C.Id=R.content_id and R.sign='1' and C.user_id=U.Id and R.user_id='"+SESSION_USER_ID+"'  ORDER BY C.cratedat desc;" ); 
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		rs.close();
		stmt.close();
		
//SELECT
try{
	query = "SELECT C.Id as content_id,C.title,substr(C.cratedat,6,5) as cratedat,U.profile_img,U.nickname,R.Id as Id FROM content as C, reserve as R, user as U where C.Id=R.content_id and R.sign='1' and C.user_id=U.Id and R.user_id=? ORDER BY R.cratedat desc LIMIT " + startPos + ", " + numInPage;
	Conn=DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement(query);
	pstmt.setString(1,  SESSION_USER_ID);
	rs = pstmt.executeQuery();
		 while(rs.next()) {		 
	 	 title = rs.getString("title"); 
	 	 cratedat= rs.getString("cratedat"); 
	 	 profile_img=rs.getString("profile_img"); 
	 	 nickname=rs.getString("nickname"); 
	 	 content_id=rs.getString("content_id");
%>	
	 	<div class="span3">

        <a>
            <img src="Profile_img/<%=profile_img%>" class="profile_img_inbox"/>
        </a>
        <span class="meta">
          <a><%=nickname%></a>
          <br/>
          <span class="day fineprint-text">registration date :(<%=cratedat%>)</span>
        </span> 
    </div>
    <div class="span7">
				    	<div class="inbox-title-view">
				      <a href="<%=SearchContentLink%>?Id=<%=content_id %>&book=book">
					        <span class="grid_8 alpha message_preview">
					          
					          <span class="message-text">
					              <strong><%if(title.length()>30){out.print(title.substring(0,30)+"...");}else{out.print(title);}%></strong>
					          </span>
					        </span>
					        <span class="clear"></span>
				      </a>
				      
				    </div>
				    <br>
				    <span class="del-button">
				      <a href="#" class="btn btn-mini btn-danger" data-action="delete" data-id="<%=rs.getString("Id") %>" >Payment Cancel</a>
				      </span>
    </div>
    <div class="clear"></div>
    <hr/>
<%
		 }
}catch(Exception e){
		out.println(e);
}finally {
	// 무슨 일이 있어도 리소스를 제대로 종료
	if (rs != null) try{rs.close();} catch(SQLException e) {}
	if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
	if (Conn != null) try{Conn.close();} catch(SQLException e) {}
}
%>   
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
        	<li><a href="<%=BookLink%>&page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='"+BookLink+"&page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="<%=BookLink%>&page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
					</div>
</div>