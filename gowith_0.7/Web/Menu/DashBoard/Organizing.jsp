<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
    <div class="span11">
	 <h4>Manage ><a>All listings</a></h4>
		<div class="createbutton">
		<a class="btn btn-primary" href="Menu/DashBoard/Organizing/Create_Organizing.jsp"><i class="icon-ok icon-white"></i> Create new listing</a>
		</div>
		<div class="list-bar activities-manage  dd-parent top-15px-margin"> <div class="clear"></div></div>
				<ul class="manage-activity-list">
 <% 
SESSION_USER_ID="1";
try{
		query = "SELECT * From content WHERE user_id="+SESSION_USER_ID;
		Conn=DriverManager.getConnection(url,db_user,db_passwd);
		pstmt = Conn.prepareStatement(query);
		rs = pstmt.executeQuery();
while(rs.next()) {
	 	title = rs.getString("title"); 
%>	
        <li>
          <div class="span7 alpha">
            <div class="activity-icon">
               <a href="#">
                      <img src="img/no_photo_80.c9340e6.png" class="thumbnail" alt="" />       
               </a>
            </div>
            <h5 class="light-text">
              <a class="light-text " href="#"> <%out.println(title); %></a>
            </h5>
          </div>
          <div class="pull-right">   
              <a href="#" class="gidsy-button medium-button blue-button"><span class="edit-activity-icon white"></span> Listing View</a>          
          </div>
          <div class="clear"></div>
        </li>
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
        </ul>
 </div>
    
  	