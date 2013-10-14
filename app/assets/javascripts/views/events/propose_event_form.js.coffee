class MovieClub.Views.ProposeEventForm extends MovieClub.BaseView
  id: "propose-event-form-container"
  template: JST["templates/events/propose_event_form"]

  events:
    "click .js-proposed-event-new-cancel": "cancelFormHandler"
    "submit form": "proposeEventHandler"

  render: ->
    @log("render propose event form")
    @$el.html(@template())
    @

  cancelFormHandler: (e) ->
    @log("propose event form cancel")
    e.preventDefault()
    @trigger("cancel")

  proposeEventHandler: (e) ->
    @log("propose event form proposeEventHandler")
    e.preventDefault()

    proposedEvent =
      title:       @$el.find("input[name='event[title]']").val()
      description: @$el.find("textarea[name='event[description]']").val()
      trailer_url: @$el.find("input[name='event[trailer_url]']").val()

    @collection.create proposedEvent,
      wait: true

      success: =>
        @trigger("create")

      error: (model, xhr) =>
        @removeErrors()

        if xhr.responseJSON and 'errors' of xhr.responseJSON
          for field, error of xhr.responseJSON['errors']
            @$el.find(".form-event-#{field}").
              addClass("js-error-class-remove has-error").
              append("<p class='js-error-remove text-danger'>#{error}</p>")
        else
          @$el.prepend("<div class='js-error-remove alert alert-danger'>Smth is a wrong :(</div>")

  removeErrors: ->
    @log("propose event form removeErrors")
    @$el.find('.js-error-remove').remove()
    @$el.find('.js-error-class-remove').removeClass('has-error')
