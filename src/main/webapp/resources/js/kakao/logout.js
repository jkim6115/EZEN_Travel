window.Kakao.init('32e988cd47f5d946ffc7ef96c6419fef');
window.Kakao.Auth.setAccessToken(JSON.parse(sessionStorage.getItem('AccessKEY'))); //sessionStorage에 저장된 사용자 엑세스 토큰 받아온다.

function kakaoLogout() {
    if (!Kakao.Auth.getAccessToken()) {
        console.log('Not logged in.');
        return;
    }
    Kakao.Auth.logout(function(response) {
  		
        alert("로그아웃 되었습니다.");
        location.href = "logout.do";
    });
};