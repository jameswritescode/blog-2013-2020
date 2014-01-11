@dashboardApp.controller 'DashboardCtrl', ['$scope', '$http', ($scope, $http) ->
  $http.get('/posts.json').success (data) ->
    $scope.posts = data
]
