$ ->
  new DashboardEvents
    el: $(document)

  textareaResize = ->
    textareaSize = document.documentElement.clientHeight - 100

    $('body.dashboard textarea').css('height', "#{textareaSize}px")

  $(document).ready ->
    textareaResize()

  $(window).resize ->
    textareaResize()

  return
