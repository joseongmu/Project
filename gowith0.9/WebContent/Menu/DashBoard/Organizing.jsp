<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
    <div class="span11">
	 <h4>Manage ><a>All listings</a></h4>
		<div class="createbutton">
		<a class="btn btn-primary" href="<%=CreateOrganLink%>"><i class="icon-ok icon-white"></i> Create new listing</a>
		</div>
		<div class="list-bar activities-manage  dd-parent top-15px-margin"> <div class="clear"></div></div>
				<ul class="manage-activity-list">
 <% 
 SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");
 // 페이지 설정
	int pageNo = 1;
try {
	pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}

	int numInPage = 4;												// 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;
		Conn=DriverManager.getConnection(url,db_user,db_passwd);
	stmt = Conn.createStatement();
	
		// users 테이블: user 수 페이지수 개산
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM  content WHERE user_id='"+SESSION_USER_ID+"'" ); 
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		rs.close();
		stmt.close();
		
//SELECT
try{
		query = "SELECT * From content WHERE user_id='"+SESSION_USER_ID+" 'ORDER BY cratedat desc LIMIT " + startPos + ", " + numInPage;
		Conn=DriverManager.getConnection(url,db_user,db_passwd);
		pstmt = Conn.prepareStatement(query);
		rs = pstmt.executeQuery();
while(rs.next()) {
	 	title = rs.getString("title");
	 	content_id= rs.getString("Id");
	 	img1=rs.getString("img1");
	 	int appoval=rs.getInt("promote");
%>	
        <li>
          <div class="span7 alpha">
          <span class="span2">
            <div class="activity-icon">
               <a href="#">
                      <img src="image/<%if(img1==null || img1.length()==0){ out.print("no_image.jpg");}else{out.print(img1);}%>" class="thumbnail" alt="" />       
               </a>
            </div>
          </span>
             <span class="organizing_text">
								<a href="<%=SearchContentLink%>?Id=<%=content_id %>&book=book"> 
								<%if(title.length()>30){out.print(title.substring(0,30)+"...");}else{out.print(title);}%></a>
					   </span>
          </div>
          <div class="pull-right">   
          		<%if(appoval==2){%>
          		<a class="gidsy-button medium-button green-button"><i class="icon-star icon-white"></i></span>Approval</a>
              <%} %>
              <a href="<%=CreateOrganLink%>?next=modi&Id=<%=content_id%>" class="gidsy-button medium-button blue-button"><span class="edit-activity-icon white"></span> Edit</a>          
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
        	<li><a href="<%=OrganizingLink%>&page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='"+OrganizingLink+"&page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="<%=OrganizingLink%>&page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
 </div>
    
  	