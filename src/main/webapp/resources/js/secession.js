window.Kakao.init('32e988cd47f5d946ffc7ef96c6419fef');
window.Kakao.Auth.setAccessToken(JSON.parse(sessionStorage.getItem('AccessKEY'))); //sessionStorage에 저장된 사용자 엑세스 토큰 받아온다.

function secession() {
    Kakao.API.request({
        url: '/v1/user/unlink',
        success: function(response) {
         
           let user_num = response.id;

	      $('#form-kakao-secession input[name=user_num]').val(user_num);	
		  // 사용자 정보가 포함된 폼을 서버로 제출한다.
		  document.querySelector('#form-kakao-secession').submit();
        
            console.log(response);
            // callback(); //연결끊기(탈퇴)성공시 서버에서 처리할 함수
            alert(user_num + " 회원정보가 삭제되었습니다.");
        },
        fail: function(error) {
        	alert("회원정보가 없습니다.");
            console.log('탈퇴 미완료')
            console.log(error);
        },
    });
};

//const sion = document.querySelector('#secession');
//sion.addEventListener('click', secession);
