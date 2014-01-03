MovieClub.module "Views", (Views, MovieClub) ->
  class @ProposedEvent extends @BaseView
    tagName: "tr"
    className: "event-proposed"
    template: JST["templates/events/proposed_event"]

    events:
      "click .js-proposed-event-vote": "voteEventHandler"

    initialize: () ->
      @log("create proposed event")
      @listenTo(@model, "change", @render, @)

    render: () ->
      @log("render proposed event")
      @$el.html(@template(@model.attributes))
      @

    voteEventHandler: (e) =>
      @log("proposed event voteEventHandler")
      e.preventDefault()
      @model.increaseInterested()
