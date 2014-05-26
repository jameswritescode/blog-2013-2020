@dashboard.directive 'stats', ->
  link: (scope, element, attrs) ->
    element.bind 'keyup propertychange paste', ->
      scope.calculateCounts()
