<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../CommonT.jsp" %>
 <%
 			view = request.getParameter("view");

      if(view==null){
    	  activeClass="class='active'";
    	  tabClass="tab-pane fade in active";
    		tabClass2="tab-pane fade";
    		tabClass3="tab-pane fade";
      }else if(view.equals("book")){
    	  activeClass2="class='active'";
    	  activeClass=" ";
    	  tabClass2="tab-pane fade in active";
  	    tabClass="tab-pane fade";
  	    tabClass3="tab-pane fade";
      }else if(view.equals("organ")){
    	 	 activeClass3="class='active'";
    	 	 activeClass=" ";
    	 	 tabClass3="tab-pane fade in active";
     		 tabClass="tab-pane fade";
     		 tabClass2="tab-pane fade";
      }
 %>
<div class="span12 offset2" >
          <div class="page-header">
            
          </div>
          <div class="bs-docs-example">
          	<div class="header-tab">
            <ul id="myTab" class="nav nav-tabs">
              <li <%out.print(activeClass); %>><a href="#Overview" data-toggle="tab">Overview</a></li>
              <li><a href="#InBox" data-toggle="tab">InBox</a></li>
              <li <%out.print(activeClass2); %>><a href="#Booking" data-toggle="tab">Booking</a></li>
              <li <%out.print(activeClass3); %>><a href="#Organizing" data-toggle="tab">Organizing</a></li>
              <li><a href="#Profile" data-toggle="tab">Profile</a></li>
              <li><a href="#Account" data-toggle="tab">Account</a></li>
            </ul>
            </div>
            <div id="myTabContent" class="tab-content">
              <div class="<%out.print(tabClass); %>" id="Overview">
                <jsp:include page="Overview.jsp"></jsp:include>
              </div>
              <div class="tab-pane fade" id="InBox">
               	<jsp:include page="InBox.jsp"></jsp:include>
              </div>
               <div class="<%out.print(tabClass2); %>" id="Booking">
              	<jsp:include page="Booking.jsp"></jsp:include>
              </div>
               <div class="<%out.print(tabClass3); %>" id="Organizing">
               <jsp:include page="Organizing.jsp"></jsp:include>
              </div>
              <div class="tab-pane fade" id="Profile">
              <jsp:include page="Profiletest.jsp"></jsp:include>
              </div>
              <div class="tab-pane fade" id="Account">
              <jsp:include page="Account.jsp"></jsp:include>
              </div>
              
            </div>
          </div>
     </div>