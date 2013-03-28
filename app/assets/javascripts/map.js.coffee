window.buildMap = ->
  mapOptions =
    zoom: 15
    center: new google.maps.LatLng(55.7511, 37.6934)
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false
    disableDefaultUI: true
    zoomControl: true
    zoomControlOptions:
      position: google.maps.ControlPosition.LEFT_CENTER
    styles: [
      stylers: [
        saturation: -100
      ]
    ]
  map = new google.maps.Map(document.getElementById('map'), mapOptions)

  new google.maps.Marker
    position: new google.maps.LatLng(55.75135, 37.67463)
    map: map
    icon: '/assets/custom-marker.png'

  roadCoordinates = [
    new google.maps.LatLng(55.74691, 37.68017),
    new google.maps.LatLng(55.74855, 37.68200),
    new google.maps.LatLng(55.75046, 37.67313),
    new google.maps.LatLng(55.75104, 37.67358),
    new google.maps.LatLng(55.75126, 37.67300),
    new google.maps.LatLng(55.75162, 37.67343),
    new google.maps.LatLng(55.75140, 37.67453)
  ]

  roadPath = new google.maps.Polyline(
    path: roadCoordinates
    strokeColor: "#d71921"
    strokeOpacity: 1.0
    strokeWeight: 10
  )
  roadPath.setMap map

  # center map to fix marker position
  google.maps.event.addDomListener window, "resize", ->
    lat = if $(window).height() > 850 then 55.7485 else 55.7511
    map.setCenter(new google.maps.LatLng(lat, 37.6934))

loadScript = ->
  script = document.createElement("script")
  script.type = "text/javascript"
  script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=buildMap"
  document.body.appendChild script

window.onload = loadScript