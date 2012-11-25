<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../CommonT.jsp" %>
  	<div class="clear"></div>
    <div id="body" class="container_12">
		    <p class="fineprint-text help-text top-50px-margin"></p>
		          	<ul class="messages" id="site-messages">
			      					<li class="errorMsg">
										  <div class="message-wrapper">
										    <div class="message-text">E-mail address and/or  Password 가 일치 하지 않습니다. </div>
										  </div>
											</li>
								</ul>

		    
							 <div class="authentication-form prefix_4 grid_5 alpha omega">
							  			<div id="login_form" class="login-signup-form tabbed  display">
														<form action="Login/Login_confirm.jsp" class="login uniForm gidsy-form key-up-validation" method="post">
												        <div class="text-center">
												        
												          <a class="gidsy-button fb-button" href="<%=SignupLink%>">
												            Go with Sign up
												          </a>
												          
												          <p class="fineprint-text help-text top-10px-margin"></p>
												          
												        </div>
												        
												           
												        <div class="or-seperator">
												          <hr/>
												          <span>or</span>
												          <p class="fineprint-text help-text top-20px-margin"></p>
												        </div>
												        
															        <fieldset class="inlineLabels">
															          <div class="email-input">       
																								  <div id="div_id_login-email"  class="ctrlHolder  ">
																								      <label for="id_login-email" class="inline">
																								          E-mail
																								      </label>
																								      <input type="email"  name="email_address"  class="textinput required" id="email_address"class="inline-label-field  required" id="" />
																								  </div>
																								  
															          </div>
															          
															         <div id="div_id_login-password" class="ctrlHolder  ">
															         					<p class="fineprint-text help-text top-30px-margin"></p>
																					      <label for="id_login-password" class="inline">
																					          Password
																					      </label>
																					   		 <input type="password" name="password" class="passwordinput required" id="password"class="inline-label-field  required" id="" />
																				</div>
																				 <div class="button-bar">
																	            <button type="submit" class="gidsy-button green-button">
																	              Login
																	            </button>
																	        </div>
															  		</fieldset>
												  </form>
							  			</div>
							  	</div>
  	</div>
 
  