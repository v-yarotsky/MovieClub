class MovieClub.Views.EventsLayout extends MovieClub.CompositeView
  template: JST["templates/layouts/events"]

  initialize: (options) ->
    @log("create events layout")
    @upcomingEventModel = new MovieClub.Models.UpcomingEvent(options.bootstrap.upcomingEvent)
    @proposedEventsCollection = new MovieClub.Collections.ProposedEvents(options.bootstrap.proposedEvents)
    @upcomingEventView = new MovieClub.Views.UpcomingEvent(model: @upcomingEvent())
    @newEventView = new MovieClub.Views.ProposeEvent(collection: @proposedEvents())
    @eventsView = new MovieClub.Views.ProposedEvents(collection: @proposedEvents())
    @registerSubview(@upcomingEventView)
    @registerSubview(@newEventView)
    @registerSubview(@eventsView)

  render: ->
    @log("render events layout")
    @$el.html(@template())
    @renderSubview(@upcomingEventView, "#upcoming-event")
    @renderSubview(@newEventView, "#proposed-event-new")
    @renderSubview(@eventsView, "#proposed-events-list table tbody")
    @

  renderEvent: (eventId) ->
    @log("events layout renderEvent")
    eventDialog = new MovieClub.Views.ProposedEventDialog(model: @proposedEvents().get(eventId))
    @$("#proposed-event-details").html(eventDialog.render().el)
    @

  leave: ->
    @log("leave events layout")
    @removeSubviews()
    # TODO: not calling @remove because it will break the initial layout. Ideas?
    @stopListening()
    @$el.empty()

  # Need to figure out something better.
  proposedEvents: ->
    if @proposedEventsCollection.isEmpty()
      @proposedEventsCollection.fetch(async: false)
    @proposedEventsCollection

  upcomingEvent: ->
    if not @upcomingEventModel.isAvailable()
      @upcomingEventModel.fetch(async: false)
    @upcomingEventModel
