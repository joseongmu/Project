<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>
  <%
	SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");

	try{
		Conn = DriverManager.getConnection(url,db_user,db_passwd);
		pstmt = Conn.prepareStatement("SELECT * From user WHERE Id=?");
		pstmt.setString(1,SESSION_USER_ID );
		rs = pstmt.executeQuery();
		if(rs.next()){
			email_address = rs.getString("email_address");
			password= rs.getString("password");
			nickname = rs.getString("nickname");
			profile_img = rs.getString("profile_img");
			Introduce = rs.getString("introduce");
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
 <script  type='text/javascript'>
		function readURL(input) {
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
		}
</script>
<div class="span7 offset1">
	<div>
		<div class="general-form inlineForm">
			<div class="avatar-box">
        <form action="Menu/DashBoard/Profile_Update.jsp" class="uniForm profile-form" method="POST" enctype="multipart/form-data">
        <div id="avatar-container">
					<div class="profile-avatar">
						<img src="Profile_img/<%=profile_img %>" alt="" class="profile_update"  id="PreviewImage"/>
					</div>
					<h4>이미지를 선택 해주세요</h4>
					<input type="file" name="profile_img" id="id_avatar" onchange="readURL(this);" />
         <div class="clear"></div>
			</div>
       <br>
        <fieldset class="inlineLabels">
          <div id="email_address" class="ctrlHolder error-indication"><label for="email_address">Email address</label>
          	<div class="privacy_fieldset"><input type="text" name="email_address" value="<%=email_address%>" class="emailinput validateEmail validateCallback validate_email" id="email_address" class="inline-label-field " id="" /></div>
						<span id="hint" class="formHint fineprint-text">Your email address will never be displayed publicly</span>
            <div class="clear"></div>
          </div>
          
				  <div id="nickname" class="ctrlHolder  ">
	        	<label for="nickname">Nickname</label>
	        	<div class="clear"></div>
	      		<input type="text" name="nickname" id="nickname" class="textinput validateMaxLength val-60" maxlength="60" class="inline-label-field " value="<%=nickname%>" id="" />
	      		<div class="clear"></div>
  				</div>
  				
					<div id="password_current" class="ctrlHolder  ">
	        	<label for="password_current">Current Password</label>
	        	<div class="clear"></div>
	      		<input type="text" name="password_current" class="textinput validateMaxLength val-30 validateCallback validate_username" id="password_current" class="inline-label-field "  id=""  value="<%=password%>"/>
	      		<div class="clear"></div>
  				</div>
  				
					<div id="password_new" class="ctrlHolder  ">
	        	<label for="password">password New</label>
	        	<div class="clear"></div>
	      		<input type="text" name="password_new" class="textinput validateMaxLength val-30 validateCallback validate_username" id="password_new" class="inline-label-field "  id="" />
	      		<div class="clear"></div>
  				</div>
  				
					<div id="password_confirm" class="ctrlHolder  ">
	        	<label for="password">Password Confirm</label>
	        	<div class="clear"></div>
	      		<input type="text" name="password_confirm" class="textinput validateMaxLength val-30 validateCallback validate_username" id="password_confirm" class="inline-label-field "  id="" />
	      		<div class="clear"></div>
  				</div>
  				
  				<div id="introduce" class="ctrlHolder  ">
	        	<label for="introduce"> Introduce</label>
	        	<div class="clear"></div>
	      		<textarea name="introduce" class="locationautocomplete validateMaxLength val-300" id="introduce" class="inline-label-field "  id="" ><%=Introduce%></textarea>
						<script type="text/javascript">
							$(function(){
							    gidsy.search_box_autocomplete($("#id_profile-location"), { autosubmit: false });
							});
						</script>
						<div class="clear"></div>
					</div>
					<div class="button-bar standard-form-actions">
            <button class="gidsy-button green-button" type="submit">Save Changes</button>
          </div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
</div>
