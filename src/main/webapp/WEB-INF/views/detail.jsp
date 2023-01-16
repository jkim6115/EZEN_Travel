<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detail</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- 상세페이지 CSS -->
    <link rel="stylesheet" href="resources/css/detail.css" />
    <!-- 상세페이지 JS -->
    <script defer src="resources/js/detail.js"></script>
  </head>
  <body>
    <form>
      <input id="area_num" value="${area_num}" type="hidden" />
    </form>
    <div class="view_main">
      <!-- 메인페이지 전체 div-->
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
      </header>

      <!-- 상세 정보 표시 -->
      <section class="et detail_section">
        <div class="detail_box">
          <div id="detail_img"></div>
          <div class="slide_btn_box">
            <!-- jsp작성필요 -->
            <button type="button" class="slide_btn_prev">&lang;</button>
            <button type="button" class="slide_btn_next">&rang;</button>
          </div>
          <div id="detail_src"><p></p></div>
          <div id="detail_web"><p></p></div>
        </div>
      </section>

      <footer class="et footer">
        <!-- 풋터 -->
        <div class="et info">
          <p>법인명(상호) : ezentravel</p>
          <p>
            Copyright © ezentravel. All rights reserved. Hosting by cafe24 corp.
          </p>
        </div>
      </footer>
    </div>
    <div class="ocean">
      <!-- 바다 출력 div -->
      <div class="wave"></div>
      <!-- 바다 웨이브 출력 div -->
      <div class="wave"></div>
      <!-- 입체적효과 위해 웨이브 1개 추가 -->
    </div>
  </body>
</html>
