<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/***********공통으로 쓸 변수 Page***********/
// ex) String URl ="http://localhost:8080/index.jsp";
// ex) String name= null;
// 그래서 이 파일을 include 해서 공통으로 쓰는 변수나 url을 다시 바꾸지 
// 않고 여기서만 수정하면 전부 바뀌도록 설정..
/*************************************/
//공통
String query=null;
String query2=null;

//Mainview/top/top.jsp에서 Link 관련 목록
String HomeLink="http://localhost:8080/gowith/index.jsp";
String SearchLink="http://localhost:8080/gowith/SearchView.jsp";
String DashBoardLink="http://localhost:8080/gowith/DashBoardView.jsp";
String MailingLink="#";
String SignupLink="http://localhost:8080/gowith/SignUpView.jsp";
String HelloLink="http://localhost:8080/gowith/top/Hello.jsp";
String SignOutLink="http://localhost:8080/gowith/Login/LogOut.jsp";
String HelpCenterLink="http://localhost:8080/gowith/Helpcenter.jsp";
String FooterLink="http://localhost:8080/gowith/footerConstents.jsp";
//처리단.
String OrganizingLink="http://localhost:8080/gowith/DashBoardView.jsp?view=organ";
String BookLink="http://localhost:8080/gowith/DashBoardView.jsp?view=book";
String ProfileLink="http://localhost:8080/gowith/DashBoardView.jsp?view=pro";
String AccountLink="http://localhost:8080/gowith/DashBoardView.jsp?view=acco";

//Login/Login_confirm.jsp
String email_address=null;
String password=null;
String DB_email_address=null;
String DB_password=null;
String SESSION_USER_ID=null;
String SESSION_Email=null;
String SESSION_Name=null;
String SESSION_PF_IMG=null;
String SESSION_INTRODUCE=null;
String SESSION_AUTH=null;

//Login/User_register.jsp +//DashBoard/Profile.jsp
String DB_profile_img=null;
String nickname=null;
String Introduce=null;
String profile_img=null;
String password_current = null;
String password_new = null;
String password_confirm = null;
String local = null;

//Login/SignUp.jsp
String error=null;



//Mainview/main.jsp에서 사용한 변수  content DB내용 가져올때 사용한 변수
String user_id = null;
String title = null;
String description=null;
String category =null;
int num_people =0;
int duration =0;
String meetingpoint =null;
int meetingtime =0;

//DashBoard/Booking.jsp 
 String cratedat=null;
//
String[] areas = {"서울","경기도","강원도","충청도","경상도","전라도","제주도","수신거부"};
String[] check = {"","","","","","","",""};
String errorMsg=null;

String img1 = null;
String price = null;
String userid = null;
String nextpage=null;

String view=null;
//DashBoard/DashBoard.jsp 
String[] modecheck={"organ","book","pro","acco"};
String[] active={"","","","","",""};
String[] tab={"tab-pane fade","tab-pane fade","tab-pane fade","tab-pane fade","tab-pane fade","tab-pane fade"};


int Del_Id=0;

//Search
String location =null;
int title_num =0;





%>