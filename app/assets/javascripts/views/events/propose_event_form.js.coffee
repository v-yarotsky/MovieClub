class MovieClub.Views.ProposeEventForm extends Backbone.View
  template: JST["templates/events/propose_event_form"]

  events:
    "click .event-propose":    "showFormHandler"
    "click .event-new-cancel": "cancelProposeEventHandler"
    "submit #propose-event-form": "createProposeEventHandler"

  render: ->
    @$el.html(@template())
    @toggleForm(false)
    @

  showFormHandler: (e) ->
    e.preventDefault()
    @toggleForm(true);

  cancelProposeEventHandler: (e) ->
    e.preventDefault()
    @toggleForm(false)

  createProposeEventHandler: (e) ->
    e.preventDefault()
    $form = @$el.find('#propose-event-form')

    proposedEvent = new MovieClub.Models.Event({
      title: $form.find("input[name='event[title]']").val(),
      description: $form.find("input[name='event[description]']").val(),
      trailer_url: $form.find("input[name='event[trailer_url]']").val()
    })

    proposedEvent.save()
    @collection.add(proposedEvent)

    @toggleForm(false)

  toggleForm: (showForm) ->
    @$el.find("a.event-propose").toggle(!showForm)
    @$el.find("#propose-event-form-container").toggle(showForm)