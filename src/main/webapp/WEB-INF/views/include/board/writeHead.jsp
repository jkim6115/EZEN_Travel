<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8" />
<title>EZEN Travel</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				// 취소 버튼
				$('#cancel').click(function() {
					var result = confirm('취소하시겠습니까?');
					if (result) {
						// yes
						// 게시판으로 돌아가게끔 설정
						location.replace('board.do');
					} else {
						// no
					}
				});

				// 등록 버튼
				$('#update').click(
						function() {
							var up = confirm('등록하시겠습니까?');
							if (up) {
								// yes
								if ($('#title').val() == "") {
									alert('제목을 입력해주세요.');
									$('#title').focus();
									return false;
								}

								if ($('#content').val() == "") {
									alert('내용을 입력해주세요.');
									$('#content').focus();
									return false;
								}

								// 게시글 작성 시 엔터 값을 <br/>로 받기 위해 재설정 한다.
								$('[name=content]').val(
										$('[name=content]').val().replace(
												/\n/gi, '<br/>'));

								$('#frm').attr('action', 'write.do').submit();
							} else {
								// no
							}
						});

			});
</script>
<link rel="stylesheet" href="resources/css/common.css" />
<link rel="stylesheet" href="resources/css/board/write.css" />
</head>