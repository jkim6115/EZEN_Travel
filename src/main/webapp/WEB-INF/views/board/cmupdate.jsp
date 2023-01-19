<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%@include file="/WEB-INF/views/include/board/cmupdateHead.jsp"%>
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
	<!-- 댓글 수정 -->
		<div class="comment_update_wrap">
			<form name="frm" id="frm" method="post">
				<div class="comment_main">
					<textarea rows="13" cols="40" name="board_comment" id="board_comment" style="resize: none">${dto.board_comment}</textarea>
				</div>
				<div class="update_btn">
				    <input type="hidden" name="user_num" value="${dto.user_num}" />
					<input type="hidden" name="cno" value="${dto.cno}" />
					<input type="hidden" name="bno" value="${dto.bno}" />
					<input type="hidden" name="currentPage" value="${currentPage}" />
					<input type="hidden" name="comment_group" value="${dto.comment_group}" />									
					<input type="button" id="update" value="수정" />
					<input type="button" id="cancel" value="취소" />
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