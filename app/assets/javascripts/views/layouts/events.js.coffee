class MovieClub.Views.EventsLayout extends Backbone.View
  template: JST["templates/layouts/events"]

  events:
    "click .js-proposed-event-show": "proposedEventShowHandler"

  initialize: (bootstrap) ->
    @proposedEvents = new MovieClub.Collections.ProposedEvents(bootstrap.proposedEvents)

  render: () ->
    @$el.html(@template())
    @newEventView ?= new MovieClub.Views.ProposeEventForm(collection: @proposedEvents)
    @eventsView ?= new MovieClub.Views.ProposedEvents(collection: @proposedEvents)
    @$('#event-new').html(@newEventView.render().el)
    @$('#events-proposed table').append(@eventsView.render().el)
    @

  proposedEventShowHandler: (e) =>
    e.preventDefault()
    proposedEventId = $(e.target).data('proposed-event-id')
    proposedEventDialog = new MovieClub.Views.ProposedEventDialog(model: @proposedEvents.get(proposedEventId))

    @$("#events-proposed").append(proposedEventDialog.render().el)
    proposedEventDialog.open()
