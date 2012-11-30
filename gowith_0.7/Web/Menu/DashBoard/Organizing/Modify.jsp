<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../../CommonT.jsp" %>
     <%@include file="../../../DBcon.jsp" %>
 <% 
content_id=request.getParameter("Id");
try{
	Conn = DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement("SELECT * FROM content WHERE Id=?");
	pstmt.setString(1, content_id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		content_id= rs.getString("Id");
		user_id= rs.getString("user_id");
		title = rs.getString("title");
		description= rs.getString("description");
		meetingpoint = rs.getString("meetingpoint");
		meetingtime = rs.getString("meetingtime");
		category = rs.getString("category");
		num_people = rs.getString("num_people");
		duration = rs.getString("duration");
		price = rs.getString("price");
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
    
      <form class="form-horizontal-well"  action="Menu/DashBoard/Organizing/update.jsp" method="post">
        <fieldset> 
          <div class="control-group">
          	<label for="title" class="form_label_text">
              Title
              <span class="info-icon light tipsy-item"  title="조직할 활동의 주제나 제목을 입력해주세요."></span>
            </label>
            
            <div class="controls">
              <input type="text" class="input-xxlarge" id="title" name="title" value="<%=title%>">
            </div>
          </div>
          
        
          <div class="control-group"> 
            <label for="id_description" class="form_label_text">
              Description
              <span class="info-icon light tipsy-item"  title="조직할 활동의 자세한 내용을 입력해주세요."></span>
            </label>
            
            <div class="controls">
              <textarea class="input-xxlarge" id="textarea" rows="8" name="description"><%=description%></textarea>
            </div>
         </div>
         
           <div class="control-group"> 
	            <label for="id_category" class="form_label_text">
	              Category
	              <span class="info-icon light tipsy-item"  title="활동이 이루어지는 지역을 선택해주세요"></span>
	            </label>
	        			<%int i=1; int j=0;%>
	             <div class="controls">
	              <select id="category" name="category">
	              <% while(j<7){%>
	                <option value="<%=areas[j] %>"><%=areas[j] %></option>
	                <%j++;} %>
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
	                <option value=1>1</option>
	                <option value=2>2</option>
	                <option value=3>3</option>
	                <option value=4>4</option>
	                <option value=5>5</option>
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
	                <option value="1">1시간</option>
	                <option value="1~2">1~2시간</option>
	                <option value="2">2시간</option>
	                <option value="2~3">2~3시간</option>
	                <option value="3">3시간</option>
	                <option value="3~4">3~4시간</option>
	                <option value="4">4시간</option>
	                <option value="4~5">4~5시간</option>
	                <option value="24">24시간</option>
	              </select>
	        	</div>
	        </div>
	        
	        <div class="control-group"> 
		         <label for="id_meetingpoint" class="form_label_text">
	              Meeting point address
	              <span class="info-icon light tipsy-item"  title="홛동이 이루어질 정확한 장소 및 주소를 입력해주세요."></span>
	            </label>
	            
              <textarea class="input-xxlarge" id="meetingpoint" rows="4" name="meetingpoint"><%=meetingpoint %></textarea>
           </div>
            
            <div class="control-group"> 
		         <label for="id_meetingtime" class="form_label_text">
	              Meeting Time
	              <span class="info-icon light tipsy-item"  title="홛동시 만날시간을 선택해주세요"></span>
	            
               </label>
	             <div class="controls">
	              <select id="meetingtime" name="meetingtime">
	              <%while(i<25){ %>
	              
	              	<% if(i<13){ %>
										  <option value="<%=i%>AM"><%=i%>AM</option>
									<%}%> 
								 <% if(i>=13){ %>
								  		<option value="<%=i-12%>PM"><%=i-12%>PM</option>
								<%
									 			}
												i++; } 
	              %>
	              </select>
            </div>
            </div>
            
             <div class="control-group">
          	<label for="price" class="form_label_text">
            		Price(단위 : 원)
              <span class="info-icon light tipsy-item"  title="활동에 필요한 금액을 입력해주세요"></span>
            </label>
            
            <div class="controls">
              <input type="text" class="input-large" id="price" name="price" value="<%=price%>">
            </div>
          </div>
          <input type="hidden" name="mode" value="basic" id="mode"/>
       		<div class="pull-right">
       		<input type="hidden" value="<%=content_id%>" name="content_id"/>
            <button type="submit" class="btn btn-primary">Next>></button>
            <button type="reset" class="btn">Cancel</button>
         </div>
        </fieldset>
      </form>
    </div>