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
	<!-- 헤더 영역 -->
	<header class="et header">
		<div class="et login">
			<!--우측상단탭-->
			<ul class="login_list">
				<li><a href="#" class="login_button">로그인</a></li>
			</ul>
		</div>

		<div class="et logo">
			<!--중앙로고배너-->
			<h1 class="logo_img">
				<a href="./mainmap.do"> <img src="resources/image/logo.png" alt="로고" />
				</a>
			</h1>
		</div>
		<div class="et category">
			<!--하단카테고리-->
			<ul class="category_list">
				<li><a href="#">태그필터</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">소개</a></li>
			</ul>
		</div>
	</header>
<!-- 섹션 영역 -->
	<section class="et content_section">
	<!-- 게시글 수정 -->
		<div class="update_wrap">
			<form name="frm" id="frm" method="post">
				<div class="update_head">			
					<span>제목</span>
					<input type="text" name="title" id="title" value="${dto.title}"/>
				</div>
				<div class="update_main">
					<textarea rows="13" cols="40" name="content" id="content">${dto.content}</textarea>
				</div>
				<div class="update_btn">
					<input type="hidden" name="bno" value="${dto.bno}"/>
					<input type="hidden" name="currentPage" value="${currentPage}" />	
					<input type="button" id="update" value="수정" />
					<input type="button" id="cancel" value="취소" />
				</div>
			</form>
		</div>
	</section>
<!-- footer -->
	<footer class="et footer">
		<div class="et info1">
			<h4>고객센터</h4>
			<h4>070-4795-4042</h4>
			<div id="bottomText">
				<p>월요일 ~ 금요일 / 10:00 - 17:00</p>
				<p>점심시간 12:00 - 13:00</p>
				<p>주말 및 공휴일 휴무</p>
			</div>
			<div id="bottomIcon">
				<p>
					<img src=resources/image/final_footer01.png alt="01" id="icon1">
					플러스 친구 : ezen_travel
				</p>
				<p>
					<img src=resources/image/final_footer02.png alt="02" id="icon2">
					인스타그램 : ezen_travel
				</p>
			</div>
		</div>
		<div class="et info2">
			<p>법인명(상호) : ezentravel</p>
			<br />
			<p>Copyright © ezentravel. All rights reserved. Hosting by cafe24
				corp.</p>
		</div>
	</footer>
</body>
</html>