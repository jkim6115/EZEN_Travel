<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script 
      async
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap"
    ></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <link rel="stylesheet" href="map/map.css" />
    <!--  <script src="ajaxview/jquery.js"></script>-->
    <script src="map/map.js"></script>
	
</head>
 <body>
    <header class="et header">
      <div class="et login">
        <!--우측상단탭-->
        <ul class="login_list">
          <li><a href="javascript:kakaoLogin()"class="login_button">로그인</a>
           <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
                       <script src="resources/js/main.js"></script>
          </li>
        </ul>
      </div>

      <div class="et logo">
        <!--중앙로고배너-->
        <h1 class="logo_img">
          <a href="#">
            <img src="resources/image/logo.png" alt="로고" />
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
    <div class="trand_slide_box">
      <p id="trand_slide_title">인기 여행지 추천</p>
      <div class="trand_slide">
        <ul class="trand_slide_list">
          <!-- 화살표 이미지 6장-->

          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs1" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs2" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs3" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs4" /></a>
          </li>
          <li>
            <a href="#"><img src="resources/image/샘플1.jpg" alt="bs5" /></a>
          </li>
          <li>
            <a href="#"
              ><img src="https://placeimg.com/200/150/nature/6" alt="bs6"
            /></a>
          </li>
        </ul>
        <p class="trand_slide_controller">
          <span class="prev">&lang;</span>
          <span class="next">&rang;</span>
        </p>
      </div>
    </div>
    <section class="et section">
      <div class="map_box">
        <div id="map"></div>
      </div>
      <div class="list_box">
      <ul>
      <li>ddddd</li>
      </ul>
        <ol class="list">
        </ol>
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
            <img src="resources/image/final_footer01.png" alt="01" id="icon1"> 플러스 친구
            : ezen_travel
          </p>
          <p>
            <img src="resources/image/final_footer02.png" alt="02" id="icon2"> 인스타그램
            : ezen_travel
          </p>
        </div>
      </div>
      <div class="et info2">
        <p>법인명(상호) : ezentravel</p>
        <br />
        <p>
          Copyright © ezentravel. All rights reserved. Hosting by cafe24 corp.
        </p>
      </div>
    </footer>

    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap&v=weekly"
      defer
    ></script>
    <script type="text/javascript">
    let trand_slide = document.querySelector('.trand_slide_list'); //li를 담는 ul 컨테이너
    let trand_slide_list = document.querySelectorAll('.trand_slide_list > li'); //슬라이드 이미지 전체
    let currentIdx = 0; //슬라이드 index 값

    function moveSlide(num) {
    	trand_slide.style.left = -num * 226 + 'px';
    	trand_slide.style.transition = '0.5s';
      currentIdx = num;
    }

    let prev = document.querySelector('.prev'); //이전버튼
    let next = document.querySelector('.next'); //다음버튼

    prev.addEventListener('click', function () {
      if (currentIdx !== 0) moveSlide(currentIdx - 1);
    });

    let slideCount = trand_slide_list.length; //슬라이드 개수

    next.addEventListener('click', function () {
      //마지막 페이지엔 이미지 3개중 2개만 표시하고 마지막임을 알려줌
      if (currentIdx !== slideCount - 2) moveSlide(currentIdx + 1);
    });
    
    
    
  //구글맵 작성함수
    function initMap() {
      //지도를 생성
      const map = new google.maps.Map(document.getElementById('map'), {
        //지도가 출력되면서 처음 표시될 화면의 좌표값과 줌사이즈, 스타일 등을 지정
        center: { lat: 36.4400456, lng: 127.9021017 },
        zoom: 10,
        disableDefaultUI: true,
        styles: [
          {
            featureType: 'administrative',
            elementType: 'labels.text.fill',
            stylers: [
              {
                color: '#444444',
              },
            ],
          },
           
          {
            featureType: 'landscape',
            elementType: 'all',
            stylers: [
              {
                color: '#f2f2f2',
              },
            ],
          },
          {
            featureType: 'poi',
            elementType: 'all',
            stylers: [
              {
                visibility: 'off',
              },
            ],
          },
          {
            featureType: 'road',
            elementType: 'all',
            stylers: [
              {
                saturation: -100,
              },
              {
                lightness: 45,
              },
            ],
          },
          {
            featureType: 'road.highway',
            elementType: 'all',
            stylers: [
              {
                visibility: 'simplified',
              },
            ],
          },
          {
            featureType: 'road.arterial',
            elementType: 'labels.icon',
            stylers: [
              {
                visibility: 'off',
              },
            ],
          },
          {
            featureType: 'transit',
            elementType: 'all',
            stylers: [
              {
                visibility: 'off',
              },
            ],
          },
          {
            featureType: 'water',
            elementType: 'all',
            stylers: [
              {
                color: '#3d9fc7',
              },
              {
                visibility: 'on',
              },
            ],
          },
        ],
      });
      
      //전체 마커가 아닌 뷰페이지의 마커만 로드되도록 설정
      //google.maps.event.addListener(map, 'dragend', function() {showMarkersInViewport()});
     // google.maps.event.addListener(map, 'idle', function() {showMarkersInViewport()});
      

      
      var loc = []; //마커와 리스트에 출력할 db자료를 가져온뒤 배열 형태로 저장하기 위해 생성

      //직접 구현한 코드(ajax) =============================================================
      //db에 접속하여 데이터를 가져오기 위한 ajax함수
      $.ajax({
        type: 'POST',
        dataType: 'json',
        url: 'mainmap.do',
        success: function (data) {
          //alert("성공")  		//데이터베이스에 접근하여 데이터를 성공적으로 가져왔는지 확인하기 위한 구문
          // if (data['result'] == 'success'){}

          //반복문을 push형식으로 돌려 가져온 데이터를 누적시킴
          for (let i = 0; i < data.length; i++) {
            //loc배열에 dict형식으로 정보를 저장하고 필요할때 key값을 호출하여 사용
            loc.push({
              coords: {
                lat: parseFloat(data[i].area_mapy),
                lng: parseFloat(data[i].area_mapx),
              },
              content:
                '<h1>' +
                data[i].area_title +
                '</h1>' +
                '<img style="float:left; width:100px; margin-top:30px; margin-right:15px;" src="' +
                data[i].area_image + '">' +
                '<br>' +
                '<h2>업데이트 예정</h2>' +
                '<a>http:업데이트예정</a>',
              area_address1: data[i].area_address1,
              area_title: data[i].area_title,
              area_overview: data[i].area_overview,
              area_image: data[i].area_image,
            });
          }
          

          //============================================================================
        	  
        	  
// 전체 마커 찍기
showMarkersInViewport();
          console.log(airportsInViewport);
function showMarkersInViewport() {
          var airportsInViewport = [];
          airportsInViewport = getPlace(map.getBounds()); 
          
          
          // 전체 마커 찍기
        var gmarkers = [];
        for (var i = 0; i < loc.length; i++) {
          gmarkers.push(addMarker(airportsInViewport[i]));
          addList(airportsInViewport[i]);
        }
   
       
        function addMarker(props) {
         var marker = new google.maps.Marker({
            position: props.coords,
            map: map,
          });
        }
        
        //리스트 정보 출력
      

        function addList(props) {
          $('.list').append(
            ' <li><a href="#"><img src="' +
              data[i].area_image +
              '"/><h4>' +
              props.area_title +
              '</h4><p>주소: ' +
              props.area_address1 +
              '</p><p>' +
              props.area_overview +
              '</p></a></li>'
          );
        }
          
           
        
        function getPlace(a) {
        if (a == null || a == undefined) return null;
        var selected = [];
        for (i=0; i < loc.length; i++) {
            if (a.contains(new google.maps.LatLng(loc[i].coords.lat, loc[i].coords.lng))) {
                selected.push(loc[i]);
            }

        }
        return selected;
        
     }
          


            //마커 클릭이벤트
            //if (props.content) {
            //  var infoWindow = new google.maps.InfoWindow({
           //     content: props.content,
           //   });
           //   marker.addListener('click', function () {
           //     infoWindow.open(map, marker);
           //   });
          //  }
          //  return marker;
          
          
       
            
          //마커 클러스터링
          //var markerCluster = new MarkerClusterer(map, gmarkers, {
          //  imagePath:
          //    'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',
         // });
          }
         
        },
      });
      
    }
 
   
    //google.maps.event.addDomListener(window, 'load', initMap);


    </script>
  </body>
</html>