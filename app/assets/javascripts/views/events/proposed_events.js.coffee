MovieClub.module "Views", (Views) ->
  class @ProposedEvents extends @CompositeView
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
      proposedEventView = new Views.ProposedEvent(model: event)
      @registerSubview(proposedEventView)
      @$el.prepend(proposedEventView.render().el)

    leave: ->
      @log("leave proposed events")
      @removeSubviews()
      @remove()


