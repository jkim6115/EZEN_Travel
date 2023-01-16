<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro Page</title>
</head>
<link rel="stylesheet" href="resources/css/intro.css" />
<body>
	<header class="et header"><!-- 헤더 -->
        <div class="login"><!-- 카테고리 전체 div -->
          <ul class="login_list"><!-- 카테고리 리스트 ul -->
            <li><a class="login_button" href="javascript:kakaoLogin()"><img src="resources/image/로그인.png"
              />로그인</a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script src="resources/js/login.js"></script></li>
					
			<li><a class="logout_button" href="javascript:kakaoLogout()"><img src="resources/image/로그아웃.png"
              />로그아웃</a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script src="resources/js/logout.js"></script></li>

			<li><a class="secession_button" href="javascript:secession()"><img src="resources/image/회원탈퇴.png"
              />회원탈퇴</a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script src="resources/js/secession.js"></script></li>
          </ul>
          <form id="form-kakao-login" method="post" action="/controller/login.do">
		  		<input type="hidden" name="id"/>
		    	<input type="hidden" name="nickname"/>
		    	<input type="hidden" name="email"/>
		    	<input type="hidden" name="gender"/>
		    	<input type="hidden" name="age_range"/>
		    	<input type="hidden" name="profile"/>
		  </form>
        </div>
        <div class="et logo">
          <!--중앙로고배너-->
          <a href="./mainmap.do" class="logo_img">
            <img src="resources/image/logo.png" alt="로고" />
          </a>
        </div>
        <div class="category"><!-- 카테고리 전체 div -->
          <ul class="category_list"><!-- 카테고리 리스트 ul -->
            <li><a href="./board.do" class="category_button">E.T 광장</a></li>
            <li><a href="./intro.do" class="category_button">E.T 소개</a></li>
          </ul>
        </div>
      </header>
      
      <main>
      	<div id="wrap">
      		<h1 class="title">EZEN Travel 소개</h1>
      		<h2 class="member">
      			팀원 : 김요한, 박예림, 엄지찬, 유지은, 장원제  
      		</h2>
      		<p class="content">
      			EZEN Travel은 사용자에게 가장 많은 관심을 받은 관광지를 보여줍니다. 또한 관광지를
      			태그별로 분류하여 찾고자 하는 관광지를 쉽게 찾을 수 있도록 하고 있습니다.
      			사용자는 커뮤니티를 이용해 다른 사용자와 소통할 수 있습니다.
      		</p>
      	</div>
      </main>
      
      <footer class="et footer">
        <!-- 풋터 -->
        <div class="et info">
          <p>법인명(상호) : ezentravel</p>
          <p>
            Copyright © ezentravel. All rights reserved. Hosting by cafe24 corp.
          </p>
        </div>
      </footer>
      
      <div class="ocean">
        <!-- 바다 출력 div -->
        <div class="wave"></div>
        <!-- 바다 웨이브 출력 div -->
        <div class="wave"></div>
        <!-- 입체적효과 위해 웨이브 1개 추가 -->
      </div>
</body>
</html>