<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/write.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 취소 버튼
	$('#cancel').click(function(){
		var result = confirm('취소하시겠습니까?');
		if(result){
			// yes
			// 게시판으로 돌아가게끔 설정
			location.replace('board.do');
		} else {
			// no
		}
	});
	
	// 등록 버튼
	$('#update').click(function(){
		var up = confirm('등록하시겠습니까?');
		if(up){
			// yes
			if($('#title').val() == ""){
				alert('제목을 입력해주세요.');
				$('#title').focus();
				return false;
			}
		
			if($('#content').val() == ""){
				alert('내용을 입력해주세요.');
				$('#content').focus();
				return false;
			}
			
			// 게시글 작성 시 엔터 값을 <br/>로 받기 위해 재설정 한다.
			$('[name=content]').val(
					$('[name=content]').val().replace(/\n/gi, '<br/>'));
		
			$('#frm').attr('action', 'write.do').submit();
		} else{
			// no
		}
	});	
	
	
	
});


</script>
</head>
<body>
	 <div class="view_main"><!-- 메인페이지 전체 div-->
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
<!-- 섹션 영역 -->
<section class="et content_section">
<!-- 게시글 작성 -->
	<div class="content_wrap">
		<form name="frm" id="frm" method="post">
			<div class="content_head">
				<div class="head_fi">
					<h2>글쓰기</h2>
				</div>
				
			</div>
			<div class="content_main">
				<div class="content_ti">
					<input type="text" name="title" id="title" value="" placeholder="제목을 입력해 주세요." />
				</div>
				<div class="content_co">
					<textarea cols="50" rows="20" name="content" id="content" style="resize:none" placeholder="내용을 입력해 주세요."></textarea>
				</div>
				<div class="head_btn">
					<input type="button" id="cancel" value="취소" />
					<input type="button" id="update" value="등록" />
				</div>
			</div>
		</form>
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
</body>
</html>
