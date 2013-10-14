class MovieClub.Views.ProposedEvents extends Backbone.View
  tagName: "tbody"
  class: "events-proposed"

  render: ->
    events = @collection.models
    @$el.append(new MovieClub.Views.ProposedEvent(model: event).render().el) for event in events
    @

