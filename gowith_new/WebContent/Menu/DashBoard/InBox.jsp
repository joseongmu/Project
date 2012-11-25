<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
  
  <div class="span11">
  		<div class="content-box list-view">
  		 			<div class="box-header">
	 									<h4>Inbox >  <a>All message</a></h4>
		     		 </div>  
 <% 
try{
	query = "SELECT C.profile_img,C.Id,C.nickname,A.title,substr(A.cratedat,6,6) as cratedat FROM content as A, reserve as B, user as C where A.Id=B.content_id and C.Id=B.user_id and B.inbox_check='1' ORDER BY A.cratedat;";
	Conn=DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	//out.print(query);
while(rs.next()) {
	 	 user_id = rs.getString("Id");
	 	 title = rs.getString("title"); 
	 	 cratedat= rs.getString("cratedat"); 
     nickname = rs.getString("nickname"); 
     profile_img = rs.getString("profile_img"); 
%>	
	 	<div class="span3">
	
        <a href="#">
            <img src="Profile_img/<%=profile_img %>" class="profile_img_inbox"/>
        </a>
        <span class="meta">
          <a href="/exhalerelax/"><%=nickname%>.</a>
          <br/>
          <span class="day fineprint-text">registration date :(<%out.println(cratedat);%>)</span>
        </span> 
    </div>
    <div class="grid_9 alpha omega message_link">
      <a href="#">
	        <span class="grid_8 alpha message_preview">
	          
	          <span class="message_text">
	              <strong><%out.println(title); %></strong>  ++글씨 길이 조정 css깨짐
	          </span>
	        </span>
	        <span class="clear"></span>
      </a>
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