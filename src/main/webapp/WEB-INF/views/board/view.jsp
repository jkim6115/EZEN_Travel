<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/view.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				// 목록 버튼
				$('#list').click(function() {
					alert('목록버튼');
					$('#frm').attr('action', 'board.do').submit();
				});

				// 수정 버튼
				$('#modify').click(function() {
					var mod = confirm('수정을 하시겠습니까?');
					if (mod) {
						// yes
						$('#frm').attr('action', 'update.do').submit();
					} else {
						// no	
					}
				});

				// 삭제 버튼
				$('#delete').click(function() {
					var del = confirm('삭제를 하시겠습니까?');
					if (del) {
						// yes
						alert('삭제되었습니다.');
						$('#frm').attr('action', 'delete.do').submit();
					} else {
						// no
					}

				});

				/* 아래부터 댓글 관련 */

				// 댓글 수정
				// this로 각 객체를 받아서 사용(개별 클릭을 위해)
				$('.cm_modify').on('click', this, function() {
					var mod = confirm('댓글을 수정하시겠습니까?');
					if (mod) {
						var pn = $(this).parents('form');
						// yes
						$(pn).attr('method', 'get');
						$(pn).attr('action', 'comment_up.do');
						$(pn).submit();
					} else {
						// no
					}
				});

				// 댓글 삭제
				// this로 각 객체를 받아서 사용(개별 클릭을 위해)
				$('.cm_delete').on('click', this, function() {
					var del = confirm('댓글을 삭제하시겠습니까?');
					if (del) {
						var de = $(this).parents('form');
						// yes
						alert('삭제합니다.');
						$(de).attr('method', 'post');
						$(de).attr('action', 'comment_del.do');
						$(de).submit();
					} else {
						// no
					}
				});

				// 댓글 등록
				$('.cm_up').click(
						function() {	
							if(`${gdto.user_num}`!=""){ 
								if ($('.cm_bx').val() == "") {
									alert('내용을 입력해주세요.');
									$('.cm_bx').focus();
									return false;
								}

								var up = confirm('댓글을 등록하시겠습니까?');
								if (up) {
									// yes
									alert('댓글이 등록되었습니다.');
									// 글 작성 시 엔터 값을 <br/>로 받기 위해 재설정을 한다.
									$('textarea[name=board_comment]').val(
											$('textarea[name=board_comment]').val()
													.replace(/\n/gi, '<br/>'));
									$('#frm3').attr('method', 'post');
									$('#frm3').attr('action', 'comment_wr.do');
									$('#frm3').submit();
								} else {
									// no
								}
							} else {
								alert('로그인 후 이용해주세요.');
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
	<section class="et board_section">
		<!-- 뷰 기본 화면 -->
		<div class="content_wrap">
			<!-- 게시글 본문 뷰 -->
			<div class="content_box">
				<form name="frm" id="frm" method="get">
					<!-- 수정 및 삭제 버튼 -->
					<div class="content_btn">
						<input type="hidden" name="bno" value="${cdto.bno}" /> 
						<input type="hidden" name="currentPage" id="currentPage"
							value="${currentPage}" />
						<c:set var="user" value="${cdto.user_num}" />
						<%-- 로그인을 한 사람에게만 수정 버튼과 삭제 버튼이 표시되도록 한다. --%>
						<c:if test="${cdto.user_num == gdto.user_num}">
						<input type="button" id="modify" value="수정" /> 
						<input type="button" id="delete" value="삭제" />
						</c:if>
						<input type="button" id="list" value="목록" />
					</div>
					<div class="content_info">
						<!-- 게시글 본문 -->
						<div class="content_head">
							<span class="title">${cdto.title}</span> 
							<span class="writer">${cdto.nickname}</span>
							<span class="content_date">${cdto.create_date}</span> 
							<span class="readcount">조회수 ${cdto.readcount}</span>
						</div>
						<div class="content_main">
							<p>${cdto.content}</p>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 댓글 -->
		<div class="comment_wrap">
			<div class="comment_view">
				<!-- 댓글 리스트 -->
				<div class="comment_list">
					<!-- 작성한 댓글 개수 표시 -->
					<h4 class="comment_titles">댓글 ${commentCount}</h4>
					<div class="comment_box">
						<%-- 작성된 댓글을 리스트로 보여준다. --%>
						<c:forEach items="${cList}" var="cmdto">
							<div class="comment_info">
								<form name="frm2" id="frm2">
									<div class="comment_wr_info">
										<p>작성자 ${cmdto.nickname}</p>
										<div class="comment_wr_date">${cmdto.comment_date}</div>
									</div>
									<div class="comment_contents">${cmdto.board_comment}</div>
									<div class="comment_btn">
										<input type="hidden" name="bno" value="${cmdto.bno}" /> 
										<input type="hidden" name="cno" value="${cmdto.cno}" /> 
										<input type="hidden" name="currentPage" value="${currentPage}" /> 
										<input type="hidden" name="board_comment" value="${cmdto.board_comment}" /> 
										<input type="hidden" name="user_num" value="${cmdto.user_num}" /> 
										<input type="hidden" name="comment_group" value="${cmdto.comment_group}" />
										<%-- 댓글을 작성한 유저에게만 보이도록 수정, 삭제 버튼이 표시되게 한다. --%>
										<c:if test="${cmdto.user_num == gdto.user_num}">
										<input type="button" class="cm_modify" value="수정" /> 
										<input type="button" class="cm_delete" value="삭제" />
										</c:if>

									</div>
								</form>
							</div>
						</c:forEach>

					</div>
				</div>
				<!-- 댓글 작성 -->
				<div class="comment_wr">
					<div class="comment_wr_info">
						<form name="frm3" id="frm3">
							<div class="comment_wrbox">
								<p>
									<textarea name="board_comment" rows="4" cols="40" class="cm_bx" style="resize: none"></textarea>
								</p>
								<input type="button" class="cm_up" value="댓글 등록" /> 
								<input type="hidden" name="currentPage" value="${currentPage}" /> 
								<input type="hidden" name="bno" value="${cdto.bno}" />
								<input type="hidden" name="user_num" value="${gdto.user_num}" />
								
							</div>
						</form>
					</div>
				</div>
			</div>
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