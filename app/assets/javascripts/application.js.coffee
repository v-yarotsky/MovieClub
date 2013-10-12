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
#= require_tree ./templates
#= require_self
#= require_tree .

window.MovieClub =
  Models: {}
  Collections: {}
  Views: {}
  Controllers: {}

class MovieClub.Router extends Backbone.Router
  routes:
    "": "index"

  initialize: ->
    @proposedEvents = new MovieClub.Collections.ProposedEvents()
    @newEventView = new MovieClub.Views.ProposeEventForm()
    @eventsView = new MovieClub.Views.ProposedEvents({ collection: @proposedEvents })

  index: ->
    $('#event-new').html(@newEventView.render().el)
    $('#events-proposed').html(@eventsView.render().el)
    
