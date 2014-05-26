@dashboard.directive 'dragAndDrop', ->
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
