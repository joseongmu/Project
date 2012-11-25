<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../../../CommonT.jsp" %>
    <% nextpage = request.getParameter("next"); %>
		<div class="span3" >
		     <%if(nextpage==null) {%>
							<div class="form-horizontal well">
							<h5>Making-Organizing-Order</h5>
							</div>
							<div class="form-horizontal-well">			
							 <span class="info-icon"></span><span class="form_label_text">Basic information</span>
							</div>
							<div class="form-horizontal well">			
							 <span class="photo-icon"></span><span class="form_label_text">Photos</span>
							</div>
							<div class="form-horizontal well">			
							 <span class="calendar-icon"></span><span class="form_label_text">Calender</span>
							</div>
							<div class="form-horizontal well">			
							 <span class="promote-icon"></span><span class="form_label_text">Promote</span>
							</div>
				<%}else if(nextpage.equals("photo")){ %>
						<div class="form-horizontal well">
						<h5>Making-Organizing-Order</h5>
						</div>
						<div class="form-horizontal well">			
						 <span class="info-icon"></span><span class="form_label_text">Basic information</span>
						</div>
						<div class="form-horizontal-well">			
						 <span class="photo-icon"></span><span class="form_label_text">Photos</span>
						</div>
						<div class="form-horizontal well">			
						 <span class="calendar-icon"></span><span class="form_label_text">Calender</span>
						</div>
						<div class="form-horizontal well">			
						 <span class="promote-icon"></span><span class="form_label_text">Promote</span>
						</div>
			<%}else if(nextpage.equals("calender")){ %>
						<div class="form-horizontal well">
						<h5>Making-Organizing-Order</h5>
						</div>
						<div class="form-horizontal well">			
						 <span class="info-icon"></span><span class="form_label_text">Basic information</span>
						</div>
						<div class="form-horizontal well">			
						 <span class="photo-icon"></span><span class="form_label_text">Photos</span>
						</div>
						<div class="form-horizontal-well">			
						 <span class="calendar-icon"></span><span class="form_label_text">Calender</span>
						</div>
						<div class="form-horizontal well">			
						 <span class="promote-icon"></span><span class="form_label_text">Promote</span>
						</div>
				<%} %>
		</div>