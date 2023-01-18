<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="et header">
		<div class="et login">
			<ul class="login_list">
					
				<li><a class="logout_button" href="javascript:kakaoLogout()">로그아웃</a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script src="resources/js/logout.js"></script></li>

				<li><a class="secession_button" href="javascript:secession()">회원탈퇴</a>
					<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
					<script src="resources/js/secession.js"></script></li>
			</ul>
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