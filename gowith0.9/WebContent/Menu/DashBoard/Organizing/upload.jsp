<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../../DBcon.jsp" %>
 <%@include file="../../../CommonT.jsp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	// 절대 경로
	String savePath = "C:/Users/이정구/gowith/gowith/WebContent/image/";
	int maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
	try {	     
		MultipartRequest multi = new MultipartRequest(request,savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		fileName1 = multi.getFilesystemName("fileupload1"); // 파일의 이름 얻기
		fileName2 = multi.getFilesystemName("fileupload2"); // 파일의 이름 얻기
		fileName3 = multi.getFilesystemName("fileupload3"); // 파일의 이름 얻기
		fileName4 = multi.getFilesystemName("fileupload4"); // 파일의 이름 얻기
		content_id = multi.getParameter("Id");
		if (fileName1 == null) { // 파일이 업로드 되지 않았을때
			out.print("파일 업로드 되지 않았음");
		} else { // 파일이 업로드 되었을때;
			query = "UPDATE content SET img1=?, img2=?, img3=?, img4=? WHERE Id=?";
			Conn=DriverManager.getConnection(url,db_user,db_passwd);
			pstmt = Conn.prepareStatement(query);
			pstmt.setString(1,fileName1);
			pstmt.setString(2,fileName2);
			pstmt.setString(3,fileName3);
			pstmt.setString(4,fileName4);
			pstmt.setString(5,content_id);
			//out.println(query); //쿼리문 확인
	  	pstmt.executeUpdate();
		}
	} catch (Exception e) {
		out.print("예외 발생 : " + e);
	}
%>
