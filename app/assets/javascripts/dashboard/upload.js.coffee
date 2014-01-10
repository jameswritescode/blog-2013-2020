class @DashboardUpload
  constructor: (@options) -> @init()

  init: ->
    @setEventHandlers()

  setEventHandlers: ->
    @options.el.on 'dragenter dragover dragleave', (e) => @cancelEvents(e)
    @options.el.on 'dragover', (e) => @dropEffect(e)
    @options.el.on 'drop', (e) => @drop(e)

  cancelEvents: (event) ->
    event.stopPropagation()
    event.preventDefault()

    false

  dropEffect: (event) ->
    event.originalEvent.dataTransfer.dropEffect = 'copy'

  drop: (event) ->
    event.preventDefault()
    event = event.originalEvent

    files = event.dataTransfer.files

    `for (var i = 0; i < files.length; i++) {
      if (/image/.test(files[i].type)) {
        this.createAttachment(files[i])
      }
    }`

    return

  createAttachment: (file) ->
    data = new FormData()

    data.append('attachment[file]', file)

    $.ajax
      url:         '/attachments'
      data:        data
      cache:       false
      contentType: false
      processData: false
      type:        'POST'
    .success (data) =>
      @insertAtCaret("![](#{data.attachment.url})", $('body.dashboard textarea'))

      DashboardRequests.save_post()

  insertAtCaret: (text, el) ->
    start = el[0].selectionStart
    end   = el[0].selectionEnd

    el.val("#{el.val().substring(0, start)}#{text}#{el.val().substring(end)}")

    el[0].selectionStart = el[0].selectionEnd = start + text.length
