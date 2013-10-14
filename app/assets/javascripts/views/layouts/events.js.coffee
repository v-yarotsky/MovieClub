class MovieClub.Views.EventsLayout extends Backbone.View
  template: JST["templates/layouts/events"]

  initialize: (bootstrap) ->
    @proposedEvents = new MovieClub.Collections.ProposedEvents(bootstrap.proposedEvents)

  render: ->
    @$el.html(@template())
    @newEventView ?= new MovieClub.Views.ProposeEventForm()
    @eventsView ?= new MovieClub.Views.ProposedEvents(collection: @proposedEvents)
    @$('#event-new').html(@newEventView.render().el)
    @$('#events-proposed table').append(@eventsView.render().el)
    @

