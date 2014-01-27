class @MenuCtrl
  @$inject = ['$scope']

  constructor: (@scope) -> @init()

  init: ->
    @scope.publish                = @publish
    @scope.destroy                = @destroy
    @scope.fullscreen             = @fullscreen
    @scope.contrast               = @contrast
    @scope.launchFullScreen       = @launchFullScreen
    @scope.cancelFullScreen       = @cancelFullScreen
    @scope.detectFullScreenChange = @detectFullScreenChange

  contrast: (e) ->
    el         = angular.element(e.originalEvent.srcElement).parent()
    background = angular.element('body.dashboard, html')

    if el.hasClass('contrast-light')
      el.removeClass('contrast-light').addClass('contrast-dark')
      background.addClass('contrast-dark')
    else if el.hasClass('contrast-dark')
      el.removeClass('contrast-dark').addClass('contrast-light')
      background.removeClass('contrast-dark')

    return

  fullscreen: (e) =>
    el = angular.element(e.originalEvent.srcElement).parent()

    if el.hasClass('expand')
      @scope.launchFullScreen()
    else if el.hasClass('shrink')
      @scope.cancelFullScreen()

  launchFullScreen: ->
    container = document.documentElement

    if container.requestFullScreen
      container.requestFullScreen()
    else if container.mozRequestFullScreen
      container.mozRequestFullScreen()
    else if container.webkitRequestFullScreen
      container.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT)

  cancelFullScreen: ->
    if document.cancelFullScreen
      document.cancelFullScreen()
    else if document.mozCancelFullScreen
      document.mozCancelFullScreen()
    else if document.webkitCancelFullScreen
      document.webkitCancelFullScreen()

  detectFullScreenChange: (e) ->
    el = angular.element(e.originalEvent.srcElement).find('div.menu li.fullscreen')

    if el.hasClass('expand')
      el.removeClass('expand').addClass('shrink')
    else if el.hasClass('shrink')
      el.removeClass('shrink').addClass('expand')

  publish: =>
    form = @scope.dashboard.find('form')
    form.append('<input name="post[published]" type="hidden" value="true" />')

    @scope.save()

    form.find('input[name="post[published]"]').remove()

    return

  destroy: =>
    notice = @scope.dashboard.find('div.notices')

    $.ajax
      url:      @scope.dashboard.find('form').attr('action')
      type:     'DELETE'
      data:     { '_method': 'destroy' }
      dataType: 'JSON'
    .success (data) =>
      notice.text('Post Deleted')

      @scope.dashboard.find('div.posts li').first().click()
    .error ->
      notice.text('Post Not Deleted')

@dashboard.controller 'MenuCtrl', @MenuCtrl
