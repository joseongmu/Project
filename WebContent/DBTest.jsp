<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*"%>
<%@include file="DBcon.jsp" %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Go with</title>
</head>
<body>
<%
try{
String query = "SELECT * FROM user"; //Sql 구문  공부가 필요함..... 기본 삽입,삭제,수정만 알아도 기본은 할수 있음
rs = stmt.executeQuery(query);         //Sql 실행결과
out.println("<TABLE BORDER=1");
out.println("<TR><TD>이메일주소</TD><TD>닉네임</TD></TR>");

while(rs.next()) {// 참고로 rs는 값을 배열로 받아 옵니다.
        String mail = rs.getString("email_address");
        String nick = rs.getString("nickname");
        out.println("<TR><TD>"+mail+"</TD><TD>"+nick+"</TD></TR>");
        }
out.println("</TABLE>"); 
/*db연결하고 끝내는 부분을 잘해주셔야 나중에 runtime오류나 잔챙이 오류가 안납니다.*/
rs.close();
stmt.close();
Conn.close();

}catch(Exception e){
		out.println(e);
}
%>
</body>
</html>