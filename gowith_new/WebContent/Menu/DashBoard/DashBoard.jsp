<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../../CommonT.jsp" %>
 <%
 			view = request.getParameter("view");
					if(view==null){
						active[0]="class='active'";
						tab[0]="tab-pane fade in active";
					}else if(view.equals("inbox")){
						active[1]="class='active'";
						tab[1]="tab-pane fade in active";
					}else if(view.equals("book")){
						active[2]="class='active'";
						tab[2]="tab-pane fade in active";
					}else if(view.equals("organ")){
						active[3]="class='active'";
						tab[3]="tab-pane fade in active";
					}else if(view.equals("pro")){
						active[4]="class='active'";
						tab[4]="tab-pane fade in active";
					}else if(view.equals("acco")){
						active[5]="class='active'";
						tab[5]="tab-pane fade in active";
					}
 %>
<div class="span12 offset2" >
          <div class="page-header">
            
          </div>
          <div class="bs-docs-example">
          	<div class="header-tab">
            <ul id="myTab" class="nav nav-tabs">
              <li <%=active[0]%>><a href="#Overview" data-toggle="tab">Overview</a></li>
              <li <%=active[1]%>><a href="#InBox" data-toggle="tab">InBox</a></li>
              <li <%=active[2]%>><a href="#Booking" data-toggle="tab">Booking</a></li>
              <li <%=active[3]%>><a href="#Organizing" data-toggle="tab">Organizing</a></li>
              <li <%=active[4]%>><a href="#Profile" data-toggle="tab">Profile</a></li>
              <li <%=active[5]%>><a href="#Account" data-toggle="tab">Account</a></li>
            </ul>
            </div>
            <div id="myTabContent" class="tab-content">
              <div class="<%=tab[0]%>" id="Overview">
                <jsp:include page="Overview.jsp"></jsp:include>
              </div>
              <div class="<%=tab[1]%>" id="InBox">
               	<jsp:include page="InBox.jsp"></jsp:include>
              </div>
               <div class="<%=tab[2] %>" id="Booking">
              	<jsp:include page="Booking.jsp"></jsp:include>
              </div>
               <div class="<%=tab[3]%>" id="Organizing">
               <jsp:include page="Organizing.jsp"></jsp:include>
              </div>
              <div class="<%=tab[4]%>" id="Profile">
              <jsp:include page="Profile.jsp"></jsp:include>
              </div>
               <div class="<%=tab[5]%>" id="Account">
              <jsp:include page="Location.jsp"></jsp:include>
              </div>
              
            </div>
          </div>
     </div>