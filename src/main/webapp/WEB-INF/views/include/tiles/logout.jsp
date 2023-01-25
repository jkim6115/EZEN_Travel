<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 헤더 -->
<header class="et header">
	<!-- kakao login/out -->
	<div class="kakao">
		<ul class="kakao_login">
			<li><a class="logout_button" href="javascript:kakaoLogout()">로그아웃</a>
				<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
				<script src="resources/js/kakao/logout.js"></script>
			
			</li>
			<li><a class="secession_button" href="javascript:secession()">회원탈퇴</a>
				<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
				<script src="resources/js/kakao/secession.js"></script></li>
		</ul>
		<form id="form-kakao-secession" method="post" action="/controller/secession.do">
			<input type="hidden" name="user_num" />
		</form>
	</div>
	
	<div class="category">
		<div class="category_mem">
	<img class="profile" src="${profile}" alt="kakao_profile_image">
		<h4>&nbsp;&nbsp;&nbsp;&nbsp;어서오세요, <%= session.getAttribute("nickname")%>님😍</h4>
		</div>
	</div>

	<!--중앙로고배너-->
	<div class="et logo">
		<a href="./mainmap.do" class="logo_img"> <img src="resources/image/logo.png" alt="로고" /></a>
	</div>
	<!-- 카테고리 전체 div -->
	<div class="category">
		<!-- 카테고리 리스트 ul -->
		<ul class="category_list">
			<li><a href="./board.do" class="category_button">E.T 광장</a></li>
			<li><a href="./intro.do" class="category_button">E.T 소개</a></li>
		</ul>
	</div>
</header>

