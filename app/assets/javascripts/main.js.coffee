$ ->
  # $("a[href^=\"#\"]").bind "click.smoothscroll", (e) ->
  #   e.preventDefault()
  #   target = @hash
  #   $target = $(target)
  #   $("html, body").stop().animate
  #     scrollTop: $target.offset().top
  #   , 500, "swing", ->
  #     window.location.hash = target
  $('#menu ul').onePageNav()

  $('#slides').superslides
    play: 6000