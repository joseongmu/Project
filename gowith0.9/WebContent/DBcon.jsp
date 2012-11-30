<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<%
String drivers="com.mysql.jdbc.Driver";
String url="jdbc:mysql://localhost:3306/gowith?useUnicode=true&characterEncoding=UTF-8";
String db_user="root";
String db_passwd="1q2w3e4r!";

try{
		Class.forName(drivers);	//드라이버를 찾아준다.
}catch(ClassNotFoundException e){
		out.println(e.getMessage());
}

Connection Conn=null; //DB연결 정보 담는 Conn 선언
PreparedStatement pstmt=null;  //DB연결 통로를 역활을 하는 pstmt 선언
ResultSet rs=null;        //쿼리문 실행 결과 값을 담을 rs 선언
Statement stmt=null;

Connection Conn2=null; //DB연결 정보 담는 Conn 선언
PreparedStatement pstmt2=null;  //DB연결 통로를 역활을 하는 pstmt 선언
ResultSet rs2=null;        //쿼리문 실행 결과 값을 담을 rs 선언
Statement stmt2=null;
%>
    
