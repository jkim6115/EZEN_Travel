<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/update.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* 수정 및 취소 버튼 */
	$('#update').bind('click', updateRun);
	$('#cancel').bind('click', cancelRun);
	
	// 기존의 게시글을 수정하기 위해 <br/> 구문을 \n으로 재설정 한다.
	$('[name=content]').val($('[name=content]').val().trim());
	$('[name=content]').val($('[name=content]').val().replace(/<br\s?\/?>/g, "\n"));
});

function updateRun() {
	alert('수정');
	var update = confirm('수정하시겠습니까?');
	if(update){
		// yes
		// 게시글 수정 시 엔터 값을 <br/>로 받기 위해 재설정 한다.
		$('[name=content]').val($('[name=content]').val().replace(/\n/gi, '<br/>'));
		$('#frm').attr('action', 'update.do').submit();
	} else {
		// no
	}
}

function cancelRun(){
	alert('취소');
	var result = confirm('취소하시겠습니까?');
	if (result) {
		// yes
		// 이전 단계로 돌아간다.
		history.go(-1);
	} else {
		// no
	}
}
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
	<!-- 게시글 수정 -->
		<div class="update_wrap">
			<form name="frm" id="frm" method="post">
				<div class="update_head">			
					<p>제목</p>
					<input type="text" name="title" id="title" value="${dto.title}"/>
				</div>
				<div class="update_main">
					<textarea rows="13" cols="40" name="content" id="content" style="resize: none">${dto.content}</textarea>
				</div>
				<div class="update_btn">
					<input type="hidden" name="bno" value="${dto.bno}"/>
					<input type="hidden" name="currentPage" value="${currentPage}" />
					<input type="hidden" name="user_num" value="${dto.user_num}" />
					<input type="button" id="update" value="수정" />
					<input type="button" id="cancel" value="취소" />
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