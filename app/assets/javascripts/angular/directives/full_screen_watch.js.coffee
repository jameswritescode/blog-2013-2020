@dashboard.directive 'fullScreenWatch', ->
  link: (scope, element, attrs) ->
    element.bind 'fullscreenchange mozfullscreenchange webkitfullscreenchange', ($event) ->
      scope.detectFullScreenChange($event)
