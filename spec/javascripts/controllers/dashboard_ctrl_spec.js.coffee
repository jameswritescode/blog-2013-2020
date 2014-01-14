describe 'DashboardCtrl', ->
  scope        =
  ctrl         =
  $httpBackend =
  posts        = [{ title: 'Testing', content: 'Test post' }, { title: 'Hello!', content: 'World!' }]

  beforeEach module('dashboard')

  beforeEach inject((_$httpBackend_, $rootScope, $controller) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/posts.json').respond posts

    scope = $rootScope.$new()
    ctrl  = $controller 'DashboardCtrl', $scope: scope
  )

  it 'should create "posts" model with 2 phones fetched from xhr', ->
    expect(scope.posts).toBeUndefined()

    $httpBackend.flush()

    expect(scope.posts.length).toBe 2
    expect(scope.posts).toEqual posts
