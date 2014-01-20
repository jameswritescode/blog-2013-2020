@dashboard = angular.module('dashboard', [])

@dashboard.config ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]

@dashboard.directive 'separatePosts', ($compile) ->
  return {
    link: (scope, element, attrs) ->
      divider = angular.element('<li class="divider"></li>')
      divider.insertAfter(element) unless scope.$last

      $compile(divider)(scope)
  }

@dashboard.directive 'macros', ->
  return {
    link: (scope, element, attrs) ->
      element.bind 'keyup keydown keypress', ($event) ->
        if $event.metaKey and $event.keyCode is 80
          $event.preventDefault()

          scope.togglePreview()
        else if $event.metaKey and $event.keyCode is 83
          $event.preventDefault()

          scope.save()
        else if $event.keyCode is 9 and $event.type is 'keydown'
          $event.preventDefault()

          scope.insertAtCaret('  ', scope.dashboard.find('textarea'))
  }

@dashboard.directive 'stats', ->
  return {
    link: (scope, element, attrs) ->
      element.bind 'keyup propertychange paste', ->
        scope.calculateCounts()
  }

@dashboard.directive 'dragAndDrop', ->
  return {
    link: (scope, element, attrs) ->
      element.bind 'dragenter dragover dragleave', ($event) ->
        $event.stopPropagation()
        $event.preventDefault()

        false

      element.bind 'dragover', ($event) ->
        $event.originalEvent.dataTransfer.dropEffect = 'copy'

      element.bind 'drop', ($event) ->
        $event.preventDefault()

        files = $event.originalEvent.dataTransfer.files

        for file in files
          if /image/.test(file.type)
            scope.createAttachment(file)
  }
