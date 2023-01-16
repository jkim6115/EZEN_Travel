<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Main Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- ajax -->
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <!-- 최신 JS코드 사용 -->
    <script async
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap"
    ></script>
    <!-- 구글맵 api 사용 키 -->
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <!-- 구글맵 마커클러스터 기능 -->
    <link rel="stylesheet" href="resources/css/main.css" />
    <!-- 메인페이지 CSS -->
    <script defer src="resources/js/map.js"></script>
    <!-- 지도 관련 JS -->
    <script defer src="resources/js/rankmap.js"></script>
    <!-- 슬라이드 관련 JS -->
  </head>
  <body>
    <div class="view_main"><!-- 메인페이지 전체 div-->
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
      <div class="trand_slide_box">
        <!-- 슬라이드와 텍스트를 담는 박스 -->
        <p id="trand_slide_title">인기 여행지 추천</p>
        <div class="trand_slide">
          <!-- 슬라이드를 담는 박스 -->
          <ul class="trand_slide_list">
            <!-- 전체 슬라이드 ul -->
          </ul>
          <p class="trand_slide_controller">
            <!-- 슬라이드 좌우 버튼 -->
            <span class="prev"><img src="resources/image/prev.png"
              /></span>
            <span class="next"><img src="resources/image/next.png"
              /></span>
          </p>
        </div>
      </div>
      <section class="et section">
        <!-- 섹션 -->
        <div class="et tag_fillter">
          <!-- 태그 필터 -->
          <ul class="tag_fillter_list">
          <li class="tag_fillter_item tag_fillter_active" value="13">
              <span class="tag_fillter_icon"
                ><img src="resources/image/전체.png"
              /></span>
              <span class="tag_fillter_text">전체</span>
            </li>
            <li class="tag_fillter_item" value="12">
              <span class="tag_fillter_icon"
                ><img src="resources/image/낮은산.png"
              /></span>
              <span class="tag_fillter_text">가벼운 산</span>
            </li>

            <li class="tag_fillter_item" value="1">
              <span class="tag_fillter_icon"
                ><img src="resources/image/높은산.png"
              /></span>
              <span class="tag_fillter_text">높은 산</span>
            </li>

            <li class="tag_fillter_item" value="6">
              <span class="tag_fillter_icon"
                ><img src="resources/image/바다.png"
              /></span>
              <span class="tag_fillter_text">바다 • 해변</span>
            </li>
            <li class="tag_fillter_item" value="10">
              <span class="tag_fillter_icon"
                ><img src="resources/image/폭포.png"
              /></span>
              <span class="tag_fillter_text">폭포</span>
            </li>
            <li class="tag_fillter_item" value="7">
              <span class="tag_fillter_icon"
                ><img src="resources/image/온천.png"
              /></span>
              <span class="tag_fillter_text">온천 • 휴양림</span>
            </li>
            <li class="tag_fillter_item" value="4">
              <span class="tag_fillter_icon"
                ><img src="resources/image/숲.png"
              /></span>
              <span class="tag_fillter_text">식물 • 천연기념물</span>
            </li>
            <li class="tag_fillter_item" value="8">
              <span class="tag_fillter_icon"
                ><img src="resources/image/사찰.png"
              /></span>
              <span class="tag_fillter_text">사찰</span>
            </li>
            <li class="tag_fillter_item" value="3">
              <span class="tag_fillter_icon"
                ><img src="resources/image/고려삼국.png"
              /></span>
              <span class="tag_fillter_text">고려 • 삼국 • 유적</span>
            </li>
            <li class="tag_fillter_item" value="2">
              <span class="tag_fillter_icon"
                ><img src="resources/image/서원향교.png"
              /></span>
              <span class="tag_fillter_text">서원 • 향교</span>
            </li>
            <li class="tag_fillter_item" value="0">
              <span class="tag_fillter_icon"
                ><img src="resources/image/전쟁운동.png"
              /></span>
              <span class="tag_fillter_text">전쟁 • 운동</span>
            </li>
            <li class="tag_fillter_item" value="9">
              <span class="tag_fillter_icon"
                ><img src="resources/image/위인.png"
              /></span>
              <span class="tag_fillter_text">위인 • 생가 • 건축물</span>
            </li>
            <li class="tag_fillter_item" value="11">
              <span class="tag_fillter_icon"
                ><img src="resources/image/생태체험.png"
              /></span>
              <span class="tag_fillter_text">농촌 • 생태 체험</span>
            </li>
            <li class="tag_fillter_item" value="5">
              <span class="tag_fillter_icon"
                ><img src="resources/image/아이들.png"
              /></span>
              <span class="tag_fillter_text">아이들 • 가족 체험</span>
            </li>
          </ul>
        </div>
        <div class="map_box">
          <!--구글맵 테두리 -->
          <div id="map"></div>
          <!-- 구글맵 -->
        </div>
        <div class="list_box">
          <!-- 리스트 전체 테두리 -->
          <ol class="list_info" id="listJs">
            <!-- 리스트를 출력할 ol -->
          </ol>
          <ol class="list_button">
            <!-- 리스트에 삽입할 버튼 ol -->
          </ol>
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
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap&v=weekly"
      defer
    ></script>
  </body>
</html>