#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require turbolinks
#= require dashboard
#= require vendor
#= require angular/main
#= require_tree ./angular/controllers
#= require_tree ./angular/directives
#= require nprogress
#= require marked
#= require devise
#= require rainbow-custom.min

NProgress.configure
  showSpinner: false

$(document).on 'page:fetch', ->
  NProgress.start()

$(document).on 'page:change', ->
  NProgress.done()

$(document).on 'page:restore', ->
  NProgress.remove()
