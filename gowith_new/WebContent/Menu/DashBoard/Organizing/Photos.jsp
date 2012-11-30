<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../../CommonT.jsp" %>
    <%@include file="../../../DBcon.jsp" %>
 <script  type='text/javascript'>
		function readURL(input) {
		if (input.files && input.files[0]) {//Check if input has files.
			var reader = new FileReader(); //Initialize FileReader.
			reader.onload = function (e) {
			$('#no-image').attr('src', e.target.result);
			$("#no-image").resizable({ aspectRatio: true, maxHeight: 300 });
			};
			reader.readAsDataURL(input.files[0]);
		} 
		else {
			$('#no-image').attr('src', "#");
			}
		}
//		$("#profile_image #uploadfile").attr("src", $("#profile_file input[type='file']").val());
</script>
 <% 
 int SESSION_ID=	Integer.parseInt((String)session.getAttribute("SESSION_USER_ID")); 
try{
	Conn = DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement("SELECT * FROM content WHERE user_id=? order by cratedat desc");
	pstmt.setInt(1, SESSION_ID);
	rs = pstmt.executeQuery();
	if(rs.next()){
		content_id= rs.getString("Id");
		img1= rs.getString("img1");
		img2= rs.getString("img2");
		img3= rs.getString("img3");
		img4= rs.getString("img4");
		
	}
}catch (SQLException e){
	errorMsg = e.getMessage();
}finally{
	if(rs !=null)try{rs.close();}catch(SQLException e){}
	if(stmt !=null)try{stmt.close();}catch(SQLException e){}
	if(pstmt !=null)try{pstmt.close();}catch(SQLException e){}
	if(Conn !=null)try{Conn.close();}catch(SQLException e){}
}

%>
 <div class="span8">
    
      <form class="form-horizontal-well"  enctype="multipart/form-data" method="post" action="Menu/DashBoard/Organizing/upload.jsp">
      
      <fieldset>
      	<label class="form_label_text">
             <h5>Upload your photos -2 photos minimum</h5>
       </label>
       		
      
	      		<div class="control-group">
	          	<label for="photo-change" class="form_label_text">
	             1. Main-image  
	            </label>
	            
	            <div class="photo-change">
	                <div id="img_div"><img src="image/<%if(img1==null){ out.print("no_image.jpg");}else{ out.print(img1);} %>" id="no-image"/></div>
	               <div class="pull-right"><input type="file" name="fileupload1"  id="fileupload" class="file-input"  onchange="readURL(this);"/></div>
	             </div>
	          </div>
             <br/><br/>
             
             <div class="control-group">
          	<label for="photo-change2" class="form_label_text">
             2. Sub-image(1)
            </label>
            
            <div class="photo-change">
              <img src="image/<%if(img2==null){ out.print("no_image.jpg");}else{ out.print(img2);} %>" id="no-image2"/>
              <div class="pull-right"><input type="file" name="fileupload2"  id="fileupload" class="file-input"  onchange="preViewImg(this)"/></div>
            </div>
             </div>
             <br/><br/>
             <div class="control-group">
          	<label for="photo-change3" class="form_label_text">
             3. Sub-image(2)
            </label>
            
            <div class="photo-change">
              <img src="image/<%if(img3==null){ out.print("no_image.jpg");}else{ out.print(img3);} %>" id="no-image3"/>
              <div class="pull-right"><input type="file" name="fileupload3"  id="fileupload" class="file-input"  onchange="preViewImg(this)"/></div>
            </div>
             </div>
             <br/><br/>
             
             <div class="control-group">
          	<label for="photo-change4" class="form_label_text">
             4. Sub-image(3)
            </label>
            
            <div class="photo-change">
              <img src="image/<%if(img4==null){ out.print("no_image.jpg");}else{ out.print(img4);} %>" id="no-image4"/>
              <div class="pull-right"><input type="file" name="fileupload4"  id="fileupload" class="file-input"  onchange="preViewImg(this)"/></div>
            </div>
             </div>
             <br/><br/>
             
           <input type="hidden" value="<%=content_id%>" name="Id" id="Id"/>
            <div class="pull-right">
							            <button type="submit" class="btn btn-primary">Next>></button>
							            <button type="reset" class="btn">Cancel</button>
						</div>
						
						
						
            
          
         </fieldset>
      </form>
      
  </div>