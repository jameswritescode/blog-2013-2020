@dashboardApp = angular.module('dashboardApp', [])

@dashboardApp.directive 'separatePosts', ($compile) ->
  return {
    link: (scope, element, attrs) ->
      divider = angular.element('<li class="divider"></li>')
      divider.insertAfter(element) unless scope.$last

      $compile(divider)(scope)
  }
