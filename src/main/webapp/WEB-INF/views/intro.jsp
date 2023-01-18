<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/head/commonHead.jsp"%>
<%@include file="/WEB-INF/views/head/introHead.jsp"%>
</head>

<body>
	<div class="view_main">
		<!-- 로그인/로그아웃 전환 -->
		<c:choose>
			<c:when test="${empty sessionScope.id}">
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

		<section>
			<div id="wrap">
				<h1 class="title">EZEN Travel 소개</h1>
				<h2 class="member">팀원 : 김요한, 박예림, 엄지찬, 유지은, 장원제</h2>
				<p class="content">EZEN Travel은 사용자에게 가장 많은 관심을 받은 관광지를 보여줍니다.
					또한 관광지를 태그별로 분류하여 찾고자 하는 관광지를 쉽게 찾을 수 있도록 하고 있습니다. 사용자는 커뮤니티를 이용해
					다른 사용자와 소통할 수 있습니다.</p>
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
</body>
</html>