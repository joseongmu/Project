 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
   <%@include file="../../CommonT.jsp" %>
   <%@include file="../../DBcon.jsp" %>
   <%
   /// 고칠것 query 문 및 데이터 가져오는 것,
   try{
		String query = "SELECT user_id,title,category,img1,price FROM content order by cratedat desc";
		Conn=DriverManager.getConnection(url,db_user,db_passwd);
		pstmt = Conn.prepareStatement(query);
		rs = pstmt.executeQuery();
	 if(rs.next()) {
	        user_id = rs.getString("user_id");
	        title = rs.getString("title");    
	        category = rs.getString("category");
	        img1 = rs.getString("img1");
	        price = rs.getString("price");
%>
 <div class="navbar navbar-fixed-top">
   <div class="navbar-inner">
     <div class="container">
       <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </a>
       <a class="brand" href="<%out.println(HomeLink);%>">Go With</a>
      <div class="nav-collapse">
          <ul class="nav">
            <li class="active"><a href="#">Find someting to do
           &nbsp;&nbsp;&nbsp;&nbsp;
            </a></li>
          </ul>
          <form class="navbar-search pull-left" action="">
            <input type="text" class="search-query span2" placeholder="Search">
          </form>
          <ul class="nav pull-right">
          	<li class="divider-vertical"></li>
            <li><a href="#"><i class="icon-search icon-white"></i></a></li>
            <li class="divider-vertical"></li>
            <li><a href="<%out.println(DashBoardLink);%>"><i class="icon-star icon-white"></i></a></li>
            <li class="divider-vertical"></li>
            <li><a href="#"><i class="icon-envelope icon-white"></i></a></li>
            <li class="divider-vertical"></li>
            <li><a data-toggle="modal" href="#betaModal">Login 안된상태</a> </li>
             <li class="divider-vertical"></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Login 된상태 <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<%out.println(DashBoardLink);%>"><i class="icon-tags"></i> DashBoard</a></li>
                <li><a href="<%out.println(DashBoardLink);%>"><i class="icon-user"></i>  My profile</a></li>
                <li><a href="#"><i class="icon-bookmark"></i>  Account</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="icon-off"></i>  Sign Out</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>


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
                <img class="logoicon" src="http://placehold.it/300x300/bbb/&text=Your%20Logo" alt="App Logo"/>
            </div>
            </div>
            <div class="span6">
                <form class="form-horizontal">
                    
                    <p class="help-block">Email_Address</p>
                    <div class="input-prepend">
                        <span class="add-on">@</span><input class="prependedInput" size="16" type="email">
                    </div>
                    <p class="help-block">Password</p>
                    <div class="input-prepend">
                        <span class="add-on">★</span><input class="prependedInput" size="16" type="password">
                    </div>
                  	<hr>
                    <div class="help-block">
                        <button type="submit" class="btn btn-primary btn-block">+ Login +</button>
                        <label style="text-align:center;margin-top:5px">or</label>
                        <button type="button" class="btn btn-primary btn-block" onclick="location.href('http://localhost:8080/GowithProject0.01/index.jsp')">Sign in</button>
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
<%
	}
}catch(Exception e){
		out.println(e);
}finally {
	// 무슨 일이 있어도 리소스를 제대로 종료
	if (rs != null) try{rs.close();} catch(SQLException e) {}
	if (pstmt != null) try{pstmt.close();} catch(SQLException e) {}
	if (Conn != null) try{Conn.close();} catch(SQLException e) {}
}
 %>
      