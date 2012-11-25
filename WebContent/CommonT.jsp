<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/***********공통으로 쓸 변수 Page***********/
// ex) String URl ="http://localhost:8080/index.jsp";
// ex) String name= null;
// 그래서 이 파일을 include 해서 공통으로 쓰는 변수나 url을 다시 바꾸지 
// 않고 여기서만 수정하면 전부 바뀌도록 설정..
/*************************************/

//Mainview/main.jsp에서 사용한 변수  content DB내용 가져올때 사용한 변수
String location =null;
String user_id = null;
String title = null;
String description=null;
String category =null;
int num_people =0;
int duration =0;
String meetingpoint =null;
int meetingtime =0;
String[] areas = {"서울","경기도","강원도","충청도","경상도","전라도","제주도","수신거부"};
String[] check = {"","","","","","","",""};
String profile_img = null;
String img1 = null;
String price = null;
String userid = null;
String SESSION_USER_ID=null;
String errorMsg=null;
String nextpage=null;
String view=null;
	String activeClass=null;
	String activeClass2=null;
	String activeClass3=null;
	String  tabClass=null;
	String  tabClass2=null;
	String  tabClass3=null;
	int title_num =0;
//Mainview/top/top.jsp에서 Link 관련 목록
String HomeLink="http://localhost:8080/gowith/index.jsp";
String DashBoardLink="http://localhost:8080/gowith/DashBoardView.jsp";
String ProfileLink="http://localhost:8080/gowith/Profile.jsp";
String OrganizingLink="http://localhost:8080/gowith/DashBoardView.jsp?view=organ";
String BookLink="http://localhost:8080/gowith/DashBoardView.jsp?view=book";

%>