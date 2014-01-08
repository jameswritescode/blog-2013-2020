class @DashboardRequests
  @save_post: ->
    submit = $('form').serialize()
    notice = $('body.dashboard div.notices')

    $.ajax
      url:      $('form').attr('action')
      type:     'POST'
      data:     submit
      dataType: 'JSON'
    .success (data) ->
      if data.errors
        notice.text('Not Saved')
      else
        notice.trigger('post_saved', [data])
    .error ->
      notice.text('Not Saved')

  @destroy_post: ->
    $.ajax
      url:      $('form').attr('action')
      type:     'DELETE'
      data:     { '_method': 'destroy' }
      dataType: 'JSON'
    .success (data) ->
      el = $("body.dashboard div.posts li[data-slug='#{data.slug}']")
      el.next().remove()
      el.remove()

      $('body.dashboard li').first().click()
