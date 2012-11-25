<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../../../DBcon.jsp" %>
    <%@include file="../../../CommonT.jsp" %>
    
 <% 
	request.setCharacterEncoding("UTF-8");
 	userid = request.getParameter("user_id");//나중에 세션 설정후 바꿀 내용
	title = new String(request.getParameter("title").getBytes("8859_1"),"UTF-8");
	description =  new String(request.getParameter("description").getBytes("8859_1"),"UTF-8");
	category = new String(request.getParameter("category").getBytes("8859_1"),"UTF-8");
	num_people=Integer.parseInt( new String(request.getParameter("num_people").getBytes("8859_1"),"UTF-8"));
	duration=Integer.parseInt( new String(request.getParameter("duration").getBytes("8859_1"),"UTF-8"));
	meetingpoint= new String(request.getParameter("meetingpoint").getBytes("8859_1"),"UTF-8");
	meetingtime= Integer.parseInt( new String(request.getParameter("meetingtime").getBytes("8859_1"),"UTF-8"));
	String mode=request.getParameter("mode");

	//out.print(title);
/*	if(title==null || description==null || category==null || num_people==0 || duration==0 ||  ){
		
	}*/
if(mode.equals("basic")){
					try{
							String query = "INSERT INTO content(user_id, title, description, category, num_people, duration, meetingpoint,meetingtime) VALUES(?, ?, ?, ?, ?, ?, ?,?) ";
							Conn=DriverManager.getConnection(url,db_user,db_passwd);
							pstmt = Conn.prepareStatement(query);
							pstmt.setString(1,userid);
							pstmt.setString(2,title);
							pstmt.setString(3,description);
							pstmt.setString(4,category);
							pstmt.setInt(5,num_people);
							pstmt.setInt(6,duration);
							pstmt.setString(7,meetingpoint);
							pstmt.setInt(8,meetingtime);
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
								location.replace("http://localhost:8080/gowith/Menu/DashBoard/Organizing/Create_Organizing.jsp?next=photo");
					</script>

<%
}else{
	
	out.println("다른 처린단...."+mode);
}

%>	