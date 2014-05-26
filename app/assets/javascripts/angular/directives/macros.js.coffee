@dashboard.directive 'macros', ->
  link: (scope, element, attrs) ->
    element.bind 'keyup keydown keypress', ($event) ->
      if $event.metaKey and $event.keyCode is 80
        $event.preventDefault()

        scope.togglePreview()

        Rainbow.color()
      else if $event.metaKey and $event.keyCode is 83
        $event.preventDefault()

        scope.save()
      else if $event.keyCode is 9 and $event.type is 'keydown'
        $event.preventDefault()

        scope.insertAtCaret('  ', scope.dashboard.find('textarea'))
