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
#= require_tree ./templates
#= require_self
#= require_tree .

Backbone.$ = $

window.MovieClub = new (Backbone.View.extend
  Models: {}
  Collections: {}
  Views: {}

  Router: new (Backbone.Router.extend
    routes:
      "": "index"

    index: ->
      $('#event-new').html(MovieClub.newEventView.render().el)
      $('#events-proposed').html(MovieClub.eventsView.render().el)
  )()

  template: JST["templates/application"]

  render: ->
    @$el.html(@template())
    @

  start: (bootstrap) ->
    @proposedEvents = new MovieClub.Collections.ProposedEvents(bootstrap.proposedEvents)
    @newEventView = new MovieClub.Views.ProposeEventForm()
    @eventsView = new MovieClub.Views.ProposedEvents(collection: MovieClub.proposedEvents)
    Backbone.history.start()
)()


