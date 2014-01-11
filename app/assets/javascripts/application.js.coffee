#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require turbolinks
#= require angular
#= require angular/main
#= require_tree ./angular/controllers
#= require nprogress
#= require marked
#= require devise

NProgress.configure
  showSpinner: false

$(document).on 'page:fetch', ->
  NProgress.start()

$(document).on 'page:change', ->
  NProgress.done()

$(document).on 'page:restore', ->
  NProgress.remove()
