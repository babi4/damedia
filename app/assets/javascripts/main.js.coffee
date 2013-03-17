initialize = ->
  mapOptions = 
    zoom: 15
    center: new google.maps.LatLng(55.7521, 37.6934)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false
    styles: [
      stylers: [
        saturation: -100
      ]
    ]

  map = new google.maps.Map(document.getElementById('map'), mapOptions)

  beachMarker = new google.maps.Marker
    position: new google.maps.LatLng(55.75135, 37.67463)
    map: map
    icon: '/assets/custom-marker.png'

  roadCoordinates = [
    new google.maps.LatLng(55.74683, 37.68059), 
    new google.maps.LatLng(55.74714, 37.67617), 
    new google.maps.LatLng(55.74807, 37.67632),
    new google.maps.LatLng(55.74829, 37.67527),
    new google.maps.LatLng(55.75156, 37.67774),
    new google.maps.LatLng(55.75145, 37.67473),
  ]

  roadPath = new google.maps.Polyline(
    path: roadCoordinates
    strokeColor: "#d71921"
    strokeOpacity: 1.0
    strokeWeight: 10
  )
  roadPath.setMap map

google.maps.event.addDomListener(window, 'load', initialize);

$ ->
  $('#menu ul').onePageNav
    changeHash: true

  $('#slides').superslides
    play: 6000