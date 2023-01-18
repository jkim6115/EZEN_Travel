<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 보드 CSS -->
<link rel="stylesheet" href="resources/css/board.css" />
<style type="text/css">
.board_wrap {
	width: 890PX;
	height:600px;
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
	width: 890px;
	height:50px;
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
	$(document).ready(function() {
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
						
						// 회원만 글쓸 수 있게끔 설정
						$('#write').click(function(){
							if(`${gdto.user_num}`!=""){
								$('#frm_wr').submit();
							}else{
								alert('로그인 후 이용해주세요.');
							}
						});
					});
</script>