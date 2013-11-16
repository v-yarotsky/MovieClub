# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require bootstrap-datepicker
#= require js-routes
#= require underscore
#= require backbone
#= require_tree ./templates
#= require_self
#= require ./utils/base_view
#= require ./utils/composite_view
#= require_tree ./views
#= require ./routers/base
#= require_tree ./routers
#= require_tree ./models
#= require_tree ./collections
#= require_tree .

Backbone.$ = $

window.MovieClub = new (Backbone.View.extend
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  template: JST["templates/layouts/application"]

  initialize: ->
    @renderLoggingEnabled = false
    @sessionLoggingEnabled = false

  render: ->
    @$el.html(@template())
    @

  start: (bootstrap, routerConstructor) ->
    @bootstrap = bootstrap
    @session().reset(bootstrap.session)
    @setElement(document.body)
    @render()
    @router = routerConstructor()
    Backbone.history.start()

  session: ->
    @appSession ?= new MovieClub.Models.Session()
)()

