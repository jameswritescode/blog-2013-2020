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
