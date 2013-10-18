class MovieClub.Views.ProposedEventDialog extends Backbone.View
  tagName: "div"
  className: "modal fade proposed-event-details"
  template: JST["templates/events/proposed_event_dialog"]

  events:
    "click .js-proposed-event-vote": "voteForEventHandler"
    "click .js-proposed-event-details-dismiss": "closeDialogHandler"

  render: ->
    @$el.html(@template(@model.attributes))
    @$el.modal()
    @

  voteForEventHandler: (e) ->
    e.preventDefault()
    @model.increaseInterested()

  closeDialogHandler: (e)->
    e.preventDefault()
    @$el.on("hidden.bs.modal", @remove.bind(@))
    @$el.modal("hide")
    Backbone.history.navigate("")

