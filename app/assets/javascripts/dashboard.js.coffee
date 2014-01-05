$ ->
  $('li.contrast').on 'click', ->
    if $(@).hasClass('contrast-light')
      $(@).removeClass('contrast-light').addClass('contrast-dark')
      $('body.dashboard').addClass('contrast-dark')
      $('html').css('background-color', 'black')
    else if $(@).hasClass('contrast-dark')
      $(@).removeClass('contrast-dark').addClass('contrast-light')
      $('body.dashboard').removeClass('contrast-dark')
      $('html').css('background-color', 'white')

    return false

  textareaResize = ->
    textareaSize = document.documentElement.clientHeight - 100

    $('body.dashboard textarea').css('height', "#{textareaSize}px")

  $(document).ready ->
    textareaResize()

  $(window).resize ->
    textareaResize()

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
    if $(@).find('i').hasClass('ion-arrow-expand')
      launchFullScreen(document.documentElement)
    else if $(@).find('i').hasClass('ion-arrow-shrink')
      cancelFullScreen()

    return false

  $(document).on 'webkitfullscreenchange mozfullscreenchange fullscreenchange', ->
    el = $('li.fullscreen').find('i')

    if el.hasClass('ion-arrow-expand')
      el.removeClass('ion-arrow-expand').addClass('ion-arrow-shrink')
    else if el.hasClass('ion-arrow-shrink')
      el.removeClass('ion-arrow-shrink').addClass('ion-arrow-expand')


  $('body.dashboard textarea').on 'keyup propertychange paste', ->
    text  = $(@).val()
    words = text.trim().replace(/^\s+/gi, ' ').split(' ')
    words = if words.length is 1 and words[0] is '' then words = 0 else words.length

    $('span.characters').text("#{text.length} Characters")
    $('span.words').text("#{words} Words")


  $('body.dashboard textarea').on 'focus keydown', ->
    $('body.dashboard div.menu, body.dashboard div.counts, body.dashboard div.posts').addClass('editor-active')

  $('body.dashboard').on 'mousemove', ->
    $('body.dashboard div.menu, body.dashboard div.counts, body.dashboard div.posts').removeClass('editor-active')

  form_action = (type, path) ->
    main = '/posts'
    el   = $('form')

    el.find('input[name="_method"]').remove()

    switch type
      when 'patch'
        el.attr('action', "#{main}/#{path}")
        el.find('div').append('<input name="_method" type="hidden" value="patch" />')
      when 'create'
        el.attr('action', main)

  $('body.dashboard div.posts li').on 'click', ->
    slug     = $(@).data('slug')
    title    = $('input[name="post[title]"]')
    textarea = $('textarea[name="post[content]"]')

    if slug is undefined
      form_action('create')
      title.val('')
      textarea.val('')
    else
      $.get "/#{slug}.json", (data) ->
        form_action('patch', data.id)
        title.val(data.title)
        textarea.val(data.content)

  $(document).on 'keyup keydown keypress', (event) ->
    document.forms[0].submit() if event.metaKey and event.keyCode is 13

  return
