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
  <!--   <script src="ajaxview/jquery.js"></script>-->
  <script type="text/javascript">
   // $(document).ready(function(){
    	
	//	$.ajax({
	//		type:'POST',
	//		dataType:'json',
	//		url:'mainmap.do',
		//	data:{},
		//	success:function(data){
		//	 alert("성공")
		//	 console.log(data)
		//	}
	//	});
	
	
	//});
	
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
	  
	  var loc = [];
	  	  
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: 'mainmap.do',
		success: function (data) {
  		alert("성공")  
  		console.log(data[0].firstimage2)
  		console.log(data[0].title)
  		 // if (data['result'] == 'success'){}
  		for(let i=0; i<data.length; i++){
  			loc.push({lat: parseFloat(data[i].mapy), lng: parseFloat(data[i].mapx)});
  		
  		}


  		  // Loop through markers
  		  var gmarkers = [];
  		  for (var i = 0; i < data.length; i++) {
  		    gmarkers.push(addMarker(loc[i]));
  		  }

  		  function addMarker(props) {
  		    var marker = new google.maps.Marker({
  		      position: props,
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
		},
	});
	  
	}

	//google.maps.event.addDomListener(window, 'load', initMap);
	</script>
</head>
 <body>
    <h3>MainPageMapSample01</h3>
    <!--The div element for the map -->
    <div id="map"></div>

	<div id="test"><table></table></div>
	<div id="wrap"><table> </table></div>
	

    <!-- 
       The `defer` attribute causes the callback to execute after the full HTML
       document has been parsed. For non-blocking uses, avoiding race conditions,
       and consistent behavior across browsers, consider loading using Promises
       with https://www.npmjs.com/package/@googlemaps/js-api-loader.
      -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVawMw-q5O-9DAhYGSOXKdnAYK0nof_0E&callback=initMap&v=weekly"
      defer></script>
</body>
</html>