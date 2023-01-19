<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.ezentravel.DTO.Cm_boardDTO"%>
<%@ page import="com.ezentravel.DTO.PageDTO"%>
<!DOCTYPE html>
<html>

<%@include file="/WEB-INF/views/include/board/boardHead.jsp"%>

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
	<section class="et commu_section">
		<!-- 커뮤니티 게시판 -->
		<div class="board_wrap">
			<div class="board_btn">
				<!-- 리스트 글쓰기 버튼 -->
				<form id="frm_wr" name="frm_wr" method="get" action="write.do">
						<input type="button" id="write" value="글쓰기" />
						<input type="hidden" id="user_num" value="${sessionScope.user_num}" />
				</form>
			</div>
			<!-- 게시판 리스트 출력 -->
			<table class="board_box">
				<caption hidden>커뮤니티 리스트</caption>
				<colgroup> <!-- 게시판 각 항목 별 크기 값 -->
					<col style="width: 10%" />
					<col />
					<col style="width: 10%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
				</colgroup>
				<thead id="board_head">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody id="board_info">
					<!-- 게시판 표시 -->
					<c:forEach items="${gList}" var="dto">
						<tr>
							<td>${dto.bno}</td>
							<td>
								<%-- 게시판 넘어가는 url 밸류값 --%>
								<%-- 현재 페이지, 게시판 번호, 검색 키워드, 검색 단어 --%>
								<c:url var="path" value="view.do">
									<%-- <c:param name=""></c:param> --%>
									<c:param name="currentPage" value="${pv.currentPage}" />
									<c:param name="num" value="${dto.bno}" />
									<c:param name="searchKey" value="${pv.searchKey}" />
									<c:param name="searchWord" value="${pv.searchWord}" />
								</c:url> 
								<%-- 제목 클릭시 path값 같이 보내면서 페이지 이동 --%>
								<a href="${path}">${dto.title}</a>
							</td>
							<td class="writer">${dto.nickname}</td>
							<td class="wr_date">${dto.create_date}</td>
							<td class="count">${dto.readcount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 게시판 페이지 리스트 -->
			<%-- 검색 키워드 작성 시 주소 값 뒤에 searchInfo로 값을 가져와 searchKey & searchWord가 붙게된다. --%>
			<div class="board_list">
				<div class="board_list_box">
					<!-- 이전 출력 시작 -->
					<c:if test="${pv.startPage>1}">
						<a href="board.do?currentPage=${pv.startPage-pv.blockPage}${pv.searchInfo}" class="prev"> 이전 </a>
					</c:if>
					<!-- 이전 출력 끝 -->

					<!-- 페이지 출력 시작 -->
					<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
						<span id="page_list"> 
						<c:url var="currPage" value="board.do">
							<c:param name="currentPage" value="${i}" />
						</c:url> 
						<c:choose>
							<c:when test="${i == pv.currentPage}">
								<a href="${currPage}${pv.searchInfo}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="${currPage}${pv.searchInfo}">${i}</a>
							</c:otherwise>
						</c:choose>
						</span>
					</c:forEach>
					<!-- 페이지 출력 끝 -->

					<!-- 다음 출력 시작 -->
					<c:if test="${pv.endPage<pv.totalPage}">
						<a href="board.do?currentPage=${pv.startPage+pv.blockPage}${pv.searchInfo}"	class="next"> 다음 </a>
					</c:if>
				</div>
			</div>

			<!-- 검색 창 -->
			<%-- 검색 기능 get방식으로 값 송출 후 리스트로 받음 --%>
			<form id="board_search" name="board_search" method="get">
				<fieldset>
					<legend class="blind" hidden="hidden">커뮤니티 내부 검색</legend>
					<div class="board_search_wrap">
					<%-- 검색 키워드 설정 --%>
						<select name="searchKey" class="search_type">
							<option value="search_all">제목+내용</option>
							<option value="search_title">제목</option>
							<option value="search+content">내용</option>
							<option value="search_writer">글쓴이</option>
						</select>
						<div class="board_search_box">
						<%-- 검색 키워드에 맞게끔 검색이 되도록하는 검색 박스 --%>
							<div class="inner_search">
								<input class="inner_keyword" type="text" name="searchWord" title="검색어 입력" />
							</div>
							<input type="button" value="검색" class="board_search_btn" />
						</div>
					</div>
				</fieldset>
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