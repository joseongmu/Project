<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="DBcon.jsp" %>
    <%@include file="CommonT.jsp" %>
<% 

try{
	Conn = DriverManager.getConnection(url,db_user,db_passwd);
	stmt = Conn.createStatement();
	rs = stmt.executeQuery("SELECT * FROM content WHERE Id=1");
	if(rs.next()){
		user_id= rs.getString("user_id");
		title = rs.getString("title");
		meetingpoint = rs.getString("meetingpoint");
		description = rs.getString("description");
		category = rs.getString("category");
		num_people = rs.getInt("num_people");
		duration = rs.getInt("duration");
		recommand = rs.getInt("recommand");
		price = rs.getString("price");
		img1 = rs.getString("img1");
		img2 = rs.getString("img2");
		img3 = rs.getString("img3");
		img4 = rs.getString("img4");
	}
	
	pstmt = Conn.prepareStatement("SELECT * FROM user WHERE Id=?");
	pstmt.setInt(1, 1);
	rs2 = pstmt.executeQuery();
	if(rs2.next()){
		profile_img = rs2.getString("profile_img");
		introduce = rs2.getString("introduce");
		nickname = rs2.getString("nickname");
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
<div class="span12 offset2" >
 <div class="grid_9">
 <div class="grid_8">
	<h4>Activity Overview</h4>
	<ul class="activity-book small">
      <li>
        <img class="approval_img" src="image/<%out.println(img1); %>">
        <div class="grid_6 omega">
          <h5 class="margin-0px"><a href="" target="_blank"><%out.println(title); %></a></h5>
          <ul class="activity-stats">
            <li>
                  <span class="location"></span> <span><a href=""><%out.println(category); %></a></span>
            </li>
            <li>
                <span class="duration-icon clock-10 hours"></span> <span><%out.println(duration); %> hour</span>
            </li>
            <li>
                <span class="people"></span>
                <span><%out.println(num_people); %> people</span>
            </li>
          </ul>
          <div class="clear"></div>
          <p>
           	<%out.println(description); %>
          </p>
        </div>
        <div class="clear"></div>
      </li>
    </ul>
    </div>
    <div class ="grid_3 right">
		<h4>About Host</h4>
		<div class ="approval_host">
			<img class="approval_avarta" src="image/<%out.println(profile_img); %>">
			<span><%out.println(nickname); %></span>
		</div>
    </div>
</div>   
<div class="clear"></div>

    <!-- Confirm your selection -->
	    <div class="grid_8">
	    <h4>Confirm your selection</h4>
	    	<div class="span9 blue-bg">
	    	 <ul class="activity-stats">
	            <li>
	            	<span class="start-time"></span>만나는 시간 : <%out.println(meetingtime); %> 시
	            </li>
	            <li>
	                 <span class="duration-icon clock-10 hours"></span><span>활동 시간 : <%out.println(duration); %> hours</span>
	            </li>
	            <li>
	                <span class="people"></span><span>선택한 인원 : <%out.println(num_people); %> people</span>
	            </li>
	            <li>
	           	    <span><%out.println(price); %>결재 금액 : 원</span>
	            </li>
          	</ul>
	    	</div>
	    	<div></div>
	    	
			<!-- next level -->
		</div>
		<div class ="clear"></div>
		<div class="grid_9">
			<button type="button" class="gidsy-button green-button next-step"  onclick="location.href='approval2.jsp'"> 다음 단계로 </button>
		</div>
</div>