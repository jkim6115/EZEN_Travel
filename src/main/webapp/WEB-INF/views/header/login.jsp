<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <header class="et header"><!-- 헤더 -->
        <div class="category"><!-- 카테고리 전체 div -->
          <ul class="category_list"><!-- 카테고리 리스트 ul -->
            <li><a class="login_button" href="javascript:kakaoLogin()">로그인</a>
		    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script src="resources/js/login.js"></script></li>
          </ul>
          <form id="form-kakao-login" method="post" action="/controller/login.do">
		  		<input type="hidden" name="user_num"/>
		    	<input type="hidden" name="nickname"/>
		    	<!-- <input type="hidden" name="email"/>
		    	<input type="hidden" name="gender"/>
		    	<input type="hidden" name="age_range"/>
		    	<input type="hidden" name="profile"/> -->
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