<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/board/writeHead.jsp"%>

<body>
	 <div class="view_main"><!-- 메인페이지 전체 div-->
      
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
					<input type="hidden" name="user_num" value="${sessionScope.user_num}" />
					<input type="text" name="title" id="title" placeholder="제목을 입력해 주세요." size="131" style="height:20px;" />
				</div>
				<div class="content_co">
					<textarea cols="50" rows="20" name="content" id="content" style="resize:none" placeholder="내용을 입력해 주세요."></textarea>
				</div>
			</div>
			<div class="head_btn">
					<input type="button" id="cancel" value="취소" />
					<input type="button" id="update" value="등록" />
				</div>
		</form>
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
