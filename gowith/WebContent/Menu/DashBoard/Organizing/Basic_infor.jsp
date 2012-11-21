<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="span8">
    
      <form class="form-horizontal-well"  action="register.jsp" method="post">
        <fieldset> 
          <div class="control-group">
          	<label for="title" class="form_label_text">
              Title
              <span class="info-icon light tipsy-item"  title="조직할 활동의 주제나 제목을 입력해주세요."></span>
            </label>
            
            <div class="controls">
              <input type="text" class="input-xxlarge" id="title" name="title">
            </div>
          </div>
          
        
          <div class="control-group"> 
            <label for="id_description" class="form_label_text">
              Description
              <span class="info-icon light tipsy-item"  title="조직할 활동의 자세한 내용을 입력해주세요."></span>
            </label>
            
            <div class="controls">
              <textarea class="input-xxlarge" id="textarea" rows="8" name="description"></textarea>
            </div>
         </div>
         
           <div class="control-group"> 
	            <label for="id_category" class="form_label_text">
	              Category
	              <span class="info-icon light tipsy-item"  title="활동이 이루어지는 지역을 선택해주세요"></span>
	            </label>
	        
	             <div class="controls">
	              <select id="category" name="category">
	                <option value="0">서울</option>
	                <option value="1">수원</option>
	                <option value="2">부산</option>
	                <option value="3">강원도</option>
	                <option value="4">충청북도</option>
	              </select>
	        	</div>
	        </div>
	              
	          <div class="control-group">
	            <label for="num_people" class="form_label_text">
              Num_People
              <span class="info-icon light tipsy-item"  title="조직할 활동을 같이할 인원수를 입력해주세요"></span>
            </label>
             
	            <div class="controls">
	              <select multiple="multiple" id="num_people" name="num_people">
	                <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5">5</option>
	              </select>
	            </div>
          </div>
          
           <div class="control-group"> 
	            <label for="id_duration" class="form_label_text">
	              Duration
	              <span class="info-icon light tipsy-item"  title="활동이 이루어지는 지역을 선택해주세요"></span>
	            </label>
	             
	             <div class="controls">
	              <select id="Duration" name="duration">
	                <option value="0">1일</option>
	                <option value="1">2일</option>
	                <option value="2">3일</option>
	                <option value="3">4일</option>
	                <option value="4">5일</option>
	                <option value="5">6일</option>
	                <option value="6">1주일</option>
	                <option value="7">2주일</option>
	                <option value="8">한달</option>
	              </select>
	        	</div>
	        </div>
	        
	        <div class="control-group"> 
		         <label for="id_meetingpoint" class="form_label_text">
	              Meeting point address
	              <span class="info-icon light tipsy-item"  title="홛동이 이루어질 정확한 장소 및 주소를 입력해주세요."></span>
	            </label>
	            
              <textarea class="input-xxlarge" id="meetingpoint" rows="4" name="meetingpoint"></textarea>
           </div>
            
            <div class="control-group"> 
		         <label for="id_meetingtime" class="form_label_text">
	              Meeting Time
	              <span class="info-icon light tipsy-item"  title="홛동시 만날시간을 선택해주세요"></span>
	            
               </label>
	             <div class="controls">
	              <select id="meetingtime" name="meetingtime">
										  <option value="1">1:00</option>
										  <option value="2">2:00</option>
										  <option value="3">3:00</option>
										  <option value="4">4:00</option>
										  <option value="5">5:00</option>
										  <option value="6">6:00</option>
										  <option value="7">7:00</option>
										  <option value="8">8:00</option>
										  <option value="9">9:00</option>
										  <option value="10">10:00</option>
										  <option value="11">11:00</option>
										  <option value="12">12:00</option>
										  <option value="13">13:00</option>
										  <option value="14">14:00</option>
										  <option value="15">15:00</option>
										  <option value="16">16:00</option>
										  <option value="17">17:00</option>
										  <option value="18">18:00</option>
										  <option value="19">19:00</option>
										  <option value="20">20:00</option>
										  <option value="21">21:00</option>
										  <option value="22">22:00</option>
										  <option value="23">23:00</option>
										  <option value="24">24:00</option>
	              </select>
            </div>
            </div>
          <input type="hidden" name="mode" value="basic" id="mode"/>
       		<div class="pull-right">
            <button type="submit" class="btn btn-primary">Next>></button>
            <button type="reset" class="btn">Cancel</button>
         </div>
        </fieldset>
      </form>
    </div>