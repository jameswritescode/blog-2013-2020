class @DashboardCtrl
  @$inject = ['$scope', '$http']

  constructor: (@scope, @http) -> @init()

  init: =>
    @updatePosts()

    @scope.dashboard        = angular.element('body.dashboard')
    @scope.mode             = 'edit'
    @scope.loadPost         = @loadPost
    @scope.newPost          = @newPost
    @scope.calculateCounts  = @calculateCounts
    @scope.changeFormAction = @changeFormAction
    @scope.save             = @save
    @scope.togglePreview    = @togglePreview
    @scope.edit             = @edit
    @scope.preview          = @preview

  updatePosts: =>
    @http.get('/posts.json').success (data) =>
      @scope.posts = data

  loadPost: (post) =>
    @scope.edit()
    @scope.changeFormAction('patch', post.id)
    @scope.dashboard.find('input[name="post[title]"]').val(post.title)
    @scope.dashboard.find('textarea').val(post.content)
    @scope.calculateCounts()

    return

  newPost: =>
    @scope.changeFormAction('create')
    @scope.dashboard.find('input[name="post[title]"], textarea').val('')
    @scope.calculateCounts()

    return

  calculateCounts: =>
    text      = @scope.dashboard.find('textarea').val()
    words     = text.trim().replace(/^\s+/gi, ' ').split(' ')
    words     = if words.length is 1 and words[0] is '' then 0 else words.length

    @scope.dashboard.find('span.characters').text("#{text.length} Characters")
    @scope.dashboard.find('span.words').text("#{words} Words")

  changeFormAction: (type, path) =>
    main = '/posts'
    el   = angular.element('form')
    el.find('input[name="_method"]').remove()

    switch type
      when 'patch'
        el.attr('action', "#{main}/#{path}")
        el.find('div').append('<input name="_method" type="hidden" value="patch" />')
      when 'create' then el.attr('action', main)

  preview: =>
    @scope.dashboard.find('div.menu li.preview').removeClass('preview').addClass('edit').find('a').text('Edit')

    textarea = @scope.dashboard.find('textarea')
    parsed   = marked(textarea.val())

    textarea.hide()

    @scope.dashboard.find('div#preview').html(parsed).show()
    @scope.mode = 'preview'

  edit: =>
    @scope.dashboard.find('div.menu li.edit').removeClass('edit').addClass('preview').find('a').text('Preview')
    @scope.dashboard.find('div#preview').html('').hide()
    @scope.dashboard.find('textarea').show()
    @scope.mode = 'edit'


  togglePreview: =>
    if @scope.mode is 'edit'
      @scope.preview()
    else
      @scope.edit()

  save: =>
    notices = @scope.dashboard.find('div.notices')
    form    = angular.element('form')
    action  = form.attr('action')
    fields  = form.serializeArray()
    send    = {}

    angular.forEach fields, (object) ->
      if matches = object.name.match(/post\[(\S+)\]/)
        match = matches[0].replace(/post\[(\S+)\]/, '$1')

        post        = send['post'] ||= {}
        post[match] = object.value
      else
        send[object.name] = object.value

    @http
      url:     action,
      method:  'POST',
      data:    angular.toJson(send),
      headers: { 'Content-Type': 'application/json' }
    .success (data) =>
      notices.find('notices').text('Saved')

      @scope.$emit('post_saved', data)
    .error ->
      notices.find('div.notices').text('Not Saved')

@dashboard.controller 'DashboardCtrl', @DashboardCtrl
