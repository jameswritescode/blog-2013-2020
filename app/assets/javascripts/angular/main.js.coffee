@dashboard = angular.module('dashboard', [])

@dashboard.config ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]

@dashboard.directive 'separatePosts', ($compile) ->
  return {
    link: (scope, element, attrs) ->
      divider = angular.element('<li class="divider"></li>')
      divider.insertAfter(element) unless scope.$last

      $compile(divider)(scope)
  }

@dashboard.directive 'macros', ->
  return {
    link: (scope, element, attrs) ->
      element.bind 'keyup keydown keypress', ($event) ->
        if $event.metaKey and $event.keyCode is 80
          $event.preventDefault()

          scope.togglePreview()
        else if $event.metaKey and $event.keyCode is 83
          $event.preventDefault()

          scope.save()
        else if $event.keyCode is 9 and $event.type is 'keydown'
          $event.preventDefault()

          el    = scope.dashboard.find('textarea')
          start = el[0].selectionStart
          end   = el[0].selectionEnd

          el.val("#{el.val().substring(0, start)}  #{el.val().substring(end)}")
          el[0].selectionStart = el[0].selectionEnd = start + 2
  }

@dashboard.directive 'stats', ->
  return {
    link: (scope, element, attrs) ->
      element.bind 'keyup propertychange paste', ->
        scope.calculateCounts()
  }
