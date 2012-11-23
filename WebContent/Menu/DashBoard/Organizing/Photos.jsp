<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
 <div class="span8">
    
      <form class="form-horizontal-well"  enctype="multipart/form-data" method="post" action="upload.jsp">
      
      <fieldset>
      	<label class="form_label_text">
             <h5>Upload your photos -2 photos minimum</h5>
       </label>
       		
      
	      		<div class="control-group">
	          	<label for="photo-change" class="form_label_text">
	             1. Main-image  
	            </label>
	            
	            <div class="photo-change">
	                <div id="img_div"><img src="../../../img/noimg.png" id="no-image"/></div>
	               <div class="pull-right"><input type="file" name="fileupload"  id="fileupload" class="file-input"  onchange="readURL(this);"/></div>
	             </div>
	          </div>
             <br/><br/>
             
             <div class="control-group">
          	<label for="photo-change2" class="form_label_text">
             2. Sub-image(1)
            </label>
            
            <div class="photo-change">
              <img src="../../../img/noimg.png" id="no-image2"/>
              <div class="pull-right"><input type="file" name="fileupload"  id="fileupload" class="file-input"  onchange="preViewImg(this)"/></div>
            </div>
             </div>
             <br/><br/>
             
           
            <div class="pull-right">
							            <button type="submit" class="btn btn-primary">Next>></button>
							            <button type="reset" class="btn">Cancel</button>
						</div>
            
          
         </fieldset>
      </form>
      
  </div>