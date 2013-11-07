class MovieClub.Views.ProposedEvents extends MovieClub.CompositeView
  initialize: ->
    @listenTo(@collection, "add", @renderEvent)
    @listenTo(@collection, "reset", @render)

  render: ->
    @log("render proposed events")
    @$el.empty()
    @renderEvent(event) for event in @collection.models
    @

  renderEvent: (event) ->
    @log("proposed events renderEvent")
    proposedEventView = new MovieClub.Views.ProposedEvent(model: event)
    @registerSubview(proposedEventView)
    @$el.prepend(proposedEventView.render().el)

  leave: ->
    @log("leave proposed events")
    @removeSubviews()
    @remove()


