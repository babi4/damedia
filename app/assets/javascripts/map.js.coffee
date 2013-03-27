window.initialize = ->
  window.buildMap = ->
    mapOptions =
      zoom: 15
      center: new google.maps.LatLng(55.7521, 37.6934)
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

    google.maps.event.addListener(map, 'tilesloaded', ->
      $('#map-dummy:visible').fadeOut(500)
      google.maps.event.clearListeners(map, 'tilesloaded');
    )

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

loadScript = ->
  script = document.createElement("script")
  script.type = "text/javascript"
  script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&callback=initialize"
  document.body.appendChild script

window.onload = loadScript