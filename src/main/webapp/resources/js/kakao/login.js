function saveToDos(token) {
  //item을 localStorage에 저장합니다.
  typeof Storage !== "undefined" &&
    sessionStorage.setItem("AccessKEY", JSON.stringify(token));
}

window.Kakao.init("32e988cd47f5d946ffc7ef96c6419fef");

function kakaoLogin() {
  window.Kakao.Auth.login({
    scope: "profile_nickname", //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
    success: function (response) {

      const {
        access_token,
        expires_in,
        refresh_token,
        refresh_token_expires_in,
        scope,
        token_type
      } = response;
    
      console.log(response)

      saveToDos(response.access_token); // 로그인 성공하면 사용자 엑세스 토큰 sessionStorage에 저장
      window.Kakao.API.request({
        // 사용자 정보 가져오기
        url: "/v2/user/me",
        success: (res) => {
          const kakao_account = res.kakao_account;
          
          let user_num = res.id;
          let nickname = res.kakao_account.profile.nickname;
          
          
	      $('#form-kakao-login input[name=user_num]').val(user_num);
	      $('#form-kakao-login input[name=nickname]').val(nickname);				

		  // 사용자 정보가 포함된 폼을 서버로 제출한다.
		  document.querySelector('#form-kakao-login').submit();
		  
          alert("로그인 성공");
        },
      });
    },
    fail: function (error) {
      console.log(error);
    },
  });
}

const login = document.querySelector("#kakaoLogin");
// login.addEventListener("click", kakaoLogin);
