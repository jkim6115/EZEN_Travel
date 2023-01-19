<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8" />
<title>EZEN Travel</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				/* 수정 및 취소 버튼 */
				$('#update').bind('click', updateRun);
				$('#cancel').bind('click', cancelRun);

				// 기존의 게시글을 수정하기 위해 <br/> 구문을 \n으로 재설정 한다.
				$('[name=board_comment]').val(
						$('[name=board_comment]').val().trim());
				$('[name=board_comment]').val(
						$('[name=board_comment]').val().replace(/<br\s?\/?>/g,
								"\n"));
			});

	function updateRun() {
		var update = confirm('수정하시겠습니까?');
		if (update) {
			// yes
			alert('수정되었습니다.')
			// 게시글 수정 시 엔터 값을 <br/>로 받기 위해 재설정 한다.
			$('[name=board_comment]').val(
					$('[name=board_comment]').val().replace(/\n/gi, '<br/>'));
			$('#frm').attr('action', 'comment_up.do').submit();
		} else {
			// no
		}
	}

	function cancelRun() {
		var result = confirm('취소하시겠습니까?');
		if (result) {
			//yes
			alert('취소되었습니다.')
			history.go(-1);
		} else {
			//no
		}
	}
</script>
<link rel="stylesheet" href="resources/css/common.css" />
<link rel="stylesheet" href="resources/css/board/cmupdate.css" />
</head>