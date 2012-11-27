<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../CommonT.jsp" %>
<%@include file="../../DBcon.jsp" %>
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




<div class="view-activity" id="top">
	<div class="top-50px-margin"></div>
    <div id="site-wrapper">
    	<div class="clear"></div>
    		<div id="body" class="container_12">
  				<div class="activity-page">
    				<div class="grid_7 activity-column">
        			<div class="activity-title">
          			<h1><%=title%></h1>
          			<ul class="activity-stats">
            			<li class=""><span class="location"></span>
                	<span><a href='/search/?location=Sintra%2C+Portugal'><%=meetingpoint%></a></span>
			            </li>
            			<li><span class="people"></span><span><%=num_people%> people</span></li>
            			<li class=""><span class='duration-icon clock-3 hours'></span><span><%=duration%> hour</span></li>
          			</ul><div class="clear"></div>
        			</div><div class="clear"></div>
        		<div class="activity-gallery">
          		<div class="gallery-display">
           			<div id="big-activity-map"></div>
            		<div class="main-image">
                  <img class="display-image" src="<%=img1%>" alt="" id="main-image-0" />
          			</div>
          		</div>
	          	<div class="activity-imagelist thumb-count-5">
	            	<div class="activity-thumbs">
	                <a href="https://d210sb62pv61zh.cloudfront.net/activity-images/11590/21J0xMQp7aroD8l.png.590x440_q85_crop_upscale.jpg" class="activity-thumb image" position="0">
	                  <img src="<%=img1%>" alt="" />
	                </a>
	                <a href="https://d210sb62pv61zh.cloudfront.net/activity-images/11590/FE8WA1hWI2R7JS3.jpg.590x440_q85_crop_upscale.jpg" class="activity-thumb image" position="1">
	                  <img src="<%=img2%>" alt="" />
	                </a>
	                <a href="https://d210sb62pv61zh.cloudfront.net/activity-images/11590/2RIT4nX0LGlozin.jpg.590x440_q85_crop_upscale.jpg" class="activity-thumb image" position="2">
	                  <img src="<%=img3%>" alt="" />
	                </a>
	                <a href="https://d210sb62pv61zh.cloudfront.net/activity-images/11590/2RIT4nX0LGlozin.jpg.590x440_q85_crop_upscale.jpg" class="activity-thumb image" position="2">
	                  <img src="<%=img4%>" alt="" />
	                </a>
            		</div>
          		</div>
          	<div class="clear"></div>
        	</div>
        
          <hr/>
        
        <div class="activity-description">
          <div class="right"></div>
          <div class="description-title">거기에 가면 무슨 활동을 하나요?</div>
          <div class="body-text">
            <div><p><%=description%></p></div>
          </div>
        </div>
      <div class="clear"></div>
    </div>
    <div class="grid_4 right">
      <a href="#reviews" class="review_link"><span class="count_bubble reviews_bubble"><span class="num"><%=recommand%></span>
      	<span class="tail"></span></span><br/>Recommand</a>
      <div class="activity-price">
          <div class="text-14px">From</div>
          <div class="price left length-6">&#36;<%=price%></div>
          <div class="clear"></div>
      </div>
      <p><button class="gidsy-button green-button full-width" type="submit">Continue to booking</button></p>
			<ul class="activity-actions">
      	<li>
					<div class="add-remove-favorite">
					   <a href="Mainview/search/Recommand.jsp" hover="Remove from favorites" class="favorite "><span class="favorite-icon-med"></span>
					   <span class="favorite-text">Add to your favorites</span>
					  </a>
					</div>
     		</li>
			</ul>
      <div class="host-section">
        <a href="/978bb8a4/">
          <img src="<%=profile_img%>" alt="978bb8a4" width="220" height="220" class="avatar-display" />
        </a>
        <h5>
          <a href="/978bb8a4/"><%=nickname%></a>
        </h5><div class="clear"></div>
        	<p class="bio body-small-text">
            <%=introduce%>
          </p>
        </div>
      </div>
    </div>
  </div>
 </div>
<div style="clear: both;"></div>
 <script type="text/javascript">
   var public_map = false;
   $(document).ready(function(){
     $(".activity-imagelist .image").click(function(el){
       el.preventDefault();
       var new_img = $(this).attr("href");
       var low_img = $(this).children("img:eq(0)").attr("src");
       if ($(".main-image img").attr("id") === "main-image-" + $(this).index()) {
         $(".main-image").fadeIn(250);
         return false;
       }
       var caption = $("img",this).attr("alt");
       $('#photo-caption').html($.trim(caption));
       $(".main-image img.display-image").removeClass("loaded");
       $(".main-image img.display-image").fadeOut(250, function(){
         $(this).remove();
       });
       $(".main-image").append('<img class="loaded display-image" src="'+low_img+'" />');
       $(".loader-image").html('<img src="'+new_img+'" />');
       $(".loader-image img").load(function() {
         $(".main-image img.loaded").attr("src", new_img);
       }).each(function() {
         if(this.complete) {$(this).load();}
       });
       $(".main-image img.display-image.loaded").hide();
       $(".main-image img.display-image.loaded").fadeIn(250);
       $(".main-image").fadeIn(250);
       $(".main-image img").attr("id", "main-image-"+$(this).index());
     });
     $('.main-image').mouseenter(function() {
       if($('#photo-caption').html().length > 0) {
         $('.credit_caption').stop().animate({"opacity":.75},{duration:150});
       }
     }).mouseleave(function() {
       $('.credit_caption').stop().animate({"opacity":0},{duration:300});
     });

      $(".show-more-info").click(function(el) {
       el.preventDefault();
       $(".profile-more").toggle();
       $(this).toggleClass("more");
       if($(this).hasClass("more")) {
         $(".show-more-info .text").text("less");
         $(".arrow-css").removeClass("down").addClass("up");
       } else {
         $(".show-more-info .text").text("more");
         $(".arrow-css").removeClass("up").addClass("down");
       }
     });
     $(".box-tabs .tab").gidsyBoxTabs();
   })
 </script>
</div>