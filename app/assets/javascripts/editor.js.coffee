$ ->
  $('div.contrast').on 'click', ->
    if $(@).hasClass('contrast-light')
      $(@).removeClass('contrast-light')
      $(@).addClass('contrast-dark')
      $('body.editor').addClass('contrast-dark')
      $('html').css('background-color', 'black')
    else if $(@).hasClass('contrast-dark')
      $(@).removeClass('contrast-dark')
      $(@).addClass('contrast-light')
      $('body.editor').removeClass('contrast-dark')
      $('html').css('background-color', 'white')

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
      container.webkitRequestFullScreen()

  cancelFullScreen = ->
    if document.cancelFullScreen
      document.cancelFullScreen()
    else if document.mozCancelFullScreen
      document.mozCancelFullScreen()
    else if document.webkitCancelFullScreen
      document.webkitCancelFullScreen()

  $('div.fullscreen').on 'click', ->
    if $(@).hasClass('ion-arrow-expand')
      launchFullScreen(document.documentElement)
      $(@).removeClass('ion-arrow-expand')
      $(@).addClass('ion-arrow-shrink')
    else if $(@).hasClass('ion-arrow-shrink')
      cancelFullScreen()
      $(@).removeClass('ion-arrow-shrink')
      $(@).addClass('ion-arrow-expand')
