<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../../DBcon.jsp" %>
    <%@include file="../../CommonT.jsp" %>
<div class="span11">
		<div class="span7">
		<div class="content-box overview-section" id="dashboard-messages-box">
		    <div class="box-header">
		      <h3 class="activity-list-header">
		        <span class="favorite-med"></span>
		        
		           Wow! 이정구님 환영합니다.
		        
		      </h3>
		    </div>
		  </div>
				  <div class="content-box list-view">
					<div class="box-header">
							 <a href="/messages/inbox/" class="info-link">View inbox</a>
					    <h3><a href="/messages/inbox/" class="light-text">
					      <span class="envelope-med-green"></span> Recent Message</a>
					    </h3>
		     </div>
		
		    <h6>Alice in Wonderland, part dos</h6>
		    <p>'You ought to be ashamed of yourself for asking such a simple question,' added the Gryphon; and then they both sat silent and looked at poor Alice, who felt ready to sink into the earth. At last the Gryphon said to the Mock Turtle, 'Drive on, old fellow! Don't be all day about it!' and he went on in these words:
		    'Yes, we went to school in the sea, though you mayn't believe it—'
		    'I never said I didn't!' interrupted Alice.
		    'You did,' said the Mock Turtle.</p>
		    <div>
		        <span class="badge badge-success">Posted 2012-08-02 20:47:04</span><div class="pull-right"><span class="label">alice</span> <span class="label">story</span> <span class="label">blog</span> <span class="label">personal</span></div>
		    </div> 
		    <hr>
		    <h6>Revolution has begun!</h6>
		    <p>'I am bound to Tahiti for more men.'
		        'Very good. Let me board you a moment—I come in peace.' With that he leaped from the canoe, swam to the boat; and climbing the gunwale, stood face to face with the captain.
		        'Cross your arms, sir; throw back your head. Now, repeat after me. As soon as Steelkilt leaves me, I swear to beach this boat on yonder island, and remain there six days. If I do not, may lightning strike me!'A pretty scholar,' laughed the Lakeman. 'Adios, Senor!' and leaping into the sea, he swam back to his comrades.</p>
		    <div>
		        <span class="badge badge-success">Posted 2012-08-02 20:47:04</span><div class="pull-right"><span class="label">alice</span> <span class="label">story</span> <span class="label">blog</span> <span class="label">personal</span></div>
		    </div>     
		    <hr>
		    </div>
    </div>
    
    <div class="span3 pull-right">
    <div class="sidebar-section blue-bg">
        <div class="border-avatar">
          <img src="Profile_img/img1.png" alt="profile_img" id="profile_img" class="avatar-display" />
        </div>
        <h5>이정구</h5>
        <div class="profile-links">
          <a href="/profile/my-profile/" class="view-profile">
            <span class="profile-icon"></span>View profile
          </a>
          <a href="/profile/edit/" class="edit-profile">
            <span class="edit-icon"></span>Edit
          </a>
        </div>
        <div class="clear"></div>
      </div>
      <div class="sidebar-section no-bg">
        
          <h6>Quick links</h6>
          <ul class="sidebar-list help-links">
            <li>
              <a href="<%out.print(OrganizingLink);%>">
                <span class="activity-small-darkblue icon-link"></span>Manage Listings
              </a>
            </li>
            <li>
              <a href="/payout/settings/">
                <span class="info-icon icon-link"></span>My Profile info
              </a>
            </li>
            <li>
              <a href="<%out.print(BookLink);%>">
                <span class="bookings-icon icon-link"></span>Incoming bookings
              </a>
            </li>
          </ul>
        
        <h6>Community</h6>
        <ul class="sidebar-list help-links">
          <li>
            <a href="https://help.gidsy.com" target="_blank">
              <span class="help-center icon-link"></span>Help center
            </a>
          </li>
        </ul>
      </div>
      </div>
</div>