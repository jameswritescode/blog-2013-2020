$ ->
  $('li.contrast').on 'click', ->
    if $(@).hasClass('contrast-light')
      $(@).removeClass('contrast-light').addClass('contrast-dark')
      $('body.editor').addClass('contrast-dark')
      $('html').css('background-color', 'black')
    else if $(@).hasClass('contrast-dark')
      $(@).removeClass('contrast-dark').addClass('contrast-light')
      $('body.editor').removeClass('contrast-dark')
      $('html').css('background-color', 'white')

    return false

  # credit: http://alistapart.com/article/expanding-text-areas-made-elegant
  makeExpandingArea = (container) ->
    area = container.querySelector('textarea')
    span = container.querySelector('span')

    if area.addEventListener
      area.addEventListener 'input', ->
        span.textContent = area.value
      , false

      span.textContent = area.value
    else if area.attachEvent
      area.attachEvent 'onpropertychange', ->
        span.innerText = area.value

      span.innerText = area.value

    container.className += ' active'

  areas = document.querySelectorAll('body.editor div.expanding-area')
  l     = areas.length

  $(document).ready ->
    while (l--)
      makeExpandingArea(areas[l])

  # credit: http://davidwalsh.name/fullscreen
  launchFullScreen = (container) ->
    if container.requestFullScreen
      container.requestFullScreen()
    else if container.mozRequestFullScreen
      container.mozRequestFullScreen()
    else if container.webkitRequestFullScreen
      container.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT)

  cancelFullScreen = ->
    if document.cancelFullScreen
      document.cancelFullScreen()
    else if document.mozCancelFullScreen
      document.mozCancelFullScreen()
    else if document.webkitCancelFullScreen
      document.webkitCancelFullScreen()

  $('li.fullscreen').on 'click', ->
    if $(@).hasClass('expand')
      launchFullScreen(document.documentElement)
    else if $(@).hasClass('shrink')
      cancelFullScreen()

    return false

  $(document).on 'webkitfullscreenchange mozfullscreenchange fullscreenchange', ->
    el = $('li.fullscreen')

    if el.hasClass('expand')
      el.removeClass('expand').addClass('shrink')
    else if el.hasClass('shrink')
      el.removeClass('shrink').addClass('expand')
