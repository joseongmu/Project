<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../../../DBcon.jsp" %>
    <%@include file="../../../CommonT.jsp" %>
  <%
	int SESSION_ID=	Integer.parseInt((String)session.getAttribute("SESSION_USER_ID")); 

	request.setCharacterEncoding("UTF-8");
	content_id=request.getParameter("content_id");
	title = request.getParameter("title");
	description =  request.getParameter("description");
	category = request.getParameter("category");
	num_people= request.getParameter("num_people");
	duration=request.getParameter("duration");
	meetingpoint= request.getParameter("meetingpoint");
	meetingtime=  request.getParameter("meetingtime");
	price=request.getParameter("price");
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String strToday = sdf.format(new java.util.Date());
	String mode=request.getParameter("mode");
	
	

	 if (title == null || description == null || category == null || num_people == null || duration == null || meetingpoint == null || meetingtime == null || price==null) {
		  %>
		  	<script>history.back(); alert("폼 양식에 맞게 작성해주세요!")</script>
		 <%
		}else if(title.length()==0 || description.length()==0  || category.length()==0  || num_people.length()==0 || duration.length()==0  || meetingpoint.length()==0  || meetingtime.length()==0 || price.length()==0){
			%>
		  	<script>history.back(); alert("폼 양식에 맞게 작성해주세요!")</script>
		 <%
		}

if(mode.equals("basic")){
					try{
							query = "UPDATE content SET user_id=?, title=?, description=?, category=?, num_people=?, duration=?, meetingpoint=?,meetingtime=?,price=?,promote=?,cratedat=? WHERE Id=?";
							Conn=DriverManager.getConnection(url,db_user,db_passwd);
							pstmt = Conn.prepareStatement(query);
							pstmt.setInt(1,SESSION_ID);
							pstmt.setString(2,title);
							pstmt.setString(3,description);
							pstmt.setString(4,category);
							pstmt.setString(5,num_people);
							pstmt.setString(6,duration);
							pstmt.setString(7,meetingpoint);
							pstmt.setString(8,meetingtime);
							pstmt.setString(9,price);
							pstmt.setInt(10,1);
							pstmt.setString(11,strToday);
							pstmt.setString(12,content_id);
							//out.println(query); //쿼리문 확인
					  	pstmt.executeUpdate();
					}catch(Exception e){
							
					}finally {
							// 무슨 일이 있어도 리소스를 제대로 종료
							if (rs != null) try{rs.close();} catch(SQLException e) {}
							if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
							if (Conn != null) try{Conn.close();} catch(SQLException e) {}
					}
%>
					<script>
								location.replace("http://localhost:8080/gowith/Create_Organizing.jsp?next=photo");
					</script>

<%
}else{
	
	out.println("다른 처린단...."+mode);
}

%>	