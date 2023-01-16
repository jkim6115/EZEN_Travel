//태그필터 마우스오버 이벤트
const menuItems = document.querySelectorAll(".tag_fillter_item");
let previousSelectedItem = menuItems[0]; //초기값은 기본값으로 전체태그로 설정되어있다.

menuItems.forEach((item) => {
  //마우스엔터
  item.addEventListener("mouseenter", () => {
    previousSelectedItem.classList.remove("tag_fillter_active");
    previousSelectedItem = item;
    item.classList.add("tag_fillter_active");
  });
});

menuItems.forEach((item) => {
  //마우스리브
  item.addEventListener("mouseleave", () => {
    previousSelectedItem.classList.remove("tag_fillter_active");
    previousSelectedItem = menuItems[0];
    previousSelectedItem.classList.add("tag_fillter_active");
  });
});

var mapOptions = {
  //지도가 출력되면서 처음 표시될 화면의 좌표값과 줌사이즈, 스타일 등을 지정
  center: { lat: 36.4400456, lng: 127.9021017 },
  zoom: 7,
  disableDefaultUI: true,
  styles: [
    {
      featureType: "administrative",
      elementType: "labels.text.fill",
      stylers: [
        {
          color: "#444444",
        },
      ],
    },

    {
      featureType: "landscape",
      elementType: "all",
      stylers: [
        {
          color: "#f2f2f2",
        },
      ],
    },
    {
      featureType: "poi",
      elementType: "all",
      stylers: [
        {
          visibility: "off",
        },
      ],
    },
    {
      featureType: "road",
      elementType: "all",
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
      featureType: "road.highway",
      elementType: "all",
      stylers: [
        {
          visibility: "simplified",
        },
      ],
    },
    {
      featureType: "road.arterial",
      elementType: "labels.icon",
      stylers: [
        {
          visibility: "off",
        },
      ],
    },
    {
      featureType: "transit",
      elementType: "all",
      stylers: [
        {
          visibility: "off",
        },
      ],
    },
    {
      featureType: "water",
      elementType: "all",
      stylers: [
        {
          color: "#3d9fc7",
        },
        {
          visibility: "on",
        },
      ],
    },
  ],
};

var loc = []; //db의 데이터를 저장할 배열
var viewportMarkers = []; //현재페이지의 데이터를 저장할 배열
var infoWindow; //윈도우 팝업(마커 클릭시)

var mcOptions = {
  //마커 클러스터 옵션(아이콘 설정 등)
  styles: [
    {
      height: 40,
      width: 40,
      url: "resources/image/m1.png",
    },
    {
      height: 40,
      width: 40,
      url: "resources/image/m2.png",
    },
    {
      height: 40,
      width: 40,
      url: "resources/image/m3.png",
    },
    {
      height: 40,
      width: 40,
      url: "resources/image/m4.png",
    },
    {
      height: 40,
      width: 40,
      url: "resources/image/m5.png",
    },
  ],
  maxZoom: 8,
};

function initMap() {
  //가장 먼저 실행되는 맵을 생성하고 db에 접속하는 함수
  $.ajax({
    type: "POST",
    dataType: "json",
    url: "mainmap.do",
    success: function (data) {
      //지도를 생성
      let map = new google.maps.Map(document.getElementById("map"), mapOptions);
      //반복문을 push형식으로 돌려 가져온 데이터를 누적시킴
      for (let i = 0; i < data.length; i++) {
        //loc배열에 dict형식으로 정보를 저장하고 필요할때 key값을 호출하여 사용
        loc.push({
          coords: {
            lat: parseFloat(data[i].area_mapy),
            lng: parseFloat(data[i].area_mapx),
          },
          //content는 마커 혹은 리스트 클릭시 마커정보를 팝업하기 위해 저장한다.
          content:
            '<h4 style="margin-right:8px; margin-top: 0px; margin-bottom: 5px;">' +
            data[i].area_title +
            "</h4>" +
            '<img style="width:80px; margin-right:8px;" src="' +
            data[i].area_image +
            '">',
          area_address1: data[i].area_address1, //리스트에 출력할 데이터를 각각 저장.
          area_title: data[i].area_title,
          area_overview: data[i].area_overview,
          area_image: data[i].area_image,
          area_num: data[i].area_num,
        });
      } //ajax>for

      //구글맵 로딩이 완료될때마다 함수 실행
      google.maps.event.addListener(map, "idle", function () {
        $(".list_info > li").remove();
        $(".list_button > li").remove();
        showMarkersInViewport();
      });

      //드래그기능 사용시마다 실행할 함수
      google.maps.event.addListener(map, "dragend", function (evt) {
        $(".list_info > li").remove();
        $(".list_button > li").remove();
        showMarkersInViewport();
      });

      let mc = new MarkerClusterer(map, viewportMarkers, mcOptions); //마커클러스터 최초 1회 생성

      //마커와 리스트 출력은 모두 showMarkersInViewport에서 실행하므로 드래그나 줌아웃이 발생하지 않은 초기 실행화면에서 최초1회 실행해준다.
      showMarkersInViewport();

      //현재화면에 해당하는 마커와 리스트를 출력하라
      function showMarkersInViewport() {
        if (viewportMarkers.length > 0) {
          //지도화면을 바꿀 때마다 새로운 마커와 리스트를 생성해주어야 하므로 기존의 남아있는 마커와 배열을 모두 초기화 해야한다.
          for (i in viewportMarkers) {
            //=================================================마커초기화=====================================================================
            viewportMarkers[i].setMap(null);
          }
          viewportMarkers.length = 0;
          mc.clearMarkers(); //=================================================================================================================================

          google.maps.event.addListener(map, "click", function () {
            //지도안에서 클릭시 마커정보 팝업창을 모두 제거한다.
            infoWindow.close();
          });
          var locsInViewport = getLocs(map.getBounds()); //locsInViewport에 지도의 화면내에 일치하는 loc데이터를 모두 저장한다.
          drawMarkerAndList(); //마커와 리스트를 출력하는 함수
          mc.addMarkers(viewportMarkers);
        } else {
          var locsInViewport = getLocs(map.getBounds()); //locsInViewport에 지도의 화면내에 일치하는 loc데이터를 모두 저장한다.
          drawMarkerAndList(); //마커와 리스트를 출력하는 함수
          mc.addMarkers(viewportMarkers);
        }
        function drawMarkerAndList() {
          //마커와 리스트를 출력하는 함수
          if (locsInViewport == null) return;

          for (i = 0; i < locsInViewport.length; i++) {
            var marker = new google.maps.Marker({
              //locsInViewport에 저장된 좌표값을 마커배열에 저장한다.
              position: new google.maps.LatLng(
                locsInViewport[i].coords.lat,
                locsInViewport[i].coords.lng
              ),
            });
            $(".list_info").append(
              //locsInViewport에 저장된 데이터를 li에 append 한다.
              ' <li id="' +
                locsInViewport[i].area_title +
                '"><a href="javascript:highlightMarker(' +
                i +
                ')"><img src="' +
                locsInViewport[i].area_image +
                '"/><h4>' +
                locsInViewport[i].area_title +
                "</h4><p>주소: " +
                locsInViewport[i].area_address1 +
                "</p><p>" +
                locsInViewport[i].area_overview +
                "</p></a></li>"
            ); //('.list').append
            $(".list_button").append(
              ' <li><a href="./detail.do?area_num=' +
                locsInViewport[i].area_num +
                '"><img style="margin-top:30px;" src="resources/image/list_button.png"</a></li>'
            ); //('.list_button').append
            marker.content = locsInViewport[i].content; //selectedMarker 옵션을 사용하기 위해 marker.content에 content 데이터를 저장한다.
            (function (index, selectedMarker) {
              //select된 마커에 팝업을 실행하고 화면에 content 데이터를 출력한다.
              google.maps.event.addListener(
                selectedMarker,
                "click",
                function () {
                  if (infoWindow != null) infoWindow.setMap(null);
                  infoWindow = new google.maps.InfoWindow();
                  infoWindow.setContent(selectedMarker.content);
                  infoWindow.open(map, selectedMarker);
                  selectDataRow(locsInViewport[index].area_title, index);
                }
              );
            })(i, marker); //selectedMarker

            marker.setMap(map); //지도에 마커를 출력한다.
            viewportMarkers.push(marker); //viewportMarkers에 마커 정보를 저장한다.(마커클러스터와 마커에 이벤트효과 등 옵션을 사용하기 위함)
          } //for
        } //drawMarkerAndList

        //선택된 마커를 리스트의 데이터와 연결하는 함수
        function selectDataRow(area_title, idx) {
          var listUl = document.getElementById("listJs");
          var cListUl = listUl.children;
          var listLi = document.getElementById(area_title); //리스트에 append 할때 각각의 area_title을 id값으로 주었다.
          var listBox = document.querySelector(".list_box");

          for (var i = 0; i < cListUl.length; i++) {
            //이미 매칭된 리스트 데이터가 있다면 테두리를 초기화한다.
            cListUl[i].style.border = "none";
          }

          listLi.style.border = "5px double #023059"; //해당 리스트 데이터에 테두리 효과
          listBox.scrollTop = idx * 104; //해당 리스트를 상위에 노출시키는 스크롤 이동 명령
        }
      } //showMarkersInViewport
    }, //ajax > function (data)
  }); //ajax
} //initMap

function getLocs(a) {
  //현재지도화면의 좌표와 loc리스트의 좌표값과 대조하여 일치하는 데이터만 리턴한다.
  if (a == null || a == undefined) return null;
  var selected = [];
  for (i = 0; i < loc.length; i++) {
    if (
      a.contains(new google.maps.LatLng(loc[i].coords.lat, loc[i].coords.lng))
    ) {
      selected.push(loc[i]);
    }
  }
  return selected;
} //getLocs

function highlightMarker(idx) {
  infoWindow = new google.maps.InfoWindow(); //리스트를 클릭하면 해당 데이터의 마커정보를 팝업한다.
  infoWindow.setContent(viewportMarkers[idx].content);
  infoWindow.open(map, viewportMarkers[idx]);

  //리스트를 클릭했을때 리스트 데이터와 일치하는 마커에 애니메이션 효과를 부여한다.
  viewportMarkers[idx].setAnimation(google.maps.Animation.BOUNCE);
  setTimeout(function () {
    viewportMarkers[idx].setAnimation(null);
  }, 1250);
} //highlightMarker

//태그필터 클릭시 맵과 리스트만 새로 출력한다.
$(".tag_fillter_list li").click(function () {
  //태그필터 마우스오버 이벤트
  previousSelectedItem = this; //바뀐 태그에 선택된 상태를 유지하면서 마우스오버 이벤트를 발생시킨다.

  menuItems.forEach((item) => {
    item.addEventListener("mouseenter", () => {
      previousSelectedItem.classList.remove("tag_fillter_active");
      previousSelectedItem = item;
      item.classList.add("tag_fillter_active");
    });
  });

  menuItems.forEach((item) => {
    item.addEventListener("mouseleave", () => {
      previousSelectedItem.classList.remove("tag_fillter_active");
      previousSelectedItem = this;
      previousSelectedItem.classList.add("tag_fillter_active");
    });
  });

  loc = []; //태그필터로 출력내용이 달라졌으므로 기존에 저장된 loc내의 데이터를 초기화한다.
  var tagValue = parseInt($(this).attr("value")); //li 안에 설정해둔 value값을 가져온다.
  if (tagValue == 13) {
    //value가 13이면 전체를 클릭했을때 실행할 문장이다.
    $.ajax({
      type: "POST",
      dataType: "json",
      url: "mainmap.do",
      success: function (data) {
        $(".list_info > li").remove();
        //지도를 생성
        let map = new google.maps.Map(
          document.getElementById("map"),
          mapOptions
        );
        //반복문을 push형식으로 돌려 가져온 데이터를 누적시킴
        for (let i = 0; i < data.length; i++) {
          //loc배열에 dict형식으로 정보를 저장하고 필요할때 key값을 호출하여 사용
          loc.push({
            coords: {
              lat: parseFloat(data[i].area_mapy),
              lng: parseFloat(data[i].area_mapx),
            },
            //content는 마커 혹은 리스트 클릭시 마커정보를 팝업하기 위해 저장한다.
            content:
              '<h4 style="margin-right:8px; margin-top: 0px; margin-bottom: 5px;">' +
              data[i].area_title +
              "</h4>" +
              '<img style="width:80px; margin-right:8px;" src="' +
              data[i].area_image +
              '">',
            area_address1: data[i].area_address1, //리스트에 출력할 데이터를 각각 저장.
            area_title: data[i].area_title,
            area_overview: data[i].area_overview,
            area_image: data[i].area_image,
            area_num: data[i].area_num,
          });
        } //ajax>for

        //구글맵 로딩이 완료될때마다 함수 실행
        google.maps.event.addListener(map, "idle", function () {
          $(".list_info > li").remove();
          $(".list_button > li").remove();
          showMarkersInViewport();
        });

        //드래그기능 사용시마다 실행할 함수
        google.maps.event.addListener(map, "dragend", function (evt) {
          $(".list_info > li").remove();
          $(".list_button > li").remove();
          showMarkersInViewport();
        });
        
        let mc = new MarkerClusterer(map, viewportMarkers, mcOptions); //마커클러스터 최초 1회 생성

        //마커와 리스트 출력은 모두 showMarkersInViewport에서 실행하므로 드래그나 줌아웃이 발생하지 않은 초기 실행화면에서 최초1회 실행해준다.
        showMarkersInViewport();

        //현재화면에 해당하는 마커와 리스트를 출력하라
        function showMarkersInViewport() {
          if (viewportMarkers.length > 0) {
            //지도화면을 바꿀 때마다 새로운 마커와 리스트를 생성해주어야 하므로 기존의 남아있는 마커와 배열을 모두 초기화 해야한다.
            for (i in viewportMarkers) {
              //=================================================마커초기화=====================================================================
              viewportMarkers[i].setMap(null);
            }
            viewportMarkers.length = 0;
            mc.clearMarkers(); //=================================================================================================================================

            google.maps.event.addListener(map, "click", function () {
              //지도안에서 클릭시 마커정보 팝업창을 모두 제거한다.
              infoWindow.close();
            });
            var locsInViewport = getLocs(map.getBounds()); //locsInViewport에 지도의 화면내에 일치하는 loc데이터를 모두 저장한다.
            drawMarkerAndList(); //마커와 리스트를 출력하는 함수
            mc.addMarkers(viewportMarkers);
          } else {
            var locsInViewport = getLocs(map.getBounds()); //locsInViewport에 지도의 화면내에 일치하는 loc데이터를 모두 저장한다.
            drawMarkerAndList(); //마커와 리스트를 출력하는 함수
            mc.addMarkers(viewportMarkers);
          }
          function drawMarkerAndList() {
            //마커와 리스트를 출력하는 함수
            if (locsInViewport == null) return;

            for (i = 0; i < locsInViewport.length; i++) {
              var marker = new google.maps.Marker({
                //locsInViewport에 저장된 좌표값을 마커배열에 저장한다.
                position: new google.maps.LatLng(
                  locsInViewport[i].coords.lat,
                  locsInViewport[i].coords.lng
                ),
              });
              $(".list_info").append(
                //locsInViewport에 저장된 데이터를 li에 append 한다.
                ' <li id="' +
                  locsInViewport[i].area_title +
                  '"><a href="javascript:highlightMarker(' +
                  i +
                  ')"><img src="' +
                  locsInViewport[i].area_image +
                  '"/><h4>' +
                  locsInViewport[i].area_title +
                  "</h4><p>주소: " +
                  locsInViewport[i].area_address1 +
                  "</p><p>" +
                  locsInViewport[i].area_overview +
                  "</p></a></li>"
              ); //('.list').append
              $(".list_button").append(
                ' <li><a href="./detail.do?area_num=' +
                  locsInViewport[i].area_num +
                  '"><img style="margin-top:30px;" src="resources/image/list_button.png"</a></li>'
              ); //('.list_button').append
              marker.content = locsInViewport[i].content; //selectedMarker 옵션을 사용하기 위해 marker.content에 content 데이터를 저장한다.
              (function (index, selectedMarker) {
                //select된 마커에 팝업을 실행하고 화면에 content 데이터를 출력한다.
                google.maps.event.addListener(
                  selectedMarker,
                  "click",
                  function () {
                    if (infoWindow != null) infoWindow.setMap(null);
                    infoWindow = new google.maps.InfoWindow();
                    infoWindow.setContent(selectedMarker.content);
                    infoWindow.open(map, selectedMarker);
                    selectDataRow(locsInViewport[index].area_title, index);
                  }
                );
              })(i, marker); //selectedMarker

              marker.setMap(map); //지도에 마커를 출력한다.
              viewportMarkers.push(marker); //viewportMarkers에 마커 정보를 저장한다.(마커클러스터와 마커에 이벤트효과 등 옵션을 사용하기 위함)
            } //for
          } //drawMarkerAndList

          //선택된 마커를 리스트의 데이터와 연결하는 함수
          function selectDataRow(area_title, idx) {
            var listUl = document.getElementById("listJs");
            var cListUl = listUl.children;
            var listLi = document.getElementById(area_title); //리스트에 append 할때 각각의 area_title을 id값으로 주었다.
            var listBox = document.querySelector(".list_box");

            for (var i = 0; i < cListUl.length; i++) {
              //이미 매칭된 리스트 데이터가 있다면 테두리를 초기화한다.
              cListUl[i].style.border = "none";
            }

            listLi.style.border = "5px double #023059"; //해당 리스트 데이터에 테두리 효과
            listBox.scrollTop = idx * 104; //해당 리스트를 상위에 노출시키는 스크롤 이동 명령
          }
        } //showMarkersInViewport
      }, //ajax > function (data)
    }); //ajax
  } //if(value==13)

  $.ajax({
    //value가 13(전체)가 아닐때 실행할 문장이다.
    type: "POST",
    dataType: "json",
    data: { tag_num: tagValue },
    url: "./tagsmap.do", //새로운 url로 해당 태그에 해당되는 데이터만 가져온다.
    success: function (data) {
      $(".list_info > li").remove(); //지도와 마찬가지로 list의 내용을 초기화한다.
      let map = new google.maps.Map(document.getElementById("map"), mapOptions);
      //반복문을 push형식으로 돌려 가져온 데이터를 누적시킴
      for (let i = 0; i < data.length; i++) {
        //loc배열에 dict형식으로 정보를 저장하고 필요할때 key값을 호출하여 사용
        loc.push({
          coords: {
            lat: parseFloat(data[i].area_mapy),
            lng: parseFloat(data[i].area_mapx),
          },
          //content는 마커 혹은 리스트 클릭시 마커정보를 팝업하기 위해 저장한다.
          content:
            '<h4 style="margin-right:8px; margin-top: 0px; margin-bottom: 5px;">' +
            data[i].area_title +
            "</h4>" +
            '<img style="width:80px; margin-right:8px;" src="' +
            data[i].area_image +
            '">',
          area_address1: data[i].area_address1, //리스트에 출력할 데이터를 각각 저장.
          area_title: data[i].area_title,
          area_overview: data[i].area_overview,
          area_image: data[i].area_image,
          area_num: data[i].area_num,
        });
      } //ajax>for

      //구글맵 로딩이 완료될때마다 함수 실행
      google.maps.event.addListener(map, "idle", function () {
        $(".list_info > li").remove();
        $(".list_button > li").remove();
        showMarkersInViewport();
      });

      //드래그기능 사용시마다 실행할 함수
      google.maps.event.addListener(map, "dragend", function (evt) {
        $(".list_info > li").remove();
        $(".list_button > li").remove();
        showMarkersInViewport();
      });

      let mc = new MarkerClusterer(map, viewportMarkers, mcOptions); //마커클러스터 최초 1회 생성

      //마커와 리스트 출력은 모두 showMarkersInViewport에서 실행하므로 드래그나 줌아웃이 발생하지 않은 초기 실행화면에서 최초1회 실행해준다.
      showMarkersInViewport();

      //현재화면에 해당하는 마커와 리스트를 출력하라
      function showMarkersInViewport() {
        if (viewportMarkers.length > 0) {
          //지도화면을 바꿀 때마다 새로운 마커와 리스트를 생성해주어야 하므로 기존의 남아있는 마커와 배열을 모두 초기화 해야한다.
          for (i in viewportMarkers) {
            //=================================================마커초기화=====================================================================
            viewportMarkers[i].setMap(null);
          }
          viewportMarkers.length = 0;
          mc.clearMarkers(); //=================================================================================================================================

          google.maps.event.addListener(map, "click", function () {
            //지도안에서 클릭시 마커정보 팝업창을 모두 제거한다.
            infoWindow.close();
          });
          var locsInViewport = getLocs(map.getBounds()); //locsInViewport에 지도의 화면내에 일치하는 loc데이터를 모두 저장한다.
          drawMarkerAndList(); //마커와 리스트를 출력하는 함수
          mc.addMarkers(viewportMarkers);
        } else {
          var locsInViewport = getLocs(map.getBounds()); //locsInViewport에 지도의 화면내에 일치하는 loc데이터를 모두 저장한다.
          drawMarkerAndList(); //마커와 리스트를 출력하는 함수
          mc.addMarkers(viewportMarkers);
        }
        function drawMarkerAndList() {
          //마커와 리스트를 출력하는 함수
          if (locsInViewport == null) return;

          for (i = 0; i < locsInViewport.length; i++) {
            var marker = new google.maps.Marker({
              //locsInViewport에 저장된 좌표값을 마커배열에 저장한다.
              position: new google.maps.LatLng(
                locsInViewport[i].coords.lat,
                locsInViewport[i].coords.lng
              ),
            });
            $(".list_info").append(
              //locsInViewport에 저장된 데이터를 li에 append 한다.
              ' <li id="' +
                locsInViewport[i].area_title +
                '"><a href="javascript:highlightMarker(' +
                i +
                ')"><img src="' +
                locsInViewport[i].area_image +
                '"/><h4>' +
                locsInViewport[i].area_title +
                "</h4><p>주소: " +
                locsInViewport[i].area_address1 +
                "</p><p>" +
                locsInViewport[i].area_overview +
                "</p></a></li>"
            ); //('.list').append
            $(".list_button").append(
              ' <li><a href="./detail.do?area_num=' +
                locsInViewport[i].area_num +
                '"><img style="margin-top:30px;" src="resources/image/list_button.png"</a></li>'
            ); //('.list_button').append
            marker.content = locsInViewport[i].content; //selectedMarker 옵션을 사용하기 위해 marker.content에 content 데이터를 저장한다.
            (function (index, selectedMarker) {
              //select된 마커에 팝업을 실행하고 화면에 content 데이터를 출력한다.
              google.maps.event.addListener(
                selectedMarker,
                "click",
                function () {
                  if (infoWindow != null) infoWindow.setMap(null);
                  infoWindow = new google.maps.InfoWindow();
                  infoWindow.setContent(selectedMarker.content);
                  infoWindow.open(map, selectedMarker);
                  selectDataRow(locsInViewport[index].area_title, index);
                }
              );
            })(i, marker); //selectedMarker

            marker.setMap(map); //지도에 마커를 출력한다.
            viewportMarkers.push(marker); //viewportMarkers에 마커 정보를 저장한다.(마커클러스터와 마커에 이벤트효과 등 옵션을 사용하기 위함)
          } //for
        } //drawMarkerAndList

        //선택된 마커를 리스트의 데이터와 연결하는 함수
        function selectDataRow(area_title, idx) {
          var listUl = document.getElementById("listJs");
          var cListUl = listUl.children;
          var listLi = document.getElementById(area_title); //리스트에 append 할때 각각의 area_title을 id값으로 주었다.
          var listBox = document.querySelector(".list_box");

          for (var i = 0; i < cListUl.length; i++) {
            //이미 매칭된 리스트 데이터가 있다면 테두리를 초기화한다.
            cListUl[i].style.border = "none";
          }

          listLi.style.border = "5px double #023059"; //해당 리스트 데이터에 테두리 효과
          listBox.scrollTop = idx * 104; //해당 리스트를 상위에 노출시키는 스크롤 이동 명령
        }
      } //showMarkersInViewport
     
    }, //data
  }); //ajax
}); //.tag_fillter_list li
