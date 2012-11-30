<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import ="java.sql.*"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to GoWith</title>
		<%@include file="cssCon.jsp" %>
</head>
<body>
<jsp:include page="Mainview/top/top.jsp"></jsp:include><br/>
<div class="span12 offset2" >
  <div class="static-page">
    <div class="grid_10 prefix_2 team-page">
      <h1>Hello, we are Go with</h1>
      <div id="team_list">
        <ul>
        <!-- 강진원 소개  -->
          <li>
            <a href="" class="portrait">
              <img src="team/jinwon.jpg" alt="edial" class="team_image" />
              <span class="bio">
                <span class="bg"></span>
                <span class="text">
                Go with 에 오신 여러분 환영합니다. 이곳에서 당신의 친구와 여행을 떠나거나
                        새로운 친구를 찾아보세요. Go with 는 언제나 당신과 함께 합니다.
                </span>
              </span>
            </a>
            <div class="meta">
              <h5>강 진원 <em class="small-description-text">Student &amp; Developer</em></h5>
              <a href="https://www.facebook.com/jinwon.kang.hi" target="_blank">Facebook</a>
            </div>
          </li>
          <!-- 조성무 소개  -->
          <li>
            <a href="" class="portrait">
              <img src="team/img2.jpg" alt="edial" class="team_image" />
              <span class="bio">
                <span class="bg"></span>
                <span class="text">
                Go with 에 오신 여러분 환영합니다. 이곳에서 당신의 친구와 여행을 떠나거나
                        새로운 친구를 찾아보세요. Go with 는 언제나 당신과 함께 합니다.
                </span>
              </span>
            </a>
            <div class="meta">
              <h5>조 성무 <em class="small-description-text">Student &amp; Developer</em></h5>
              <a href="https://www.facebook.com/jinwon.kang.hi" target="_blank">Facebook</a>
            </div>
          </li>
          </li>
          <!-- 이정구 소개  -->
          <li>
            <a href="" class="portrait">
              <img src="team/myface.png" alt="edial" class="team_image" />
              <span class="bio">
                <span class="bg"></span>
                <span class="text">
                Go with 에 오신 여러분 환영합니다. 이곳에서 당신의 친구와 여행을 떠나거나
                        새로운 친구를 찾아보세요. Go with 는 언제나 당신과 함께 합니다.
                </span>
              </span>
            </a>
            <div class="meta">
              <h5>이 정구 <em class="small-description-text">Student &amp; Developer</em></h5>
              <a href="https://www.facebook.com/jinwon.kang.hi" target="_blank">Facebook</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<jsp:include page="Mainview/footer/footer.jsp"></jsp:include>
<script type="text/javascript">
    $(function() {
      $("#team_list .portrait").mouseenter(function() {
        $(".bio",this).stop().animate({
          opacity: 1
        },{
          duration: 200
        }).css("visibility","visible");
      }).mouseleave(function() {
        $(".bio",this).stop().animate({
          opacity: 0
        },{
          duration: 400,
          complete: function() {$(this).css("visibility","hidden")}
        })
      });
    });
</script>
</body>
</html>