class MovieClub.Views.ProposeEventForm extends Backbone.View
  template: JST["templates/events/propose_event_form"]

  events:
    "click .event-propose":    "showFormHandler"
    "click .event-new-cancel": "cancelFormHandler"
    "submit #propose-event-form": "proposeEventHandler"

  render: () ->
    @$el.html(@template())
    @toggleForm(false)
    @

  showFormHandler: (e) ->
    e.preventDefault()
    @toggleForm(true);

  cancelFormHandler: (e) ->
    e.preventDefault()
    @toggleForm(false)

  proposeEventHandler: (e) ->
    e.preventDefault()
    $form = @$el.find('#propose-event-form')

    proposeEventSuccessHandler = (model, response, options) ->
      @toggleForm(false)

    proposeEventErrorHandler = (model, xhr, options) ->
      if xhr.responseJSON and 'errors' of xhr.responseJSON
        for field, error of xhr.responseJSON['errors']
          $field = $form.find(".form-event-#{field}")
          $field.addClass("has-error")
          $field.append("<p class='text-danger'>#{error}</p>")

    proposedEvent = {
      title: $form.find("input[name='event[title]']").val(),
      description: $form.find("textarea[name='event[description]']").val(),
      trailer_url: $form.find("input[name='event[trailer_url]']").val()
    }

    @collection.create(proposedEvent, {
      wait: true,
      success: proposeEventSuccessHandler,
      error: proposeEventErrorHandler
    })

  toggleForm: (showForm) ->
    @$el.find("a.event-propose").toggle(!showForm)
    @$el.find("#propose-event-form-container").toggle(showForm)
