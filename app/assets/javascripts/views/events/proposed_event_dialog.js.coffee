class MovieClub.Views.ProposedEventDialog extends Backbone.View
  tagName: "div"
  className: "modal fade"
  template: JST["templates/events/proposed_event_dialog"]

  events:
    "click .js-vote-proposed-event": "voteEventHandler"

  render: () ->
    @$el.html(@template(@model.attributes))
    @

  open: () ->
    @$el.modal("show")

  voteEventHandler: (e) ->
    e.preventDefault()
    @model.increaseInterested()
