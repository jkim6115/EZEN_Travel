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
      <header class="et header">
        <!-- 헤더 -->
        <div class="category">
          <!-- 카테고리 전체 div -->
          <ul class="category_list">
            <!-- 카테고리 리스트 ul -->
            <li><a href="#" class="category_button">로그인</a></li>
            <li><a href="#" class="category_button">커뮤니티</a></li>
            <li><a href="#" class="category_button">소개</a></li>
          </ul>
        </div>
        <div class="et logo">
          <!--중앙로고배너-->
          <a href="#" class="logo_img">
            <img src="resources/image/logo.png" alt="로고" />
          </a>
        </div>
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
        <div class="et info1">
          <p>고객센터</p>
          <p>070-4795-4042</p>
          <div id="bottomText">
            <p>월요일 ~ 금요일 / 10:00 - 17:00</p>
            <p>점심시간 12:00 - 13:00</p>
            <p>주말 및 공휴일 휴무</p>
          </div>
          <div id="bottomIcon">
            <p>
              <img
                src="resources/image/final_footer01.png"
                alt="01"
                id="icon1"
              />
              플러스 친구 : ezen_travel
            </p>
            <p>
              <img
                src="resources/image/final_footer02.png"
                alt="02"
                id="icon2"
              />
              인스타그램 : ezen_travel
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