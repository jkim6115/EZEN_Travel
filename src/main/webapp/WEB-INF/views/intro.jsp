<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intro Page</title>
</head>
<link rel="stylesheet" href="resources/css/intro.css" />
<body>
	<div class="view_main">
	<div id="login"><tiles:insertAttribute name="login" /></div>
      
      <section>
      	<div id="wrap">
      		<h1 class="title">EZEN Travel 소개</h1>
      		<h2 class="member">
      			팀원 : 김요한, 박예림, 엄지찬, 유지은, 장원제  
      		</h2>
      		<p class="content">
      			EZEN Travel은 사용자에게 가장 많은 관심을 받은 관광지를 보여줍니다. 또한 관광지를
      			태그별로 분류하여 찾고자 하는 관광지를 쉽게 찾을 수 있도록 하고 있습니다.
      			사용자는 커뮤니티를 이용해 다른 사용자와 소통할 수 있습니다.
      		</p>
      	</div>
      </section>
      
      <div id="footer"><tiles:insertAttribute name="footer" /></div>
      
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