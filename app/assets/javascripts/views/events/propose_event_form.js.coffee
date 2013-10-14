class MovieClub.Views.ProposeEventForm extends Backbone.View
  template: JST["templates/events/propose_event_form"]

  events:
    "click .event-new-cancel": "cancelProposeEvent"
    "click .event-propose":    "showForm"

  render: ->
    @$el.html(@template())
    @toggleForm(false)
    @

  toggleForm: (showForm) ->
    @$el.find("a.event-propose").toggle(!showForm)
    @$el.find("#event-form").toggle(showForm)

  showForm: (e) ->
    e.preventDefault()
    @toggleForm(true);

  cancelProposeEvent: (e) ->
    e.preventDefault()
    @toggleForm(false)

