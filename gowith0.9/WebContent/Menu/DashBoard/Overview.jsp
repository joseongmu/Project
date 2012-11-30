<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>
   <%
		SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");
		SESSION_Email=	(String)session.getAttribute("SESSION_Email");
		SESSION_Name=(String)session.getAttribute("SESSION_Name");
		SESSION_PF_IMG=(String)session.getAttribute("SESSION_PF_IMG");
		SESSION_INTRODUCE=(String)session.getAttribute("SESSION_INTRODUCE");
		SESSION_AUTH=(String)session.getAttribute("SESSION_AUTH");
		
		if(SESSION_Name==null || SESSION_USER_ID==null){
		%>
			<script>location.href="<%=HomeLink%>"; alert("로그인이 필요합니다.");</script>
		<%
		}else{
   %>
 
<div class="span11">
							<div class="span7">
												<div class="content-box overview-section" id="dashboard-messages-box">
														    <div class="box-header">
														      <h3 class="activity-list-header">
														        <span class="favorite-med"></span>
														           Wow! <%if(SESSION_Name.length()>9){ out.print(SESSION_Name.substring(0,8)+"...");}else{out.print(SESSION_Name);}%>님 환영합니다.
														      </h3>
														    </div>
												</div>
												<!-- 메일링 최신 리스트 -->
												<div class="content-box list-view">
																				<div class="box-header">
																						 <a href="<%=OrganizingLink %>" class="info-link">View organizing</a>
																				    <h3><a href="#" class="light-text">
																				      <span class="envelope-med-green"></span> Recent Message</a>
																				    </h3>
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
																			 		rs = stmt.executeQuery("SELECT COUNT(*) FROM  content as C, reserve as R, user as U where C.Id=R.content_id and C.user_id='"+SESSION_USER_ID+"'and R.booking=1 and R.user_id=U.Id ORDER BY R.cratedat desc" ); 
																					rs.next();
																					numItems = rs.getInt(1);
																					numPages = (int) Math.ceil((double)numItems / (double)numInPage);
																					rs.close();
																					stmt.close();
																		    	//SELECT
																					try{
																					  query = "SELECT U.nickname as mail_sent ,C.title as title,R.inbox as inbox,R.cratedat as cratedat,R.Id as Id FROM  content as C, reserve as R, user as U where C.Id=R.content_id and C.user_id=? and R.booking=1 and R.user_id=U.Id ORDER BY R.cratedat desc LIMIT " + startPos + ", " + numInPage;
																						pstmt = Conn.prepareStatement(query);
																						pstmt.setString(1,  SESSION_USER_ID);
																						rs = pstmt.executeQuery();
																						//out.print(query);
																						int i=0;
																						while(rs.next()) {
																							 String mail_sent=rs.getString("mail_sent");
																							 title=rs.getString("title");
																						 	 reserve_id = rs.getString("Id");
																						 	 new_message=rs.getString("inbox");
																						 	 cratedat=rs.getString("cratedat");
																						 		
																					%>	
																				
																	
																	    <h6>[My Organizing]  "<%if(title.length()>20){out.print(title.substring(0,20)+"...");}else{out.print(title);}%>"</h6>
																	    <p><%=new_message%></p>
																	    <div>
																	        <span class="badge badge-success">Posted <%= cratedat %></span><div class="pull-right"><span class="label">보낸이></span> <span class="label"><%=mail_sent%>님</span> <a href="#"><span class="label" id="dialog2-link-<%=i%>"  data-id="<%=reserve_id%>"><i class="icon-envelope icon-white"></i> 답장</span></a> </div>
																	    </div> 
																	    <hr>
																	        <script>
																					$( "#dialog2-link-<%=i%>" ).click(function( event ) {
																						$( "#dialog2" ).dialog( "open" );
																						event.preventDefault();
																						$("#reserve_id2").val($(this).attr('data-id'));
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
											 </div>
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
        	<li><a href="<%=DashBoardLink%>?page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='"+DashBoardLink+"?page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="<%=DashBoardLink%>?page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
					    </div>

					    
						<div id="dialog2">
						<div class="span4 well">
						    <form accept-charset="UTF-8" method="POST" action="Menu/DashBoard/reply_register.jsp">
						        <textarea class="span4" id="new_message" name="new_message"
						        placeholder="Type in your message" rows="5"></textarea>
						        <input type="hidden" name="reserve_id2" id="reserve_id2"/>
						        <h6 class="pull-right">320 characters remaining</h6>
						        <div class="mailing-button">
						        <a href="#"><button class="btn btn-primary" type="submit">Post</button></a>
						        <a href="#"><button class="btn btn-danger" id="dialog2-close">Cancel</button></a>
						        </div>
						    </form>
						</div>
						</div>	    
	
	<script>
	$( "#dialog2" ).dialog({
		autoOpen: false,
		width: 400,
		modal:true,
	});

	// Link to open the dialog
	
	$( "#dialog2-close" ).click(function( event ) {
		$( "#dialog2" ).dialog( "close" );
		event.preventDefault();
	});
</script>
					    
					    
					    
					    
					    <div class="span3 pull-right">
					    <div class="sidebar-section blue-bg">
					        <div class="border-avatar">
					          <img src="Profile_img/<%=SESSION_PF_IMG%>" alt="profile_img" id="profile_img" class="avatar-display" />
					        </div>
					        <h5><%if(SESSION_Name.length()>9){ out.print(SESSION_Name.substring(0,8)+"...");}else{out.print(SESSION_Name);}%></h5>
					        <div class="profile-links">
					          
					            <span class="profile-icon"></span>View profile
					         
					          <a href="<%=ProfileLink%>" class="edit-profile">
					            <span class="edit-icon"></span>Edit
					          </a>
					        </div>
					        <div class="clear"></div>
					      </div>
					      <div class="sidebar-section no-bg">
					        
					          <h6>Quick links</h6>
					          <ul class="sidebar-list help-links">
					            <li>
					              <a href="<%=OrganizingLink%>">
					                <span class="activity-small-darkblue icon-link"></span>Manage Listings
					              </a>
					            </li>
					            <li>
					              <a href="<%=ProfileLink%>">
					                <span class="info-icon icon-link"></span>My Profile info
					              </a>
					            </li>
					            <li>
					              <a href="<%=BookLink%>">
					                <span class="bookings-icon icon-link"></span>Incoming bookings
					              </a>
					            </li>
					          </ul>
					        
					        <h6>Community</h6>
					        <ul class="sidebar-list help-links">
					          <li>
					            <a href="<%=HelpCenterLink %>" target="_blank">
					              <span class="help-center icon-link"></span>Help center
					            </a>
					          </li>
					        </ul>
					      </div>
					      </div>
</div>
<%}%>