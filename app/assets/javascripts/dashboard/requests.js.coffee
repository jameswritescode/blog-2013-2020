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
      notice.text('Saved')
      notice.trigger('post_saved', [data])
    .error ->
      notice.text('Not Saved')

  @destroy_post: ->
    notice = $('body.dashboard div.notices')

    $.ajax
      url:      $('form').attr('action')
      type:     'DELETE'
      data:     { '_method': 'destroy' }
      dataType: 'JSON'
    .success (data) ->
      el = $("body.dashboard div.posts li[data-slug='#{data.slug}']")
      el.next().remove()
      el.remove()

      notice.text('Post Deleted')

      $('body.dashboard li').first().click()
    .error ->
      notice.text('Post Not Deleted')
