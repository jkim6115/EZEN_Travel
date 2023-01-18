<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="resources/css/update.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						/* 수정 및 취소 버튼 */
						$('#update').bind('click', updateRun);
						$('#cancel').bind('click', cancelRun);

						// 기존의 게시글을 수정하기 위해 <br/> 구문을 \n으로 재설정 한다.
						$('[name=content]').val(
								$('[name=content]').val().trim());
						$('[name=content]').val(
								$('[name=content]').val().replace(
										/<br\s?\/?>/g, "\n"));
					});

	function updateRun() {
		alert('수정');
		var update = confirm('수정하시겠습니까?');
		if (update) {
			// yes
			// 게시글 수정 시 엔터 값을 <br/>로 받기 위해 재설정 한다.
			$('[name=content]').val(
					$('[name=content]').val().replace(/\n/gi, '<br/>'));
			$('#frm').attr('action', 'update.do').submit();
		} else {
			// no
		}
	}

	function cancelRun() {
		alert('취소');
		var result = confirm('취소하시겠습니까?');
		if (result) {
			// yes
			// 이전 단계로 돌아간다.
			history.go(-1);
		} else {
			// no
		}
	}
</script>