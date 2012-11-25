<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>

<%
SESSION_USER_ID=	(String)session.getAttribute("SESSION_USER_ID");
try{

	query= "SELECT * From user WHERE Id=?";
	Conn = DriverManager.getConnection(url, db_user, db_passwd);
	pstmt = Conn.prepareStatement(query);
	pstmt.setString(1, SESSION_USER_ID);
	rs = pstmt.executeQuery();
	if(rs.next()){
		local = rs.getString("local");
		for(int i=0; i<8; i++){
						if(local==null){
							check[7]="checked";
						}else if(local.equals(areas[i])){
							check[i]="checked";
						}
		}
	}
}catch (SQLException e){
	errorMsg = "SQL 에러:" + e.getMessage();
}finally{
	if(rs != null) try{rs.close();}catch(SQLException e){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
	if(Conn != null) try{Conn.close();}catch(SQLException e){}
}
%>

<div class="span7 offset1">
  		<div class="prefix_1 grid_4 body-small-text">
		 <h3 class="list-header top-0px-margin text-26px">Tips &amp; Confirm</h3>
		 <p>기본적으로 저희는 고객님이 원하시는 경우에만 메일을 제공하도록 합니다.</p>
     <p>Mail을 받기 원하시면 Profile에서 E-Mail 주소를 다시 한번 확인 해주세요 </p>
    </div>

<div id="body" class="container_12">
	<div class="top-30px-margin">
		<div class="notice_settings grid_7">
      <form method="POST" action="Menu/DashBoard/Account_Update.jsp" class="uniForm no-validation">
				<div class="general-form">
				<fieldset class="inlineLabels">
	        <div class="notification-form">
	      		<h5>Email notifications</h5>
	 					<div class="clear"></div>
	        	<fieldset class="inlineLabels">
						<div class="ctrlHolder">
							<div class="grid_1 alpha omega"><input type="radio" id="none" name="area" value="수신거부" <%=check[7]%>></div>
	            <div class="grid_4 omega"><label for="none">메일을 받지 않겠습니다.</label>
	          	</div>
	          	<div class="clear"></div>
	          </div>
          	</fieldset>

  				<h5>Newsletters</h5>
          </div>
					<div class="ctrlHolder"><div class="grid_1 alpha omega"></div></div>
					
	          <div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_seoul" class="inline-label-field " value="서울"  id="" <%=check[0]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_seoul">서울에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in seoul</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
           	<div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_gyeonggi" value="경기도" class="inline-label-field "  id="" <%=check[1]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_gyeonggi">경기도에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in gyeonggi</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
            <div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_gangwon" value="강원도" class="inline-label-field "  id="" <%=check[2]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_gangwon">강원도에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in gangwon</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
           <div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_chungcheong" value="충청도" class="inline-label-field "  id="" <%=check[3]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_chungcheong">충청도에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in chungcheong</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
           	<div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_gyeongsang" value="경상도" class="inline-label-field "  id="" <%=check[4]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_gyeongsang">경상도에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in gyeongsang</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
            <div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_jeolla" value="전라도" class="inline-label-field "  id="" <%=check[5]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_jeolla">전라도에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in jeolla</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
            <div class="ctrlHolder">
              <div class="grid_1 alpha omega">
	              <input type="radio" name="area" id="account_jeju" value="제주도" class="inline-label-field "  id="" <%=check[6]%>/>
              </div>
              <div class="grid_5 omega"><label for="account_jeju">제주도에서 할수 있는것이 궁금하신가요?<br/>
              	<span class='fineprint-text'>I want exciting activities in jeju</span></label>
              </div>
              <div class="clear"></div>
            </div>
            
						<div class="standard-form-actions">
	            <button type="submit" class="gidsy-button green-button">Save Changes</button>
	          </div>
          </fieldset>
         </div>
     </form>
   </div>
 </div>
 </div>
</div>
