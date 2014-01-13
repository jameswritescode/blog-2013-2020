class @DashboardCtrl
  @$inject = ['$scope', '$http', '$location']

  constructor: (@scope, @http, @location) -> @init()

  init: =>
    @http.get('/posts.json').success (data) =>
      @scope.posts = data

    @scope.dashboard       = $('body.dashboard')
    @scope.loadPost        = @loadPost
    @scope.newPost         = @newPost
    @scope.loadPostFromUrl = @loadPostFromUrl
    @scope.getPostFromSlug = @getPostFromSlug

  loadPost: (post) =>
    @scope.dashboard.find('input').val(post.title)
    @scope.dashboard.find('textarea').val(post.content)
    @location.path("/dashboard/edit/#{post.slug}")

  newPost: =>
    @scope.dashboard.find('input, textarea').val('')
    @location.path('/dashboard')

  loadPostFromUrl: =>
    unless @location.path().match(/\/dashboard\/edit\/(\S+)/)
      @location.path '/dashboard'

      return

    split = @location.path().split('/')
    slug  = split[split.length - 1]

    @scope.getPostFromSlug(slug)

  getPostFromSlug: (slug) =>
    @http.get("/#{slug}.json").success (data) =>
      @scope.loadPost(data)
    .error =>
      @location.path('/dashboard')

@dashboard.controller 'DashboardCtrl', @DashboardCtrl
