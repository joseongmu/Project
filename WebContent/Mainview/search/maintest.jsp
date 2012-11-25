<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="../../CommonT.jsp" %>
   <%@include file="../../DBcon.jsp" %> 



<div id="search-bar-bg"></div>
<div id="body" class="container_12">
	<form action="/search/" method="get" accept-charset="utf-8" class="uniForm" id="search-form">
  <div id="search-bar">
		<label for="id_location" class="inline search-location-inline-label">Where are you going?</label>
		<input type="text" name="location" value="" id="id_location">
    <button class="gidsy-button green-button left" loadingText="Search" id="search-submit">Search</button>
    <ul class="display-option search-display">
      <li class="list-view selected" title="list-view"><span class="icon-list-grey"></span>List</li>
      <li class="grid-view" title="grid-view"><span class="icon-grid-grey"></span>Photo</li>
    </ul>
  </div>
	<div class="grid_12">
		<div class="grid_4 search-filters alpha omega" id="search-filters"></div><div class="clear"></div>
      <div class="grid_9 alpha omega">
        <span id="loading-compass"><img src="https://d3pvklq8xnxxh2.cloudfront.net/img/search/loading-compass.66ffae1.gif" /></span>
        <div class="content-box list-view search-results" id="search-results">
				<div class="box-header">
  				<h3 class="activity-list-header">
	    			<span class="compass-med" id="search-compass"></span>3 results
				  </h3>
				</div>
				<ul>	<li class="msg success"><span class="location green"></span>원하시는 결과를 찾으셧나요?</li></ul>

			<!-- search result -->
			<ul id="search-result-list" class="city-list activity-list search-activity-list">
			
			
				 <li id="activity-12421" class="activity box-section odd">
				 	<div class="activity-options">
						<div class="activity-event-option">
					 		<a href="/activities/12421/belfast-mural-tours/" id="popupLink-12421" class="activity-event-cal"><span class="calendar-select-icon"></span></a>
					   	<div class="activity-list-calendar" id="popupCal-12421" style="display:none">
					     	<div class="legend"><div class="available"></div> = Scheduled events</div>
					   	</div>
						</div>
					 	<span class="img-favorite">
					 	  <a href="/signup/" data-objid="12397" data-ctid="58" inactive="Add to favorites" active="Remove from favorites"
					    title="Add to favorites" login-reason="to favorite activities" class="favorite tipsy-item "><span class="favorite-activity-icon"></span>
					    </a>
				  	</span>
	    		</div>
	    			
	    		<div class="activity-image">
		     		<a href="/activities/12421/belfast-mural-tours/" class="activity_result_link">
			        <img class="small" src="https://d210sb62pv61zh.cloudfront.net/activity-images/12421/1xIcxa9UiaXuUZp.jpg.140x100_q85_crop_upscale.jpg" width="140" height="10" />
			        <img class="large" src="https://d210sb62pv61zh.cloudfront.net/activity-images/12421/1xIcxa9UiaXuUZp.jpg.300x222_q85_crop_upscale.jpg" width="300" height="222" />
				    </a>
	    		</div>
	    			
					<div class="avatar">
						<a href="/BELFASTMURALTOURS/">
	      			<img src="https://d210sb62pv61zh.cloudfront.net/avatars/BELFASTMURALTOURS/resized/60/me.jpg" alt="BELFASTMURALTOURS" width="60" height="60" class="avatar-display" />
	    			</a>
					</div>
					
					<div class="activity-meta">
						<h5><a href="/activities/12421/belfast-mural-tours/" class="activity_result_link">BELFAST MURAL TOURS</a></h5>
	  				<ul class="activity-stats">
	    				<li class="activity-location">
	       				<span class="location"></span><span><strong>Belfast</strong></span>
	    				</li>
	    				<li>
					       <span class="people"></span>
					       <span>3-48 people</span>
					    </li>
	    				<li class="">
	       				<span class='duration-icon clock-2 hours'></span> <span>1.5-2 hours</span>
	    				</li>
	    				<li class=""></li>
	  				</ul>
					</div>
					<div class="activity-content">
	  				RANKED THE NO.1 TAXI TOUR IN BELFAST 2012 DONT JUST SEE THE MURALS...HEAR THEM!!! We deliver exactly what the ...
					</div>
					<span class="price">&#36;24.06</span>
					<div class="clear"></div>
				</li>
				
				
			</ul>
    	</div>
      </div>
    </div>
    <div class="clear"></div>
  	</form>
	</div>
<div style="clear: both;"></div>
