initialize = ->
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
  $('#menu').onePageNav()

  bullets = document.getElementById('position').getElementsByTagName('li')

  slider = Swipe(document.getElementById("slides"),
    callback: (pos) ->
      i = bullets.length
      bullets[i].className = " "  while i--
      bullets[pos].className = "on"
  )

  $('#position').on 'click', 'li', ->
    slider.slide $(@).index(), 400

  $('#nav-arrow').on 'click', ->
    $nextWindow = $('#menu').find('.current').next()
    unless $nextWindow.length
      $nextWindow = $('#menu').find('li').first()

    link = $nextWindow.find('a').attr('href')
    $.scrollTo($(link), 750)

  $contactForm = $('#contacts-form')
  $contactInputs = $contactForm.find('input, textarea')
  $('#contacts-submit').on 'click', ->
    errors = $contactInputs.filter(->
      $(@).val().trim() is ""
    ).addClass('error')
    unless errors.length
      #$contactForm.submit() 
      $contactInputs.val ''
      alert 'Сообщение отправлено.'
    false

  $contactForm.on 'blur', '.error', ->
    $(@).removeClass('error') unless $(@).val().trim() is ""