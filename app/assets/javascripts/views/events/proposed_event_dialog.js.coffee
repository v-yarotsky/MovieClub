class MovieClub.Views.ProposedEventDialog extends MovieClub.BaseView
  tagName: "div"
  className: "modal fade proposed-event-details"
  template: JST["templates/events/proposed_event_dialog"]

  events:
    "click .js-proposed-event-vote": "voteForEventHandler"
    "click .js-proposed-event-details-dismiss": "dismissDialogHandler"

  render: ->
    @log("render proposed event dialog")
    @$el.html(@template(@model.attributes))
    @$el.on("hidden.bs.modal", @_closeDialogHandler)
    @$el.modal()
    @

  voteForEventHandler: (e) ->
    @log("proposed event dialog voteForEventHandler")
    e.preventDefault()
    @model.increaseInterested()

  dismissDialogHandler: (e) ->
    @log("proposed event dialog dismiss")
    @$el.modal("hide")

  _closeDialogHandler: (e) =>
    @log("proposed event dialog closeDialogHandler")
    e.preventDefault()
    @remove()
    Backbone.history.navigate("/")

