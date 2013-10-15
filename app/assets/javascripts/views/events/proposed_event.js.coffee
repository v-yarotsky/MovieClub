class MovieClub.Views.ProposedEvent extends Backbone.View
  tagName: "tr"
  className: "event-proposed"
  template: JST["templates/events/proposed_event"]

  events:
    "click .vote-event": "voteEventHandler"

  initialize: () ->
    @listenTo(@model, "change", @render, @)

  render: () ->
    @$el.html(@template(@model.attributes))
    @

  voteEventHandler: (e) =>
    e.preventDefault()
    @model.increaseInterested()
