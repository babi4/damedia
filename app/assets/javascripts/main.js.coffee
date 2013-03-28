$ ->

  buildNav()

  lazyScroll = _.debounce( ->
    currentListItem = $('#menu').find('.current').find('a').attr('href')
    $.scrollTo $(currentListItem), 400, {axis: 'y'}
  , 300)

  $(window).on('resize', lazyScroll)

  bullets = document.getElementById('position').getElementsByTagName('li')
  slider = Swipe(document.getElementById("slides"),
    callback: (pos) ->
      i = bullets.length
      bullets[i].className = " "  while i--
      bullets[pos].className = "on"

      false
  )

  $('.slide').on 'click', ->
    slider.next()

  $('#position').on 'click', 'li', ->
    slider.slide $(@).index(), 400

  $('#nav-arrow').on 'click', ->
    $nextWindow = $('#menu').find('.current').next()
    unless $nextWindow.length
      $nextWindow = $('#menu').find('li').first()

    link = $nextWindow.find('a').attr('href')
    $.scrollTo $(link), 750, {axis: 'y'}

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