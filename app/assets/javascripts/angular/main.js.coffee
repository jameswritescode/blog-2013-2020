@dashboard = angular.module('dashboard', ['ngSanitize'])

@dashboard.config ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]
