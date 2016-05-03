

function initMap() {
  fetch('/api/v1/pubs.json').then(function(response) {
    response.json().then(function(data) {
      //console.log(data.length);

      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 11,
        center: {lat: -34.397, lng: 150.644}
      });
      var geocoder = new google.maps.Geocoder();
    // document.getElementById('submit').addEventListener('click', function() {
    //       geocodeAddress(geocoder, map);
    //     });
      
      var places = [];
      for (var i = 0; i < data.length; i++) {
        var placeAddress = data[i].address1 + ", " + data[i].city + ", " + data[i].state  + ", " + data[i].zip;
        var placeName = data[i].name;
        var placeContact = data[i].website + '|' + data[i].email + '|' + data[i].phone + '|' + data[i].fax;
        // var placeDescription = data[i].description;
        places.push({address: placeAddress, name: placeName, contact: placeContact });
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
            var contentString = '<h2>' + place.name + '</h2>' +
        place.address ;
      
            marker.addListener('click', function() {
              infowindow.setContent(contentString);
              infowindow.open(map, marker);
            });
          } else {
            console.log("not working");
          }

        });
      });

    });
  });
}


