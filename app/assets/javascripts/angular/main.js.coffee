@dashboard = angular.module('dashboard', [])

@dashboard.config ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]
