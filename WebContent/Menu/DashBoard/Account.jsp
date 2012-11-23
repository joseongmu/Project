<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../DBcon.jsp" %>
<%@include file="../../CommonT.jsp" %>
<%
String errorMsg = "null";
String cssCheck= null;
String cssCheck2= null;
try{

	String query= "SELECT * From user WHERE Id=?";
	Conn = DriverManager.getConnection(url, db_user, db_passwd);
	pstmt = Conn.prepareStatement(query);
	pstmt.setInt(1, 1);
	rs = pstmt.executeQuery();
	if(rs.next()){
		String local = rs.getString("local");
		if(local==null){
			 cssCheck="checked";		
			 cssCheck2="";		
		}else if(local.equals("서울")){
			 cssCheck="";		
			 cssCheck2="checked";		
		}
	}
}catch (SQLException e){
	errorMsg = "SQL 에러:" + e.getMessage();
}finally{
	if(rs != null) try{rs.close();}catch(SQLException e){}
	if(stmt != null) try{stmt.close();}catch(SQLException e){}
	if(pstmt != null) try{pstmt.close();}catch(SQLException e){}
	if(Conn != null) try{Conn.close();}catch(SQLException e){}
}
%>
	    <form method="post">
	    	<div id=profile_wrap>
	    		<div class="account_area">
						<label class="radio"> 
							<input type="radio" name="account_area" value="none" id="account_none" <%=cssCheck%>>
							관심 지역을 선택하는 것을 원하지 않는경우에 체크 하십시오.
						</label>
					</div>
					
	    		<h5>관심사 지역 선택</h5>
	    		
					<div class="account_area">
						<label class="radio"> 
							<input type="radio" name="account_area" value="서울" id="account_seoul" <%=cssCheck2%>>
							관심사 지역으로 <b>서울</b>을 택하겠습니다.
						</label>
					</div>
					
					<div class="account_area">
						<label class="radio">
							<input type="radio" name="account_area" value="경기도" id="account_gyeonggi">
							관심사 지역으로 <b>경기도</b>를 택하겠습니다.
						</label>
					</div>
					<div class="account_area">
						<label class="radio">
							<input type="radio" name="account_area" value="강원도" id="account_gangwon">
							관심사 지역으로 <b>강원도</b>를 택하겠습니다.
						</label>
					</div>
					<div class="account_area">
						<label class="radio">
							<input type="radio" name="account_area" value="충청도" id="account_chungcheong">
							관심사 지역으로 <b>충청도</b>를 택하겠습니다.
						</label>
					</div>
					<div class="account_area">
						<label class="radio">
							<input type="radio" name="account_area" value="경상도" id="account_gyeongsang">
							관심사 지역으로 <b>경상도</b>를 택하겠습니다.
						</label>
					</div>
					<div class="account_area">
						<label class="radio">
							<input type="radio" name="account_area" value="전라도" id="account_jeolla">
							관심사 지역으로 <b>전라도</b>를 택하겠습니다.
						</label>
					</div>
					<div class="account_area">
						<label class="radio">
							<input type="radio" name="account_area" value="제주도" id="account_jeju">
							관심사 지역으로 <b>제주도</b>를 택하겠습니다.
						</label>
					</div>
					
	    	</div>
	    	<div>
	    		<input type="submit" name="account_submit" value="관심지역 선택">
	    	</div>
	    </form>
