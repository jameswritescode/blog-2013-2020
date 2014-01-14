class @PostCtrl
  @$inject = ['$scope', '$http']

  constructor: (@scope, @http) -> @init()

  init: ->
    @typingTimer = null

    @watchers()

  watchers: ->
    @scope.$watch =>
      [@scope.title, @scope.content]
    , (newVal, oldVal) =>
      return if newVal is undefined
      return if @scope.dashboard.find('input[name="post[title]"]').val() is ''
      return if @scope.dashboard.find('textarea').val() is ''

      @saveTimer()
    , true

  saveTimer: ->
    @scope.dashboard.find('div.notices').text('Saving...')

    clearTimeout(@typingTimer)

    @typingTimer = setTimeout =>
      @scope.save()
    , 400

@dashboard.controller 'PostCtrl', @PostCtrl
