 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   <%@include file="../../CommonT.jsp" %>
   <%@include file="../../DBcon.jsp" %>
   <%
		SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");
		SESSION_Email=	(String)session.getAttribute("SESSION_Email");
		SESSION_Name=(String)session.getAttribute("SESSION_Name");
		SESSION_PF_IMG=(String)session.getAttribute("SESSION_PF_IMG");
		SESSION_INTRODUCE=(String)session.getAttribute("SESSION_INTRODUCE");
		SESSION_AUTH=(String)session.getAttribute("SESSION_AUTH");
   %>
<!-- Main top 네비게이션 -->
 <div class="navbar navbar-fixed-top">
				   <div class="navbar-inner">
								     <div class="container">
								     
										       <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
											         <span class="icon-bar"></span>
											         <span class="icon-bar"></span>
											         <span class="icon-bar"></span>
										       </a>
										       
									       		<a class="brand" href="<%=HomeLink%>">Go With</a>
									       		
										      <div class="nav-collapse">
										      
											          <ul class="nav">
											            <li class="active"><a href="<%=SearchLink%>">Find someting to do</a></li>
											          </ul>
											          
											          <form class="navbar-search pull-left" action="<%=SearchLink%>" method="post">
											             <input type="text" class="search-query span2" placeholder="Search" name="location">
											          </form>
											          
												          <ul class="nav pull-right">
														          	<li class="divider-vertical"></li>
														            <li><a href="<%=SearchLink%>?location="><i class="icon-search icon-white"></i></a></li>
														            
														             <% if(SESSION_USER_ID==null){%>
														            <li class="divider-vertical"></li>
														            <li><a href="<%=HelloLink%>">We are gowith</a></li>
														            
														            <li class="divider-vertical"></li>
														            <li><a href="<%=SignupLink%>">Sign up</a></li>
														              
														            
														            <li class="divider-vertical"></li>
														            <li><a data-toggle="modal" href="#betaModal">   Login   </a> </li>
																				<li class="divider-vertical"></li>
																				
														           <%}else if(SESSION_USER_ID!=null){%>
														            <li class="divider-vertical"></li>
														            <li><a href="<%=DashBoardLink%>"><i class="icon-star icon-white"></i></a></li>
														            
														            <li class="divider-vertical"></li>
														            <li><a href="<%=MailingLink%>"><i class="icon-envelope icon-white"></i></a></li>
														            
														            <li class="divider-vertical"></li>
														            <li class="dropdown">												            
														            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="Profile_img/<%= SESSION_PF_IMG%>" id="top_pf_img"/><span class="top_user_name"><%if(SESSION_Name.length()>9){ out.print(SESSION_Name.substring(0,8)+"...");}else{out.print(SESSION_Name);}%></span> <b class="caret"></b></a>
														              
														              <ul class="dropdown-menu">
														              
														                <li><a href="<%=DashBoardLink%>"><i class="icon-tags"></i> DashBoard</a></li>
														                <li><a href="<%=ProfileLink%>"><i class="icon-user"></i>  My profile</a></li>
														                <li><a href="<%=AccountLink%>"><i class="icon-bookmark"></i>  Account</a></li>
														                <li class="divider"></li>
														                <li><a href="<%=SignOutLink%>"><i class="icon-off"></i>  Sign Out</a></li>
														              </ul>
												            		</li>
												            		<%}%>
												            
												          </ul>
										        </div>
								      </div>
				    </div>
  </div>
  

<!--로그인 Modal -->
<div id="betaModal" class="modal hide fade">
		    <div class="modal-header">
		            <button class="close" data-dismiss="modal">×</button>
		            <h3>Login</h3>
		    </div>
		    
				<div class="modal-body">
				    <div class="row-fluid">
						        <div class="span12">
						        
							        		<div class="span6">
										            <div class="logowrapper">
										                <img class="logoicon" src="img/login_img.png" alt="login_view"/>
										            </div>
							            </div>
							            
							            <div class="span6">
										                <form class="form-horizontal" action="Login/Login_confirm.jsp" method="post">
										                    
										                    <p class="help-block">Email_Address</p>
										                    
										                    <div class="input-prepend">
										                        <span class="add-on">@</span><input class="prependedInput" size="16" type="email" name="email_address">
										                    </div>
										                    
										                    <p class="help-block">Password</p>
										                    
										                    <div class="input-prepend">
										                        <span class="add-on">★</span><input class="prependedInput" size="16" type="password" name="password">
										                    </div>
										                    
										                  	<hr>
										                    <div class="help-block">
										                        <button type="submit" class="btn btn-primary btn-block">+ Login +</button>
										                        <label style="text-align:center;margin-top:5px">or</label>
										                        <button type="button" class="btn btn-primary btn-block" onclick="location.href='<%=SignupLink%>'" style="cursor:hand;">Sign up</button>
										                    </div>
										                    
										                </form>
							            </div>
						        </div>
				    </div>
				</div>
				
				<div class="modal-footer">
				        <p><i>Copyright © GoWith. All rights reserved.</i></p>
				</div>
</div>
      