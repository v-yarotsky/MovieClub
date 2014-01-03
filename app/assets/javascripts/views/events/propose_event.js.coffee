MovieClub.module "Views", (Views, MovieClub) ->
  class @ProposeEvent extends @BaseView
    template: JST["templates/events/propose_event"]

    events:
      "click .js-proposed-event-new": "showFormHandler"

    render: () ->
      @log("render propose event")
      @$el.html(@template())
      @

    showFormHandler: (e) ->
      @log("propose event showFormHandler")
      e.preventDefault()
      @$el.find("a.js-proposed-event-new").hide()
      @eventForm = new Views.ProposeEventForm(collection: @collection)
      @eventForm.on "create", @removeForm, @
      @eventForm.on "cancel", @removeForm, @
      @$el.append(@eventForm.render().el)

    removeForm: ->
      @log("propose event removeForm")
      @eventForm.remove()
      @$el.find("a.js-proposed-event-new").show()


