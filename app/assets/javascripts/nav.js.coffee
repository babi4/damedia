window.buildNav = ->
  SCROLL_DURATION = 750
  OFFSET = 65

  getBlocks = ->
    ids = []
    $items.each ->
      href = @getAttribute('href')
      ids.push @getAttribute('href') if href[0] is '#'

    $(ids.join(', '))

  $wrapper = $('#menu')

  $menu = $wrapper.children('ul')
  $items = $wrapper.find('a')
  $blocks = getBlocks()

  setProgressWidth = ($currentListItem) ->
    padding = $currentListItem.offset().left + $currentListItem.width()
    $('#progress').stop().animate(
      { width: padding },
      queue: false
      duration: SCROLL_DURATION / 2
    )

  setHash = (hash) ->
    history.pushState(null, null, hash)

  setCurrent = ($target) ->
    if $target
      unless $target.parent().hasClass('current')
        $items.parent('.current').removeClass('current')
        $target.parent().addClass('current') if $target
        setProgressWidth($target.parent())
        setHash $target.attr('href')
    else
      $items.parent('.current').removeClass('current')

  processScroll = ->
    $target = false
    $blocks.each ->
      $block = $(this)
      startPoint = $block.offset().top - OFFSET
      endPoint = startPoint + $block.height()

      if window.scrollY > startPoint and window.scrollY < endPoint
        $target = $items.filter("[href=##{@id}]")
        false

    setCurrent($target)

  $(window).on('scroll', processScroll)
  processScroll()

  scrollTo = (newLoc) ->
    $.scrollTo(newLoc, SCROLL_DURATION,
               axis: 'y'
               easing: 'swing'
    )

  $items.on 'click', (e) ->
    e.preventDefault()
    scrollTo $(@getAttribute('href'))

  $(document).on('keydown', (e) ->
    if e.keyCode is 38
      if ($target = $('#menu').find('.current').prev()).get(0)
        $target.children().click()
      else
        scrollTo(1)
    else if e.keyCode is 40
      $('#menu').find('.current')
      if ($current = $('#menu').find('.current')).get(0)
        $current.next().children().click()
      else
        scrollTo($blocks.first().offset().top)
  )
