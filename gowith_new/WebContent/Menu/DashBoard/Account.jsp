<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
    <%
     SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");
    	if(SESSION_USER_ID==null){
		%>
			<script>location.href="<%=HomeLink%>"; alert("로그인이 필요합니다.");</script>
		<%
		}else{
   %>
<% 

String start=null;
String end=null;
int Id =Integer.parseInt(request.getParameter("id"));
try{
	Conn = DriverManager.getConnection(url,db_user,db_passwd);
	pstmt = Conn.prepareStatement("SELECT * FROM content WHERE Id=?");
	pstmt.setInt(1, Id);
	rs = pstmt.executeQuery();
	if(rs.next()){
		content_id= rs.getString("Id");
		user_id= rs.getString("user_id");
		title = rs.getString("title");
		meetingpoint = rs.getString("meetingpoint");
		meetingtime = rs.getString("meetingtime");
		category = rs.getString("category");
		num_people = rs.getString("num_people");
		duration = rs.getString("duration");
		start= rs.getString("start");
		end= rs.getString("end");
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
<br>
<br><br>
 <div class="span12 offset2"> 
    <h4 class="light-text">
      Overview of your booking for &#8220;<%=title %>&#8221;
    </h4>
    <div id="booking-overview" class="lifted">
      <div id="confirmed">
        <span class="check"></span>
      </div>
      <ul class="span3  booking-data offset0">
        <li>
          <h6>Strat Date</h6>
          <span class="timeslice days"></span>
          			<%=start%>
        </li>
        <li>
          <h6>Location</h6>
          
            <span class="location"></span> <strong><%=category %></strong>
          
        </li>
      </ul>
      <ul class="span2 booking-data">
        <li>
          <h6>Start time</h6>
          <span class="start-time"></span>
            <%=meetingtime%>
        </li>
        <li>
          <h6>People</h6>
          <span class="people"></span>
            <%=num_people %>
        </li>
      </ul>
      <ul class="span2 booking-data">
        <li>
          <h6>Duration</h6>
          <span class='duration-icon clock-4 hours'></span> <span><%=duration %>hours</span>
        </li>
        <li>
          
          
            <h6>Price</h6>
            <span class="currency USD"></span><span>
               <%=price %>원
              </span>
          
        </li>
      </ul>
      <ul class="span4 booking_price omega booking-data">
        <li>
          <h6>Total price </h6>
          
            
              
              <span class="big_price length-">
                <%=price %>원
              </span>
          
        </li>
      </ul>
    </div>
 	<div class="span5 ">
 	<div class="uniForm general-form" style="width:300px">
           <a href="Menu/DashBoard/Account_register.jsp?Id=<%=content_id %>" class="gidsy-button  green-button" rel="facebox">
             Continue to Booking
           </a>  
  		</div>
 	</div>
  <div class="span5 ">
    <div class="uniForm general-form" style="width:460px">
       <h4 class="light-text top-0px-margin"><span class="gidsy-shield"></span> Safe payments</h4>
    <hr/>
    <p class="body-text">
      
        In order to protect both you and the organizer, we will only transfer your money after
        the activity happens as planned. You will get a full refund if something goes wrong.
      
    </p>
    </div>
  </div>
   </div>
  <div class="clear"></div>


    </div>
    <%}%>