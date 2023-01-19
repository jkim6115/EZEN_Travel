<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/detail/detailHead.jsp"%>

  <body>
    <form>
      <input id="area_num" value="${area_num}" type="hidden" />
    </form>
    
     <!-- 메인페이지 전체 div-->
    <div class="view_main">

	<!-- 로그인/로그아웃 전환 -->
		<c:choose>
			<c:when test="${empty sessionScope.user_num}">
				<div id="login">
					<tiles:insertAttribute name="login" />
				</div>
			</c:when>
			<c:otherwise>
				<div id="logout">
					<tiles:insertAttribute name="logout" />
				</div>
			</c:otherwise>
		</c:choose>

      <!-- 상세 정보 표시 -->
      <section class="et detail_section">
        <div class="detail_box">
          <div id="detail_title"></div>
          <div id="detail_img"></div>
          <h4 class="detail_info">관광지 소개</h4>
          <div class="slide_btn_box">
            <!-- jsp작성필요 -->
            <button type="button" class="slide_btn_prev">&lang;</button>
            <button type="button" class="slide_btn_next">&rang;</button>
          </div>
          <div id="detail_src"><p></p></div>
          <div id="detail_web"><p></p></div>
        </div>
      </section>

      <!-- 푸터 -->
	  <div id="footer">
		  <tiles:insertAttribute name="footer" />
	  </div>
      
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
