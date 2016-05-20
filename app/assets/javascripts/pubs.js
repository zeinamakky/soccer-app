

function initMap() {
  fetch('/api/v1/pubs.json').then(function(response) {
    response.json().then(function(data) {
      //console.log(data.length);

      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        // center: {lat: currentPub.lat, lng: currentPub.lng}
        center: {lat: -34.397, lng: 150.644}
      });
      var geocoder = new google.maps.Geocoder();
    // document.getElementById('submit').addEventListener('click', function() {
    //       geocodeAddress(geocoder, map);
    //     });
      
      var places = [];
      var markers =[];
      var bounds = new google.maps.LatLngBounds();

      for (var i = 0; i < data.length; i++) {
        var placeId = data[i].id;
        var placeAddress = data[i].address1 + ", " + data[i].city + ", " + data[i].state  + ", " + data[i].zip;
        var placeName = data[i].name;
        var placeContact = data[i].website + '|' + data[i].email + '|' + data[i].phone + '|' + data[i].fax;
        // var placeDescription = data[i].description;
        places.push({id: placeId, address: placeAddress, name: placeName, contact: placeContact });
      }
      console.log(places);
      console.log(places.length);



      var infowindow = new google.maps.InfoWindow({
        content: "temporary..."
      });

      

      places.forEach(function(place) {
        geocoder.geocode({address: place.address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
            });
            var contentString = '<h2><a href="/pubs/' + place.id + '">' + place.name + '</a></h2>' + place.address ;
            marker.addListener('click', function() {
              infowindow.setContent(contentString);
              infowindow.open(map, marker);
            });
          } else {
            console.log("not working");
          }
          markers.push(marker);
          for (var i = 0;i < markers.length; i++) {
            bounds.extend(markers[i].getPosition());
          }
          map.fitBounds(bounds);

          

        });
      });

    });
  });
}


