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
			location = 'Menu/DashBoard/BookDel.jsp?id=' + $(this).attr('data-id');
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
try{
	query = "SELECT C.title,substr(C.cratedat,6,5) as cratedat,U.profile_img,U.nickname,R.Id as Id FROM content as C, reserve as R, user as U where C.Id=R.content_id and R.sign='1' and C.user_id=U.Id and R.user_id=? ORDER BY C.cratedat;";
	Conn=DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement(query);
	pstmt.setString(1,  SESSION_USER_ID);
	rs = pstmt.executeQuery();
		 while(rs.next()) {		 
	 	 title = rs.getString("title"); 
	 	 cratedat= rs.getString("cratedat"); 
	 	 profile_img=rs.getString("profile_img"); 
	 	 nickname=rs.getString("nickname"); 
%>	
	 	<div class="span3">

        <a href="#">
            <img src="Profile_img/<%=profile_img%>" class="profile_img_inbox"/>
        </a>
        <span class="meta">
          <a href="#"><%=nickname%></a>
          <br/>
          <span class="day fineprint-text">registration date :(<%=cratedat%>)</span>
        </span> 
    </div>
    <div class="span7">
				    	<div class="inbox-title-view">
				      <a href="#">
					        <span class="grid_8 alpha message_preview">
					          
					          <span class="message-text">
					              <strong><%=title%></strong>
					          </span>
					        </span>
					        <span class="clear"></span>
				      </a>
				      <span class="del-button">
				      <a href="#" class="btn btn-mini btn-danger" data-action="delete" data-id="<%=rs.getString("Id") %>" >Payment Cancel</a>
				      </span>
				    </div>
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
					</div>
</div>