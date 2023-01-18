<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/head/commonHead.jsp"%>
<%@include file="/WEB-INF/views/head/mainHead.jsp"%>
</head>
<body>
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
		
		<!-- 슬라이드와 텍스트를 담는 박스 -->
		<div class="trand_slide_box">
			<p id="trand_slide_title">인기 여행지 추천</p>
			<!-- 슬라이드를 담는 박스 -->
			<div class="trand_slide">
				<!-- 전체 슬라이드 ul -->
				<ul class="trand_slide_list"></ul>
				<!-- 슬라이드 좌우 버튼 -->
				<p class="trand_slide_controller">
					<span class="prev"><img src="resources/image/prev.png" /></span> 
					<span class="next"><img src="resources/image/next.png" /></span>
				</p>
			</div>
		</div>
		
		<!-- 섹션 -->
		<section class="et section">
			<!-- 태그 필터 -->
			<div class="et tag_fillter">
				<ul class="tag_fillter_list">
					<li class="tag_fillter_item tag_fillter_active" value="13">
						<span class="tag_fillter_icon"><img src="resources/image/전체.png" /></span>
						<span class="tag_fillter_text">전체</span>
					</li>
					<li class="tag_fillter_item" value="12">
						<span class="tag_fillter_icon"><img src="resources/image/낮은산.png" /></span>
						<span class="tag_fillter_text">가벼운 산</span>
					</li>
					<li class="tag_fillter_item" value="1">
						<span class="tag_fillter_icon"><img src="resources/image/높은산.png" /></span>
						<span class="tag_fillter_text">높은 산</span>
					</li>
					<li class="tag_fillter_item" value="6">
						<span class="tag_fillter_icon"><img src="resources/image/바다.png" /></span>
						<span class="tag_fillter_text">바다 • 해변</span>
					</li>
					<li class="tag_fillter_item" value="10">
						<span class="tag_fillter_icon"><img src="resources/image/폭포.png" /></span>
						<span class="tag_fillter_text">폭포</span>
					</li>
					<li class="tag_fillter_item" value="7">
						<span class="tag_fillter_icon"><img src="resources/image/온천.png" /></span>
						<span class="tag_fillter_text">온천 • 휴양림</span>
					</li>
					<li class="tag_fillter_item" value="4">
						<span class="tag_fillter_icon"><img src="resources/image/숲.png" /></span>
						<span class="tag_fillter_text">식물 • 천연기념물</span>
					</li>
					<li class="tag_fillter_item" value="8">
						<span class="tag_fillter_icon"><img src="resources/image/사찰.png" /></span>
						<span class="tag_fillter_text">사찰</span>
					</li>
					<li class="tag_fillter_item" value="3">
						<span class="tag_fillter_icon"><img src="resources/image/고려삼국.png" /></span>
						<span class="tag_fillter_text">고려 • 삼국 • 유적</span>
					</li>
					<li class="tag_fillter_item" value="2">
						<span class="tag_fillter_icon"><img src="resources/image/서원향교.png" /></span>
						<span class="tag_fillter_text">서원 • 향교</span>
					</li>
					<li class="tag_fillter_item" value="0">
						<span class="tag_fillter_icon"><img src="resources/image/전쟁운동.png" /></span>
						<span class="tag_fillter_text">전쟁 • 운동</span>
					</li>
					<li class="tag_fillter_item" value="9">
						<span class="tag_fillter_icon"><img src="resources/image/위인.png" /></span>
						<span class="tag_fillter_text">위인 • 생가 • 건축물</span>
					</li>
					<li class="tag_fillter_item" value="11">
						<span class="tag_fillter_icon"><img src="resources/image/생태체험.png" /></span>
						<span class="tag_fillter_text">농촌 • 생태 체험</span>
					</li>
					<li class="tag_fillter_item" value="5">
						<span class="tag_fillter_icon"><img src="resources/image/아이들.png" /></span>
						<span class="tag_fillter_text">아이들 • 가족 체험</span>
					</li>
				</ul>
			</div>
			
			<!--구글맵 테두리 -->
			<div class="map_box">
				<!-- 구글맵 -->
				<div id="map"></div>
			</div>
			
			<!-- 리스트 전체 테두리 -->
			<div class="list_box">
				<!-- 리스트를 출력할 ol -->
				<ol class="list_info" id="listJs"></ol>
				<!-- 리스트에 삽입할 버튼 ol -->
				<ol class="list_button"></ol>
			</div>
		</section>
		
		<!-- 푸터 -->
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	
	<!-- 바다 출력 div -->
	<div class="ocean">
		<!-- 바다 웨이브 출력 div -->
		<div class="wave"></div>
		<!-- 입체적효과 위해 웨이브 1개 추가 -->
		<div class="wave"></div>
	</div>
	<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap&v=weekly"></script>
</body>
</html>