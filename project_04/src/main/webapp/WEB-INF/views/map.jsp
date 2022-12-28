<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script 
      async
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap"
    ></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <link rel="stylesheet" href="map/map.css" />
    <script src="ajaxview/jquery.js"></script>
    <script src="map/map.js"></script>
	
</head>
 <body>
    <header class="et header">
      <div class="et login">
        <!--우측상단탭-->
        <ul class="login_list">
          <li><a href="#" class="login_button">로그인</a></li>
        </ul>
      </div>

      <div class="et logo">
        <!--중앙로고배너-->
        <h1 class="logo_img">
          <a href="#">
            <img src="resources/image/logo.png" alt="로고" />
          </a>
        </h1>
      </div>
      <div class="et category">
        <!--하단카테고리-->
        <ul class="category_list">
          <li><a href="#">태그필터</a></li>
          <li><a href="#">커뮤니티</a></li>
          <li><a href="#">소개</a></li>
        </ul>
      </div>
    </header>
    <div class="trand_slide_box">
      <p id="trand_slide_title">인기 여행지 추천</p>
      <div class="trand_slide">
        <ul class="trand_slide_list">
          <!-- 화살표 이미지 6장-->

          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs1" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs2" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs3" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs4" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs5" /></a>
          </li>
          <li>
            <a href="#"
              ><img src="https://placeimg.com/200/150/nature/6" alt="bs6"
            /></a>
          </li>
        </ul>
        <p class="trand_slide_controller">
          <span class="prev">&lang;</span>
          <span class="next">&rang;</span>
        </p>
      </div>
    </div>
    <section class="et section">
      <div class="map_box">
        <div id="map"></div>
      </div>
      <div class="list_box">
        <ol class="list">
        </ol>
      </div>
    </section>
    <!-- footer -->
    <footer class="et footer">
      <div class="et info1">
        <h4>고객센터</h4>
        <h4>070-4795-4042</h4>
        <div id="bottomText">
          <p>월요일 ~ 금요일 / 10:00 - 17:00</p>
          <p>점심시간 12:00 - 13:00</p>
          <p>주말 및 공휴일 휴무</p>
        </div>
        <div id="bottomIcon">
          <p>
            <img src="resources/image/final_footer01.png" alt="01" id="icon1"> 플러스 친구
            : ezen_travel
          </p>
          <p>
            <img src="resources/image/final_footer02.png" alt="02" id="icon2"> 인스타그램
            : ezen_travel
          </p>
        </div>
      </div>
      <div class="et info2">
        <p>법인명(상호) : ezentravel</p>
        <br />
        <p>
          Copyright © ezentravel. All rights reserved. Hosting by cafe24 corp.
        </p>
      </div>
    </footer>

    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap&v=weekly"
      defer
    ></script>
    <script type="text/javascript">
    let trand_slide = document.querySelector('.trand_slide_list'); //li를 담는 ul 컨테이너
    let trand_slide_list = document.querySelectorAll('.trand_slide_list > li'); //슬라이드 이미지 전체
    let currentIdx = 0; //슬라이드 index 값

    function moveSlide(num) {
    	trand_slide.style.left = -num * 226 + 'px';
    	trand_slide.style.transition = '0.5s';
      currentIdx = num;
    }

    let prev = document.querySelector('.prev'); //이전버튼
    let next = document.querySelector('.next'); //다음버튼

    prev.addEventListener('click', function () {
      if (currentIdx !== 0) moveSlide(currentIdx - 1);
    });

    let slideCount = trand_slide_list.length; //슬라이드 개수

    next.addEventListener('click', function () {
      //마지막 페이지엔 이미지 3개중 2개만 표시하고 마지막임을 알려줌
      if (currentIdx !== slideCount - 2) moveSlide(currentIdx + 1);
    });
    </script>
  </body>
</html>