class MovieClub.Views.ProposedEvents extends Backbone.View
  tagName: "tbody"
  className: "proposed-events-list"

  initialize: ->
    @listenTo(@collection, "add", @renderEvent)
    @listenTo(@collection, "reset", @render)

  render: ->
    @$el.empty()
    @renderEvent(event) for event in @collection.models
    @

  renderEvent: (event) ->
    @$el.prepend(new MovieClub.Views.ProposedEvent(model: event).render().el)

