//구글맵 작성함수
function initMap() {
  //지도를 생성
  const map = new google.maps.Map(document.getElementById('map'), {
    //지도가 출력되면서 처음 표시될 화면의 좌표값과 줌사이즈, 스타일 등을 지정
    center: { lat: 36.4400456, lng: 127.9021017 },
    zoom: 7,
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
  google.maps.event.addListener(map, 'dragend', function() {showMarkersInViewport()});

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
      var gmarkers = [];
      for (var i = 0; i < loc.length; i++) {
        gmarkers.push(addMarker(loc[i]));
      }

     
      function addMarker(props) {
        var marker = new google.maps.Marker({
          position: props.coords,
          map: map,
        });
        
   
    //현재의 뷰페이지에 포함되어있는 마커의 좌표를 selected배열에 담습니다.
    function getPlace(a) {
    if (a == null || a == undefined) return null;
    var selected = [];
    for (i=0; i < loc.length; i++) {
        if (a.contains(new google.maps.LatLng(loc[i].coords.mapx, loc[i].coords.mapy))) {
            selected.push(loc[i]);
        }
    }
    return selected;
 }
        
      


        //마커 클릭이벤트
        if (props.content) {
          var infoWindow = new google.maps.InfoWindow({
            content: props.content,
          });
          marker.addListener('click', function () {
            infoWindow.open(map, marker);
          });
        }
        return marker;
      }
      
   
        
      //마커 클러스터링
      var markerCluster = new MarkerClusterer(map, gmarkers, {
        imagePath:
          'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',
      });

      //리스트 정보 출력
      var glist = [];
      for (var i = 0; i < loc.length; i++) {
        glist.push(addList(loc[i]));
      }

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
    },
  });
}

//google.maps.event.addDomListener(window, 'load', initMap);

