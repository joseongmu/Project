<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
<%
SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID"); 
%>  
  <div class="span11">
  		<div class="content-box list-view">
  		 			<div class="box-header">
	 									<h4>Inbox >  <a>All message</a></h4>
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
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM  content as C, reserve as R, user as U where C.Id=R.content_id and C.user_id=U.Id and R.user_id='"+SESSION_USER_ID+"'  ORDER BY C.cratedat desc;" ); 
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		rs.close();
		stmt.close();
		
//SELECT
try{
	query = "SELECT C.Id as content_id,R.inbox2 as inbox2,R.inbox as inbox, C.title,substr(R.cratedat,6,5) as cratedat,U.profile_img,U.nickname,R.Id as Id FROM content as C, reserve as R, user as U where C.Id=R.content_id and C.user_id=U.Id and R.user_id=? and R.sign=2  ORDER BY R.cratedat desc LIMIT " + startPos + ", " + numInPage;
	Conn=DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement(query);
	pstmt.setString(1,  SESSION_USER_ID);
	rs = pstmt.executeQuery();
	//out.print(query);
	int i=0;
while(rs.next()) {
	 	 user_id = rs.getString("Id");
	 	 title = rs.getString("title"); 
	 	 cratedat= rs.getString("cratedat"); 
     nickname = rs.getString("nickname"); 
     profile_img = rs.getString("profile_img"); 
     String message=rs.getString("inbox");
     String reply=rs.getString("inbox2");
	   content_id=rs.getString("content_id");
%>	
	 	<div class="span3">
	
        <a>
            <img src="Profile_img/<%=profile_img %>" class="profile_img_inbox"/>
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
					        <span class="span7 alpha message_preview">
					          
					          <span class="message-text">
					              <strong><%if(title.length()>30){out.print(title.substring(0,30)+"...");}else{out.print(title);}%></strong>
					          </span>
					          
					        </span>
					        <span class="clear"></span>
				      </a>
				      <br>
				      <span class="del-button">
				      <%if(message==null || message.length()==0) {%>
				      <a href="#" class="btn btn-primary btn-small" id="dialog-link-<%=i%>"  data-id="<%=rs.getString("Id") %>"><i class="icon-envelope icon-white"></i> Mailing</a>
				      <%}else{%>
				       <a href="#" class="btn btn-info btn-small" ><i class="icon-envelope icon-white"></i> Mail Sent</a>
				      <%} %>
				      <a href="#" class="btn btn-success btn-small" data-action="account" data-id="<%=content_id%>" >Account</a>
				      <a href="#" class="btn btn-danger btn-small" data-action="delete2" data-id="<%=rs.getString("Id") %>" >Cancel</a>
				      </span>
				      <%if(reply==null){ %>
				      <span></span>
				      <%}else{ %>
				      <a href="#" class="btn btn-warning btn-small"   id="reple-link-<%=i%>" data-id="<%=reply%>"><i class="icon-envelope icon-white"></i> Reply</a>
				      <%} %>
				    </div>
    </div>
    <div class="clear"></div>
    <hr/>
    <script>
			$( "#dialog-link-<%=i%>" ).click(function( event ) {
				$( "#dialog" ).dialog( "open" );
				event.preventDefault();
				$("#reserve_id").val($(this).attr('data-id'));
				});
			
			$( "#reple-link-<%=i%>" ).click(function( event ) {
				$( "#reple" ).dialog( "open" );
				event.preventDefault();
				$("#reple-message").val($(this).attr('data-id'));
				});
    </script>
    
<%
				i++;
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
        	<li><a href="<%=MailingLink%>&page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='"+MailingLink+"&page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="<%=MailingLink%>&page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
</div>
						<div id="dialog">
						<div class="span4 well">
						    <form accept-charset="UTF-8" method="POST" action="Menu/DashBoard/mail_register.jsp">
						        <textarea class="span4" id="new_message" name="new_message"
						        placeholder="Type in your message" rows="5"></textarea>
						        <input type="hidden" name="reserve_id" id="reserve_id"/>
						        <h6 class="pull-right">320 characters remaining</h6>
						        <div class="mailing-button">
						        <a href="#"><button class="btn btn-primary" type="submit">Post</button></a>
						        <a href="#"><button class="btn btn-danger" id="dialog-close">Cancel</button></a>
						        </div>
						    </form>
						</div>
						</div>
						
						<div id="reple">
						<div class="span4 well">    
						        <textarea class="span4" id="reple-message" name="reple-message"
						        rows="5"></textarea>
						        <div class="mailing-button">
						        <a href="#"><button class="btn btn-danger" id="reple-close">Cancel</button></a>
						        </div>
						</div>
						</div>
</div>
 
 
 <script>
	$( "#dialog" ).dialog({
		autoOpen: false,
		width: 400,
		modal:true,
	});

	// Link to open the dialog
	
	$( "#dialog-close" ).click(function( event ) {
		$( "#dialog" ).dialog( "close" );
		event.preventDefault();
	});
	
	$( "#reple" ).dialog({
		autoOpen: false,
		width: 400,
		modal:true,
	});

	// Link to open the dialog
	
	$( "#reple-close" ).click(function( event ) {
		$( "#reple" ).dialog( "close" );
		event.preventDefault();
	});
</script>
