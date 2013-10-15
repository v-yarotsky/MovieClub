class MovieClub.Views.ProposedEvents extends Backbone.View
  tagName: "tbody"
  className: "events-proposed"

  initialize: () ->
    @collection.on('add', @render, @)
    @collection.on('reset', @render, @)

  render: () ->
    @$el.html('')
    @$el.append(new MovieClub.Views.ProposedEvent(model: event).render().el) for event in @collection.models
    @
