function initMap() {
  // Styles a map in night mode.
  const map = new google.maps.Map(document.getElementById('map'), {
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

  var markers = [
    //Dublin
    {
      coords: { lat: 37.5115557, lng: 127.0595261 },
      iconImage: '/images/coex.png',
      content:
        '<h1>코엑스몰</h1>' +
        '<img style="float:left; width:100px; margin-top:30px; margin-right:15px;" src="img/coex.png">' +
        '<br>' +
        '<h2>코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 </h2>' +
        '<a>http://coex.com/</a>',
    },
    {
      coords: { lat: 37.5062379, lng: 127.0050378 },
      iconImage: 'assets/img/places/botanic garden.png',
      content:
        '<h1>고터지하쇼핑몰</h1>' +
        '<br>' +
        '<h2>고투몰에대하여 고투몰에대하여 고투몰에대하여 고투몰에대하여</h2>' +
        '<a>http://gotomall.com/</a>',
    },
    {
      coords: { lat: 37.566596, lng: 127.007702 },
      iconImage: '/images/coex.png',
      content:
        '<h1>코엑스몰</h1>' +
        '<br>' +
        '<h2>코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 </h2>' +
        '<a>http://coex.com/</a>',
    },
    {
      coords: { lat: 37.5251644, lng: 126.9255491 },
      iconImage: '/images/coex.png',
      content:
        '<h1>코엑스몰</h1>' +
        '<br>' +
        '<h2>코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 </h2>' +
        '<a>http://coex.com/</a>',
    },
    {
      coords: { lat: 37.5125585, lng: 127.1025353 },
      iconImage: '/images/coex.png',
      content:
        '<h1>코엑스몰</h1>' +
        '<br>' +
        '<h2>코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 </h2>' +
        '<a>http://coex.com/</a>',
    },
    {
      coords: { lat: 37.5173108, lng: 126.9033793 },
      iconImage: '/images/coex.png',
      content:
        '<h1>코엑스몰</h1>' +
        '<br>' +
        '<h2>코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 코엑스몰에대하여 </h2>' +
        '<a>http://coex.com/</a>',
    },
  ];

  const malls = [
    { label: '', name: '코엑스몰', lat: 37.5115557, lng: 127.0595261 },
    { label: '', name: '고투몰', lat: 37.5062379, lng: 127.0050378 },
    { label: '', name: '동대문시장', lat: 37.566596, lng: 127.007702 },
    { label: '', name: 'IFC몰', lat: 37.5251644, lng: 126.9255491 },
    { label: '', name: '롯데월드타워몰', lat: 37.5125585, lng: 127.1025353 },
    { label: '', name: '명동지하상가', lat: 37.563692, lng: 126.9822107 },
    { label: '', name: '타임스퀘어', lat: 37.5173108, lng: 126.9033793 },
  ];

  // malls.forEach(({ label, name, lat, lng }) => {
  //   var myIcon = new google.maps.MarkerImage(
  //     "/image/markersample.png",
  //     null,
  //     null,
  //     null,
  //     new google.maps.Size(12, 20)
  //   );

  //   const marker = new google.maps.Marker({
  //     position: { lat, lng },
  //     label,
  //     map: map,
  //   });
  // });

  // Loop through markers
  var gmarkers = [];
  for (var i = 0; i < markers.length; i++) {
    gmarkers.push(addMarker(markers[i]));
  }

  function addMarker(props) {
    var marker = new google.maps.Marker({
      position: props.coords,
      map: map,
    });

    /* if(props.iconImage){
        marker.setIcon(props.iconImage);
      } */

    //Check content
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

  var markerCluster = new MarkerClusterer(map, gmarkers, {
    imagePath:
      'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',
  });
}

google.maps.event.addDomListener(window, 'load', initMap);
