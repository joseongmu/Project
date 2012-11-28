<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import ="java.sql.*"%>
<%@ include file ="DBcon.jsp" %>
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
		meetingtime = rs.getInt("meetingtime");
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
<div class="grid_12">
<h4 class="light-text">
	<strong>&#8220;<%out.print(title);%>&#8221;</strong> 결재 내역입니다.
</h4>
<div id="booking-overview" class="lifted">
<div id="confirmed">
  <span class="check"></span>
</div>
<ul class="grid_4 prefix_1 alpha booking-data check-booking">
  <li>
    <h6>Date</h6>
      <strong>2012년 11월 28일</strong>
  </li>
  <li>
    <h6>Location</h6>
      <strong><%out.print(category); %></strong>
  </li>
</ul>
<ul class="grid_2 booking-data">
  <li>
    <h6>Start time</h6>
      <strong><%out.print(meetingtime);%> 시</strong>
  </li>
  <li>
    <h6>People</h6>
      <strong><%out.print(num_people); %> 명</strong>
  </li>
</ul>
<ul class="grid_2 booking-data">
  <li>
    <h6>Duration</h6>
     <strong><%out.print(duration); %> 시간</strong>
  </li>
  <li>
      <h6>Price p.p. (KRW)</h6>
      	<span>
          <strong><%out.print(price); %> 원</strong>
        </span>
    
  </li>
</ul>
<ul class="grid_3 booking_price omega booking-data">
  <li>
    <h6>Total price (KRW)</h6>
        <span class="big_price length-6">
          <strong><%out.print(price); %> 원</strong>
        </span>
  </li>
</ul>
</div>
</div>
<div class ="clear"></div>
	<div class="grid_9">
		<button type="button" class="gidsy-button green-button next-step"  onclick=""> 결재 하기 </button>
	</div>
</div>