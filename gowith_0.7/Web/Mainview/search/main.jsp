<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="../../CommonT.jsp" %>
   <%@include file="../../DBcon.jsp" %>
   
   
<div id="search-bar-bg"></div>
<div id="body" class="container_12">
	<form action="#" method="POST" accept-charset="utf-8" class="uniForm" id="search-form">
  <div id="search-bar">
		<label for="id_location" class="inline search-location-inline-label">Where are you going?</label>
		
		<input type="text" name="location" value="" id="id_location">
    <button class="gidsy-button green-button left" loadingText="Search" id="search-submit">Search</button>
    
    <ul class="display-option search-display">
      <li class="list-view selected" title="list-view"><span class="icon-list-grey"></span>List</li>
      <li class="grid-view" title="grid-view"><span class="icon-grid-grey"></span>Photo</li>
    </ul>
  </div>
	<div class="grid_12">
		<div class="grid_4 search-filters alpha omega" id="search-filters"></div><div class="clear"></div>
      <div class="grid_9 alpha omega">
        <span id="loading-compass"><img src="https://d3pvklq8xnxxh2.cloudfront.net/img/search/loading-compass.66ffae1.gif" /></span>
        <div class="content-box list-view search-results" id="search-results">
				<div class="box-header">
  				<h3 class="activity-list-header">
<%
	request.setCharacterEncoding("utf-8");
	try{
		Conn = DriverManager.getConnection(url,db_user,db_passwd);
		stmt = Conn.createStatement();
		rs = stmt.executeQuery("SELECT count(title) as title_num FROM content where title like '%"+request.getParameter("location") +"%' or category like '%"+request.getParameter("location") +"%'");
		while(rs.next()){
			title_num = rs.getInt("title_num");
		 }
	}	catch (SQLException e){
		errorMsg = "SQL 에러:" + e.getMessage();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
		if(Conn != null) try{Conn.close();}catch(SQLException e){}
	}
%>
	    			<span class="compass-med" id="search-compass"></span><%=title_num%> results
				  </h3>
				</div>
				<ul>	<li class="msg success"><span class="location green"></span>원하시는 결과를 찾으셧나요?</li></ul>
				<ul id="search-result-list" class="city-list activity-list search-activity-list">
<%if(title_num==0){
%>
		          	<ul class="messages" id="site-messages">
			      					<li class="errorMsg">
										  <div class="message-wrapper3">
										    <div class="message-text">검색된 결과가 없습니다. 다시한번 검색해 주세요! </div>
										  </div>
											</li>
								</ul>
<%
			}
			
		
	request.setCharacterEncoding("utf-8");
	try{
		Conn = DriverManager.getConnection(url,db_user,db_passwd);
		stmt = Conn.createStatement();
		query="SELECT user_id,substr(description,1,150) as description,title,category,num_people,duration,price,img1 FROM content where title like '%"+request.getParameter("location") +"%' or category like '%"+request.getParameter("location") +"%' order by cratedat desc";
		rs = stmt.executeQuery(query);
		//out.print(query);
		while(rs.next()){
					user_id= rs.getString("user_id");
					title = rs.getString("title");
					description = rs.getString("description");
					category = rs.getString("category");
					num_people = rs.getInt("num_people");
					duration = rs.getInt("duration");
					price = rs.getString("price");
					img1 = rs.getString("img1");
					pstmt = Conn.prepareStatement("SELECT * FROM user WHERE Id=?");
					pstmt.setString(1, user_id);
					rs2 = pstmt.executeQuery();
					
					if(rs2.next()){	profile_img = rs2.getString("profile_img");}
					%>
					 <li id="activity" class="activity box-section odd">
					 	<div class="activity-options">
							<div class="activity-event-option">
						 		<a href="#" id="popupLink-12421" class="activity-event-cal"><span class="calendar-select-icon"></span></a>
						   	<div class="activity-list-calendar" id="popupCal-12421" style="display:none">
						     	<div class="legend"><div class="available"></div> = Scheduled events</div>
						   	</div>
							</div>
						 	<span class="img-favorite">
						 	  <a href="/signup/" data-objid="12397" data-ctid="58" inactive="Add to favorites" active="Remove from favorites"
						    title="Add to favorites" login-reason="to favorite activities" class="favorite tipsy-item "><span class="favorite-activity-icon"></span>
						    </a>
					  	</span>
		    		</div>
		    			
		    		<div class="activity-image">
			     		<a href="SearchContentView.jsp" class="activity_result_link">
				        <img class="small" src="image/<%=img1%>" width="140" height="10" />
					    </a>
		    		</div>
		    			
						<div class="avatar">
							<a href="/BELFASTMURALTOURS/">
		      			<img src="Profile_img/<%=profile_img%>" alt="BELFASTMURALTOURS" width="60" height="60" class="avatar-display" />
		    			</a>
						</div>
						
						<div class="activity-meta">
							<h5><a href="#" class="activity_result_link"><%=title%></a></h5>
		  				<ul class="activity-stats">
		    				<li class="activity-location">
		       				<span class="location"></span><span><strong><%=category%></strong></span>
		    				</li>
		    				<li>
						       <span class="people"></span>
						       <span><%=num_people%> people</span>
						    </li>
		    				<li class="">
		       				<span class='duration-icon clock-2 hours'></span> <span><%=duration%> hours</span>
		    				</li>
		    				<li class=""></li>
		  				</ul>
						</div>
						<div class="activity-content">
		  				<%=description+"..."%>
						</div>
						<span class="price"><%=price%>원</span>
						<div class="clear"></div>
					</li>				
					<%		
		}
	}catch (SQLException e){
		errorMsg = "SQL 에러:" + e.getMessage();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
		if(Conn != null) try{Conn.close();}catch(SQLException e){}
	}
%>
					</ul>
    		</div>
      	</div>
    	</div>
    	<div class="clear"></div>
  	</form>
	</div>
<div style="clear: both;"></div>
