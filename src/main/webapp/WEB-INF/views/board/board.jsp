<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ezentravel.DTO.Cm_boardDTO"%>
<%@ page import="com.ezentravel.DTO.PageDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board.css" />
<style type="text/css">
#board_wrap {
	widtho: 80%;
	margin: 10px auto;
}

table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

#page_list a {
	text-decoration: none;
	color: black;
}

#board_search {
	width: 500px;
}

.search_type {
	float: left;
}

.board_search_box {
	float: left;
}

.inner_search {
	float: left;
}

.board_search_btn {
	float: left;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 현재 페이지 표시
						// 현재 페이지는 굵은 글씨로 표시된다.
						var page = $('span#page_list a');
						$.each(page, function(index, value) {
							if ($(value).text() == '${pv.currentPage}') {
								$(value).css({
									'font-size' : 'larger'
								});
								return;
							}
						});

						// 검색 버튼 쿼리문
						$('.board_search_btn').click(function() {
							$('#board_search').attr('action', 'board.do'); 
							$('#board_search').submit(); // 게시판 리스트로 다시 값을 보냄
						});

						// 검색 버튼 결과 값 확인
						var sKey = '${pv.searchKey}';
						if (sKey == 'search_all' || // 전체 검색 (제목 + 내용)
							sKey == 'search_title' || // 제목 검색
							sKey == 'search_content' || // 내용 검색
							sKey == 'search_writer') { // 글쓴이 검색
							$('[name=searchWord]').val('${pv.searchWord}');
							$('[name=searchKey]').val('${pv.searchKey}');
						}
					});
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
				<a href="http://localhost:8090/controller/mainmap.do"> <img src="resources/image/logo.png" alt="로고" />
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
	<section class="et commu_section">
		<!-- 커뮤니티 게시판 -->
		<div class="board_wrap">
			<div class="board_btn">
				<!-- 리스트 글쓰기 버튼 -->
				<form id="frm_wr" name="frm_wr" method="get" action="write.do">
					<c:if test="${user_num == null}">
						<!-- 회원 정보 확인 후 글쓰기 이용 여부 표출 -->
						<script type="text/javascript">
							alert = "로그인 후 이용해 주세요";
						</script>
					</c:if>
					<!-- 회원만 글을 쓸 수 있게끔 한다. (로그인 완료 후 다시 체크해야함) -->
					<input type="submit" id="write" value="글쓰기" />
				</form>
			</div>
			<!-- 게시판 리스트 출력 -->
			<table class="board_box">
				<caption hidden>커뮤니티 리스트</caption>
				<colgroup> <!-- 게시판 각 항목 별 크기 값 -->
					<col style="width: 10%" />
					<col />
					<col style="width: 10%" />
					<col style="width: 10%" />
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