<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="../../CommonT.jsp" %>
   <%@include file="../../DBcon.jsp" %>
   
   
<div id="search-bar-bg"></div>
<div id="body" class="container_12">
	<form action="#" method="POST" accept-charset="utf-8" class="uniForm" id="search-form">
  <div id="search-bar">
		<label for="id_location" class="inline search-location-inline-label">WHERE are you going?</label>
		
		<input type="text" name="location" value="" id="id_location">
    <button class="gidsy-button green-button left" loadingText="Search" id="search-submit">Search</button>
    
    <ul class="display-option search-display">
      <li class="list-view selected" title="list-view"><span class="icon-list-grey"></span>List</li>
    </ul>
  </div>
  
	<div class="grid_8">
		<div class="grid_4 search-filters alpha omega" id="search-filters"></div><div class="clear"></div>
      <div class="grid_8 alpha omega">
        <span id="loading-compass"><img src="img/loading-compass.gif" /></span>
        <div class="content-box list-view search-results" id="search-results">
				<div class="box-header">
  				<h3 class="activity-list-header">
<%
	request.setCharacterEncoding("utf-8");
  location=request.getParameter("location");
  if(location==null || location==""){
	  location="";
  }
			String start=request.getParameter("start");
			String end=request.getParameter("end");
			category=request.getParameter("category");
			String keyword=request.getParameter("keyword");
// 페이지 설정
int pageNo = 1;
try {
	pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}

	int numInPage = 5;												// 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;

	if(start=="" && end=="" &&  location=="" && keyword==""){
		query="SELECT count(*) as title_num FROM content WHERE category='"+category+"'";
		query2="SELECT * FROM content WHERE category='"+category+"'and promote='2' order by cratedat desc LIMIT " + startPos + ", " + numInPage;
	}else if(start=="" && end=="" && category==null &&  location==""){
		query="SELECT count(*) as title_num FROM content WHERE title like '%"+keyword+"%'";
		query2="SELECT * FROM content WHERE title like'%"+keyword+"%' and promote='2' order by cratedat desc  LIMIT " + startPos + ", " + numInPage;
	}else if(category==null &&  location=="" && keyword==""){
		query="SELECT count(*) as title_num FROM content WHERE start between '"+start+"'  and '"+end+"'";
		query2="SELECT * FROM content WHERE start between '"+start+"'  and '"+end+"' and promote='2' order by cratedat desc LIMIT " + startPos + ", " + numInPage;
	}else{
		if(location==null){
			location="";
		}
		query="SELECT count(*) as title_num FROM content WHERE promote='2' and category like '%"+location +"%'";
		query2="SELECT * FROM content WHERE category like '%"+location +"%' and promote='2' order by cratedat desc LIMIT " + startPos + ", " + numInPage;
	}

		Conn=DriverManager.getConnection(url,db_user,db_passwd);
		stmt = Conn.createStatement();
		// users 테이블: user 수 페이지수 개산
 		rs = stmt.executeQuery(query); 
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		rs.close();
		stmt.close();
		
		//SELECT

	try{
		Conn = DriverManager.getConnection(url,db_user,db_passwd);
		stmt = Conn.createStatement();
		rs = stmt.executeQuery(query);
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
		rs = stmt.executeQuery(query2);
		while(rs.next()){
					content_id=rs.getString("Id");
					user_id= rs.getString("user_id");
					title = rs.getString("title");
					description = rs.getString("description");
					category = rs.getString("category");
					num_people = rs.getString("num_people");
					duration = rs.getString("duration");
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
						   	<div class="activity-list-calendar" id="" style="display:none">
						     	<div class="legend"><div class="available"></div></div>
						   	</div>
							</div>
						 	<span class="img-favorite">
						 	  <a href="#" data-objid="" data-ctid="" inactive="Add to favorites" active="Remove from favorites"
						    title="" login-reason="to favorite activities" class="favorite tipsy-item "><span class="favorite-activity-icon"></span>
						    </a>
					  	</span>
		    		</div>
		    			
		    		<div class="activity-image">
			     		<a href="<%=SearchContentLink%>?Id=<%=content_id %>" class="activity_result_link">
				        <img class="small" src="image/<%if(img1==null || img1.length()==0){ out.print("no_image.jpg");}else{out.print(img1);}%>" width="140" height="10" />
					    </a>
		    		</div>
		    			
						<div class="avatar">

		      			<img src="Profile_img/<%=profile_img%>" alt="BELFASTMURALTOURS" width="60" height="60" class="avatar-display" />

						</div>
						
						<div class="activity-meta">
							<h5><a href="<%=SearchContentLink%>?Id=<%=content_id %>" class="activity_result_link"><%if(title.length()>20){out.print(title.substring(0,20)+"...");}else{out.print(title);}%></a></h5>
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
		  				<%
		  				String str=" "+description;
		  				if(str.length()>50){out.print(str.substring(0,50)+"...");}else{out.print(str);}  				
		  				%>
		  			
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
        	<li><a href="<%=SearchLink%>?page=<%= pageNo - 1%>&location=<%=request.getParameter("location")%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='"+SearchLink+"?page=" + i +"'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="<%=SearchLink%>?page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
    	</div>
    	<div class="grid_4">
					    	<div class="uniForm general-form">
					  		<ul class="search-filters-list">
												<li id="filter-dates" class="open">
												      <div class="filter-toggle">
												        
												        <label><span class="icon-filter filter-dates"></span> Your available dates</label>
												      </div>
												      
												      <div class="filter-data data-dates">
															<input type="text" name="start"  id="id_start" class="datePicker">
														  <span id="separator">＆</span>
															<input type="text" name="end"  id="id_end" class="datePicker">
															<input type="submit" class="btn btn-primary"  value="@Search">
															 </div>
														
													</li>
													<br/><hr><br/>
														<li id="filter-duration">
														     <div class="filter-toggle">
														        <label><span class="icon-filter filter-keywords"></span> Keywords</label>
														      </div>							
														      <div class="filter-data">
																	        <div class="keyword-input">
																	    		<input type="text" name="keyword" id="id_keywords">
																	   		 <button type="submit" class="keyword-submit" loadingText=""></button>
																	</div>
																	</div>
																	
														</li>
														<br/><hr><br/>
														<li id="filter-categories" class="open">
														<div class="filter-toggle">			 
																  <label><span class="icon-filter filter-group"></span> location</label>
														</div>
														<div class="filter-data check-list">
														<%int i=0;
																while(i<8){%>
														  <div >
														    <label for="id_category_<%=i%>_sidebar">
														    <input type="radio" id="id_category_<%=i %>_sidebar" name="category" value="<%=areas[i]%>">
														     		<%=areas[i]%>
														      <span class="filter-count"><%=i+1 %></span>
														     </label>
														  </div>	
														  <%
														  i++;} %>	
														
														 </div>	  
														   <input type="submit" class="btn btn-primary"  value="@Search">
														  </from>
													</li>
									</ul>
									</div>  	
    	</div>
    	<div class="clear"></div>

	</div>
<div style="clear: both;"></div>
<script type="text/javascript">
/* 달력(datepicker) */
$(function() {
// $.datepicker.setDefaults($.datepicker.regional["ko"]);
    $(".datePicker").datepicker({ 
     dateFormat: 'yy-mm-dd',
     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
     dayNamesMin: ['일','월','화','수','목','금','토'],
     weekHeader: 'Wk',
     changeMonth: true, //월변경가능
     changeYear: true, //년변경가능
     yearRange:'2012:+0', // 연도 셀렉트 박스 범위(현재와 같으면 1988~현재년)
     showMonthAfterYear: true, //년 뒤에 월 표시
     buttonImageOnly: false, //이미지표시  
     buttonText: '날짜를 선택하세요', 
     autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)     
  });
 });

</script>
