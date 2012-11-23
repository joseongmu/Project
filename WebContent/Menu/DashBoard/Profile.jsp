<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%
	String errorMsg = "";

	String email_address = "";
	String nickname = "";
	String profile_img = "";
	String introduce = "";
	try{
		Conn = DriverManager.getConnection(url,db_user,db_passwd);
		pstmt = Conn.prepareStatement("SELECT * From user WHERE user_id=?");
		pstmt.setInt(1, 1);
		rs = pstmt.executeQuery();
		if(rs.next()){
			email_address = rs.getString("email_address");
			nickname = rs.getString("nickname");
			profile_img = rs.getString("profile_img");
			introduce = rs.getString("introduce");
		}
	}catch (SQLException e){
		errorMsg = "SQL 에러:" + e.getMessage();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException e){}
		if(stmt != null) try{stmt.close();}catch(SQLException e){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
		if(Conn != null) try{Conn.close();}catch(SQLException e){}
	}
%>

<div class="span11">
		<div class="content-box list-view">
		 <div class="general-form inlineForm">
          <div class="avatar-box">
            <div id="avatar-container">
	 			<div class="box-header">
						<h4>Your bookings > <a>Upcoming events</a>  </h4>
				</div>
				<form method="post" action="Update.jsp">
		    	<div id=profile_wrap>
				    <div id=profile_image>
				  			<img src="profile_img" alt="" id="PreviewImage"  value="<%=profile_img%>">
				  		</div>
		    		
		    		<div id=profile_file>
				    	<div>컴퓨터에 저장된 이미지를 선택하세요.<br>사진의 최대 크기는 2MB입니다.(파일형식: JPG, GIF, PNG)</div>
					   		<input name="profile_img" id="ImageFileUpload" onchange="readURL(this);" type="file">
				  		</div>
			   		
				    <div id=profile_email>
						<div>E-mail</div>
				    	<input type="text" name="email_address" value="<%=email_address%>">
				 		</div>
				    		
			   		<div id=profile_nickname>
		    			<div>닉 네임</div>
		    				<input type="text" name="nickname" value="<%=nickname%>">
				    	</div>
				    		
				    	<div id=profile_old_password>
				    		<div>현재 비밀번호</div>
				    		<input type="password" name="old_password">
				    	</div>
				    		
				    	<div id=profile_new_password>
				    		<div>신규 비밀번호</div>
				    		<input type="password" name="new_password">
				    	</div>
				    		
				    	<div id=profile_check_password>
				    		<div>신규 비밀번호 확인</div>
				    		<input type="password" name="check_password">
				    	</div>
				    		
				    	<div id=profile_introduce>
				    		<div>소개 글</div>
				    		<textarea name="introduce"><%=introduce%></textarea>
				    	</div>
				    		
				    	<div id=profile_submit>
				    		<input type="submit" name="profile_submit" value="회원 정보 수정">
				    	</div>
				    	</div>
				    </form>
				    </div>
				    </div>
				    </div>
	 		 </div>
	</div>
	
	<script  type='text/javascript'>
		$(function readURL(input) {
		if (input.files && input.files[0]) {//Check if input has files.
			var reader = new FileReader(); //Initialize FileReader.
			reader.onload = function (e) {
			$('#PreviewImage').attr('src', e.target.result);
			$("#PreviewImage").resizable({ aspectRatio: true, maxHeight: 300 });
			};
			reader.readAsDataURL(input.files[0]);
		} 
		else {
			$('#PreviewImage').attr('src', "#");
			}
		});
</script>
