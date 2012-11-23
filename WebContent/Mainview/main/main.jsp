<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
   	<%@include file="search.jsp" %>
		
		
		<div id="homepage-activities">
			  <div id="gidsy-roids-nav"><!--화살표 -->
				     <div id="next"></div>
				     <div id="prev"></div>
		  	</div>
		  	<div id="gidsy-roids-holder">
		     	<div id="gidsy-roids" class="clearfix">
		      		<div class="pre-clone"></div>
	<% 
try{
	String query = "SELECT user_id,title,category,img1,price FROM content order by cratedat desc";
	Conn=DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement(query);
	rs = pstmt.executeQuery();
while(rs.next()) {
        user_id = rs.getString("user_id");
        title = rs.getString("title");    
        category = rs.getString("category");
        img1 = rs.getString("img1");
        price = rs.getString("price");
%>		
        	<div class="lifted polaroid roid-item real num-1">
          <div class="lifted-content">
			             	<a href="클릭시 활동 내용이 보는 view">
			              <img src="image/<%out.println(img1); %>" width="280" height="208" alt="" />
			             	</a>
			             	
			            	<a href="클릭시 활동 내용 올린 사용자를 보는 view">
			              <img src="image/<%out.println(img1); %>" width="60" height="60" class="avatar-display" />
			            	</a>
            	
          <div class="meta">
		               	<div class="clearfix">
				                  <h5 class="title">
				                  <a href="클릭시 활동 내용이 보는 view"><%out.println(title); %></a>
				                  </h5>
													<span class="img-favorite">
													     <span class="favorite-activity-icon"></span>
													 </span>
		               	</div>
			                
			             	<div>
				                  <span class="location-text">
				                  <span class="location"></span>
				                  <a><%out.println(category); %></a>
				                  </span>
				                  <span class="price"><%out.println(price); %></span>
		                </div>
		       </div>
		              <span class="clear"></span>
		      </div>
          </div>
          <div class="lifted polaroid roid-item real num-2">
          <div class="lifted-content">
			             	<a href="클릭시 활동 내용이 보는 view">
			              <img src="image/<%out.println(img1); %>" width="280" height="208" alt="" />
			             	</a>
			             	
			            	<a href="클릭시 활동 내용 올린 사용자를 보는 view">
			              <img src="image/<%out.println(img1); %>" width="60" height="60" class="avatar-display" />
			            	</a>
            	
          <div class="meta">
		               	<div class="clearfix">
				                  <h5 class="title">
				                  <a href="클릭시 활동 내용이 보는 view"><%out.println(title); %></a>
				                  </h5>
													<span class="img-favorite">
													     <span class="favorite-activity-icon"></span>
													 </span>
		               	</div>
			                
			             	<div>
				                  <span class="location-text">
				                  <span class="location"></span>
				                  <a><%out.println(category); %></a>
				                  </span>
				                  <span class="price"><%out.println(price); %></span>
		                </div>
		       </div>
		              <span class="clear"></span>
		      </div>
          </div>
          <div class="lifted polaroid roid-item real num-3">
          <div class="lifted-content">
			             	<a href="클릭시 활동 내용이 보는 view">
			              <img src="image/<%out.println(img1); %>" width="280" height="208" alt="" />
			             	</a>
			             	
			            	<a href="클릭시 활동 내용 올린 사용자를 보는 view">
			              <img src="image/<%out.println(img1); %>" width="60" height="60" class="avatar-display" />
			            	</a>
            	
          <div class="meta">
		               	<div class="clearfix">
				                  <h5 class="title">
				                  <a href="클릭시 활동 내용이 보는 view"><%out.println(title); %></a>
				                  </h5>
													<span class="img-favorite">
													     <span class="favorite-activity-icon"></span>
													 </span>
		               	</div>
			                
			             	<div>
				                  <span class="location-text">
				                  <span class="location"></span>
				                  <a><%out.println(category); %></a>
				                  </span>
				                  <span class="price"><%out.println(price); %></span>
		                </div>
		       </div>
		              <span class="clear"></span>
		      </div>
          </div>
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
 </div> 

				