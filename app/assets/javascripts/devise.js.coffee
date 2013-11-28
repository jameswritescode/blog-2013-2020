$ ->
  $('div#login form input').bind 'keyup', ->
    if $(@).hasClass('validate-email')
      if $(@).val() == '' or $(@).val().match(/.*@.*\..*/) == null then bad_field($(@)) else bad_field($(@), true)

    if $(@).hasClass('validate-password')
      if $(@).val() == '' then bad_field($(@)) else bad_field($(@), true)

  bad_field = (klass, remove = false) ->
    klass.attr('placeholder', "please enter #{klass.attr('placeholder')}") if klass.attr('placeholder').match(/please/) == null

    if remove == false then klass.addClass('bad_field')
    if remove == true then klass.removeClass('bad_field')
