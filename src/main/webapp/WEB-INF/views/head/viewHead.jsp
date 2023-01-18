<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
							if (`${gdto.user_num}` != "") {
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
											$('textarea[name=board_comment]')
													.val().replace(/\n/gi,
															'<br/>'));
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