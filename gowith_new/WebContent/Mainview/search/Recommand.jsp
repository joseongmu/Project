<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../CommonT.jsp" %>
<%@include file="../../DBcon.jsp" %>

<%
request.setCharacterEncoding("utf-8");
int Id=Integer.parseInt(request.getParameter("Id"));
try{
	Conn = DriverManager.getConnection(url,db_user,db_passwd);
	stmt = Conn.createStatement();
	rs = stmt.executeQuery("SELECT * FROM content WHERE Id='"+Id+"'");
	if(rs.next()){
		recommand = rs.getInt("recommand");
		recommand += 1;
	}
	
	pstmt = Conn.prepareStatement("UPDATE content SET recommand=? WHERE Id=?");
	pstmt.setInt(1, recommand);
	pstmt.setInt(2, Id);
	pstmt.executeUpdate();
	%>
	<script>
			location.href="<%=SearchContentLink%>?Id=<%=Id%>";
	</script>
	<%
}catch (SQLException e){
	errorMsg = e.getMessage();
	out.print(errorMsg);
}finally{
	if(rs !=null)try{rs.close();}catch(SQLException e){}
	if(stmt !=null)try{stmt.close();}catch(SQLException e){}
	if(pstmt !=null)try{pstmt.close();}catch(SQLException e){}
	if(Conn !=null)try{Conn.close();}catch(SQLException e){}
}
%>