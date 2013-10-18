class MovieClub.Views.EventsLayout extends Backbone.View
  template: JST["templates/layouts/events"]

  initialize: (bootstrap) ->
    @proposedEvents = new MovieClub.Collections.ProposedEvents(bootstrap.proposedEvents)

  render: ->
    @$el.html(@template())
    @newEventView ?= new MovieClub.Views.ProposeEvent(collection: @proposedEvents)
    @eventsView ?= new MovieClub.Views.ProposedEvents(collection: @proposedEvents)
    @$("#proposed-event-new").html(@newEventView.render().el)
    @$("#proposed-events-list table").append(@eventsView.render().el)
    @

  showEvent: (eventId) ->
    eventDialog = new MovieClub.Views.ProposedEventDialog(model: @proposedEvents.get(eventId))
    @$("#proposed-event-details").html(eventDialog.render().el)

