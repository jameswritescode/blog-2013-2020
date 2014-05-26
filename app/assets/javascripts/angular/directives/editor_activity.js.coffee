@dashboard.directive 'editorActivity', ->
  link: (scope, element, attrs) ->
    main = scope.dashboard.find('div.menu, div.counts, div.posts, div.notices')

    element.bind 'focus keydown', ($event) ->
      target = angular.element($event.currentTarget)

      main.add('input.title, textarea').removeClass('editor-active')

      if target.hasClass('title')
        main.add('textarea').addClass('editor-active')
      else if target.hasClass('content')
        main.add('input.title').addClass('editor-active')

    element.bind 'mousemove', ($event) ->
      main.add('input.title, textarea').removeClass('editor-active')
