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
	query = "SELECT * FROM content as C,user as U WHERE U.Id=C.user_id and C.promote=2 order by cratedat desc";
	Conn=DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement(query);
	rs = pstmt.executeQuery();
	int i=1;
  while(rs.next()) {
        user_id = rs.getString("user_id");
        title = rs.getString("title");    
        category = rs.getString("category");
        img1 = rs.getString("img1");
        profile_img= rs.getString("profile_img");
        price = rs.getString("price");
        content_id=rs.getString("C.Id");
       
%>		
        	<div class="lifted polaroid roid-item real num-<%=i++%>">
          <div class="lifted-content">
			             	<a href="<%=SearchContentLink%>?Id=<%=content_id %>">
			              <img src="image/<%if(img1==null || img1.length()==0){ out.print("no_image.jpg");}else{out.print(img1);}%>" width="280" height="208" alt="view_img" class="view_img"/>
			             	</a>
			             	
			            	<a >
			              <img src="Profile_img/<%=profile_img%>" width="60" height="60" class="avatar-display" />
			            	</a>
            	
          <div class="meta">
		               	<div class="clearfix">
				                  <h5 class="title">
				                  <a href="<%=SearchContentLink%>?Id=<%=content_id %>"><%if(title.length()>24){ out.print(title.substring(0,24)+"...");}else{out.print(title);}%></a>
				                  </h5>
													<span class="img-favorite">
													     <span class="favorite-activity-icon"></span>
													 </span>
		               	</div>
			                
			             	<div>
				                  <span class="location-text">
				                  <span class="location"></span>
				                  <a><%=category %></a>
				                  </span>
				                  <span class="price"><%=price%>원</span>
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

				