<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/head/commonHead.jsp"%>
<%@include file="/WEB-INF/views/head/viewHead.jsp"%>
</head>
<body>
	<!-- 메인페이지 전체 div-->
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
		<!-- 섹션 영역 -->
		<section class="et board_section">
			<!-- 뷰 기본 화면 -->
			<div class="content_wrap">
				<!-- 게시글 본문 뷰 -->
				<div class="content_box">
					<form name="frm" id="frm" method="get">
						<!-- 수정 및 삭제 버튼 -->
						<div class="content_btn">
							<input type="hidden" name="bno" value="${cdto.bno}" /> <input
								type="hidden" name="currentPage" id="currentPage"
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
								<span class="title">${cdto.title}</span> <span class="writer">${cdto.nickname}</span>
								<span class="content_date">${cdto.create_date}</span> <span
									class="readcount">조회수 ${cdto.readcount}</span>
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
											<input type="hidden" name="bno" value="${cmdto.bno}" /> <input
												type="hidden" name="cno" value="${cmdto.cno}" /> <input
												type="hidden" name="currentPage" value="${currentPage}" />
											<input type="hidden" name="board_comment"
												value="${cmdto.board_comment}" /> <input type="hidden"
												name="user_num" value="${cmdto.user_num}" /> <input
												type="hidden" name="comment_group"
												value="${cmdto.comment_group}" />
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
										<textarea name="board_comment" rows="4" cols="40"
											class="cm_bx" style="resize: none"></textarea>
									</p>
									<input type="button" class="cm_up" value="댓글 등록" /> <input
										type="hidden" name="currentPage" value="${currentPage}" /> <input
										type="hidden" name="bno" value="${cdto.bno}" /> <input
										type="hidden" name="user_num" value="${gdto.user_num}" />

								</div>
							</form>
						</div>
					</div>
				</div>
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