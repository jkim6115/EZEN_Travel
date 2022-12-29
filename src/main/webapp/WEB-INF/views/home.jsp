<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<script type="text/javascript">
//Create global variables for map, markers, etc
var map;
var Data = [];
var viewportMarkers = [];
var infoWindow;
var handle1, handle2;
var markerCount = 0;
			
// Function to initialize the map and set values										
function initMap(){
	var lat = 34.975662;
	var lng = -97.761300;
	var iniZoom = 9;
	var myLatLng = new google.maps.LatLng(lat, lng);
	
	var options = {
		zoom: iniZoom,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	
	map = new google.maps.Map(document.getElementById('map'), options);

// Add event listeners for when the map has changed: drag, zoom in/out or page refreshed.
	google.maps.event.addListener(map, 'dragend', function() {showMarkersInViewport()});
	google.maps.event.addListener(map, 'idle', function() {showMarkersInViewport()});
}

// Create a function to add markers to the map. 
function showMarkersInViewport() {
     if (viewportMarkers != null) {
         for (i=0; i<viewportMarkers.length; i++) {
            viewportMarkers[i].setMap(null);
         }
         viewportMarkers = [];
         
// close any open infoWindows when the map is clicked
          /*	google.maps.event.addListener(map, "click", function() {
    				infoWindow.close();
						});
						
// Set the results box row color back to normal when the map is clicked
						google.maps.event.addListener(map, 'click', function selectDataRow(code) {
							var table = document.getElementById("tbl");
					    for (var i=1, row; row = table.rows[i]; i++) { 
					       row.style.backgroundColor = "#ffffff";
					    }
						}); */
  }
  
// Create a table to hold the info of the markers on the map.
     var divTable = '<table id="tbl" width="100%" bgcolor="#ffffff" border="all"><tr><td width="10%" style="color:#000000; background-color:#ffffff; font-family: Trebuchet MS; font-size:11pt; color: #000000; font-weight: bold">CODE</td>' 
     + '<td width="40%" style="color:#000000; background-color:#ffffff; font-family: Trebuchet MS; font-size:11pt; color: #000000; font-weight: bold">Airport Name</td>' 
     + '<td width="50%" style="color:#000000; background-color:#ffffff; font-family: Trebuchet MS; font-size:11pt; color: #000000; font-weight: bold">Location</td></tr>'
     var divText = '<span style="background-color:#000000;font-family: Trebuchet MS; font-size:12pt; color: red;"><b>List of airports in range</b><br/><br/></span>';
     
// call the getAirports() function to retrieve the locations (airports) in the current viewport.
     var airportsInViewport = getAirports(map.getBounds());
     if (airportsInViewport == null) return;	
     // Next, iterate through the elements in the airports array for each airport in the viewport:
     //   1. Create a marker and place it on the map
     //   2. Add an event listener to the click event of the marker to display an InfoWindow with data about the selected airport
     //   3. Add a new row to the table beside the map that summarizes the airports on the map
     for (i=0; i < placeViewPort.length; i++) {
    	 
    	 var marker = new google.maps.Marker({
    		position: new google.maps.LatLng(placeViewPort[i].coords.mapx, placeViewPort[i].coords.mapy), 
      
    		 
    	 })
    	 
    	 
    	 
     }
     
     for (i=0; i < airportsInViewport.length; i++) {
              // create a new marker
              var marker = new google.maps.Marker({
              position:  new google.maps.LatLng(airportsInViewport[i].Location.Latitude, airportsInViewport[i].Location.Longitude), 
              icon: airportsInViewport[i].icon,
              title: 'AIRPORT: ' + airportsInViewport[i].Name + ' in ' + airportsInViewport[i].City + ', ' + airportsInViewport[i].Country});
		              // "marker.objInfo sets its objInfo property to the airport's description. This object will populate the InfoWindow with the airport's data
		              marker.objInfo =  
		              '<b>Code: </b>'
		              + airportsInViewport[i].Code
		              + '<br/><b>NAME: </b>' 
		              + airportsInViewport[i].Name  
		              + '<br/><b>CITY: </b>' 
		              + airportsInViewport[i].City 
		              + '<br/><b>State: </b>' 
		              + airportsInViewport[i].State 
		              + '<br/><b>COUNTRY: </b>' 
		              + airportsInViewport[i].Country;
              
// add the click event's listener for each marker to open the info-Window
/*(function(index, selectedMarker) 
{
              google.maps.event.addListener(selectedMarker, 'click', function() {
                          if (infoWindow != null) infoWindow.setMap(null); 
                          infoWindow = new google.maps.InfoWindow(); 
                          infoWindow.setContent(selectedMarker.objInfo); 
                          infoWindow.open(map, selectedMarker); 
                          selectDataRow(airportsInViewport[index].Code)});
})(i, marker)*/

// place the marker on the map 
              marker.setMap(map);
// add the marker to the viewportMarkers array
              viewportMarkers.push(marker);
// Create a new row entry for the table corresponding to the current airport
              var currentIndex = viewportMarkers.length-1;
// The linkText variable holds the airport name and the text of the hyperlink (column Airport)
              var linkText =  'AIRPORT: ' 
              + airportsInViewport[i].Name 
              + '&nbsp;&nbsp;(' + airportsInViewport[i].Code + ')' 
              + '<br/>';
// The linkInfo variable holds the remaining columns of the row
              var linkInfo = 'CITY: ' 
              + airportsInViewport[i].City 
              + '<br/>COUNTRY: ' 
              + airportsInViewport[i].Country;
// Add the hyperlink to bounce the appropriate marker and open its infoWindow
              divText += '<a href="javascript:highlightMarker(' + currentIndex + ')">' 
              + '<b>' 
              + linkText 
              + '</b>' 
              + '</a>' 
              + linkInfo 
              + '<br/><br/>';
// Finally, add the <tr> element for the row 
              divTable += '<tr><td id="' 
              + airportsInViewport[i].Code 
              + '"; style="font-family: Trebuchet MS; font-size:10pt; color:#000000">' 
              + '<a style="color:#000000" href="javascript:zoomMarker(' + currentIndex + ')">' 
              + airportsInViewport[i].Code
              + '</td><td style="font-family: Trebuchet MS; font-size:10pt; color:#000000">' 
              + '<a style="color:#000000" href="javascript:highlightMarker(' + currentIndex + ')">' 
              + airportsInViewport[i].Name 
              + '</a></td><td style="font-family: Trebuchet MS; font-size:10pt; color:#000000">' 
              + '<a style="color:#000000" href="javascript:highlightMarker(' + currentIndex + ')">' 
              + airportsInViewport[i].City 
              + '<br/>' 
              + airportsInViewport[i].State 
              + '</td></tr>'
              markerCount++;
     }
     divTable += '</table>'
     document.getElementById('dataTable').innerHTML = divTable;
 }   

// Function to change the row background color when the corresponding marker is clicked.
/*function selectDataRow(code) {
    var table = document.getElementById("tbl");
    for (var i=1, row; row = table.rows[i]; i++) { 
       row.style.backgroundColor = "#ffffff";
    }
    document.getElementById(code).parentNode.style.backgroundColor = '#66CD00'; // sets the row color to red.
}*/

// The following function returns all airports in the current viewport in the selected array
// The "a" argument is a LatLngBounds object with the viewport's bounds. It doesn't have to be "a", you can
// call it anything. Example "abc", "xyz", etc. you just can't use numbers like "1" or "123".  
     function getAirports(a) {
        if (a == null || a == undefined) return null;
        var selected = [];
        for (i=0; i < airports.length; i++) {
            if (a.contains(new google.maps.LatLng(airports[i].Location.Latitude, airports[i].Location.Longitude))) {
                selected.push(airports[i]);
            }
        }
        return selected;
     }

 
//  The highlightMarker() function opens the InfoWindow object that corresponds
//  to the marker in the viewportMarkers array

    /* function highlightMarker(index) {
        if (infoWindow != null) infoWindow.setMap(null); 
        infoWindow = new google.maps.InfoWindow(); 
        infoWindow.setContent(viewportMarkers[index].objInfo); 
        infoWindow.open(map, viewportMarkers[index]);*/
				
// Bounce the marker for two seconds when the corresonding link is clicked in the result box.				
        /*viewportMarkers[index].setAnimation(google.maps.Animation.BOUNCE);
                         setTimeout(function () {
                                     viewportMarkers[index].setAnimation(null);
                                     }, 1250); // This sets the time for the bounce. You can make it longer or shorter. 
     }*/
// Pan the map to center the marker when the "CODE" link is clicked in the results box.   
  	function zoomMarker(index) {
  		map.panTo(viewportMarkers[index].getPosition());
  		
  	}
  	
  	
// Create an array of markers
// This can be moved to a seperate js page for simplicity. 

/*
var airports = [

	 { 
	 	'Name': 'Downtown Airport', 
	 	'Code': 'DWN', 
	 	'City': 'Oklahoma City', 
	 	'State': 'Oklahoma',
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 35.449167, 'Longitude': -97.533056 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'
	 	},
	 	
	 { 
	 	'Name': 'Tinker AFB', 
	 	'Code': 'TIK', 
	 	'City': 'Oklahoma City', 
	 	'State': 'Oklahoma',
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 35.414722, 'Longitude': -97.386667 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png' 
	 	},
	 	
	 { 
	 	'Name': 'Wiley Post', 
	 	'Code': 'PWA', 
	 	'City': 'Oklahoma City',
	 	'State': 'Oklahoma', 
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 35.534167, 'Longitude': -97.666667 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png' 
	 	},
	 	
	 { 
	 	'Name': 'Will Rogers World Airport', 
	 	'Code': 'OKC', 
	 	'City': 'Oklahoma City',
	 	'State': 'Oklahoma', 
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 35.393056, 'Longitude': -97.600833 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png' 
	 	},
	   
	{ 
		'Name': 'Municipal', 
		'Code': 'LAW', 
		'City': 'Lawton',
		'State': 'Oklahoma', 
		'Country': 'United States', 
		'Location': { 'Latitude': 34.566667, 'Longitude': -98.416667 },
		'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'  
		},
		
	 { 
	 	'Name': 'Municipal', 
	 	'Code': 'CHK', 
	 	'City': 'Chickasha',
	 	'State': 'Oklahoma', 
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 35.033333, 'Longitude': -97.966667 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'  
	 	},
	 
	 { 
	 	'Name': 'Max Westheimer', 
	 	'Code': 'OUN', 
	 	'City': 'Norman',
	 	'State': 'Oklahoma', 
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 35.158333, 'Longitude': -97.466667 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'  
	 	},
	 	
	 { 
	 	'Name': 'Halliburton Field', 
	 	'Code': 'DUC', 
	 	'City': 'Duncan',
	 	'State': 'Oklahoma', 
	 	'Country': 'United States', 
	 	'Location': { 'Latitude': 34.466667, 'Longitude': -97.966667 },
	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'
	 	 },
	 	 
	 	 { 
	 	 	'Name': 'Altus AFB', 
	 	 	'Code': 'LTS', 
	 	 	'City': 'Altus',
	 	 	'State': 'Oklahoma', 
	 	 	'Country': 'United States', 
	 	 	'Location': { 'Latitude': 34.65, 'Longitude': -99.35 },
	 	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'
	 	 	 },
	 	 	 
	 	 { 
	 	 	'Name': 'Municipal', 
	 	 	'Code': 'AXS', 
	 	 	'City': 'Altus',
	 	 	'State': 'Oklahoma', 
	 	 	'Country': 'United States', 
	 	 	'Location': { 'Latitude': 34.702778, 'Longitude': -99.333333 },
	 	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'
	 	 	 },
	 	 	 
	 	 { 
	 	 	'Name': 'Municipal', 
	 	 	'Code': 'ELK', 
	 	 	'City': 'Elk City',
	 	 	'State': 'Oklahoma', 
	 	 	'Country': 'United States', 
	 	 	'Location': { 'Latitude': 35.4, 'Longitude': -99.416667 },
	 	 	'icon': 'https://i.postimg.cc/2ymbbfpC/bomber-2.png'
	 	 	 },
]*/

</script>
</body>
</html>
