describe 'DashboardCtrl', ->
  beforeEach module('dashboardApp')

  it 'sets posts to an empty array', inject(($controller) ->
    scope      = {}
    controller = $controller 'DashboardCtrl', $scope = scope

    expect(scope.posts.length).toBe 0
  )
