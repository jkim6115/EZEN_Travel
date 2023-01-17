<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      <div id="login"><tiles:insertAttribute name="login" /></div>

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

      <div id="footer"><tiles:insertAttribute name="footer" /></div>
      
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
