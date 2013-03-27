$ ->
  do ->
    $img = $('#map-dummy').children()
    if $(window).height() > 940
      $img.attr('src', $img.data('large')).addClass('large')
    else
      $img.attr('src', $img.data('small')).addClass('small')

    $('#contacts').bind 'mouseenter', ->
      $('#contacts').unbind('mouseenter')
      window.buildMap()

  buildNav()

  bullets = document.getElementById('position').getElementsByTagName('li')
  slider = Swipe(document.getElementById("slides"),
    auto: 5000
    callback: (pos) ->
      i = bullets.length
      bullets[i].className = " "  while i--
      bullets[pos].className = "on"

      false
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
      $contactInputs.val ''
      $('#contacts-inputs, #contacts-success').addClass 'sent'
    false

  $contactForm.on 'blur', '.error', ->
    $(@).removeClass('error') unless $(@).val().trim() is ""