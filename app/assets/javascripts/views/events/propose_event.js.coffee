class MovieClub.Views.ProposeEvent extends Backbone.View
  template: JST["templates/events/propose_event"]

  events:
    "click .js-proposed-event-new": "showFormHandler"

  render: () ->
    @$el.html(@template())
    @

  showFormHandler: (e) ->
    e.preventDefault()
    @$el.find("a.js-proposed-event-new").hide()
    @eventForm = new MovieClub.Views.ProposeEventForm(collection: @collection)
    @eventForm.on "create", @removeForm, @
    @eventForm.on "cancel", @removeForm, @
    @$el.append(@eventForm.render().el)

  removeForm: ->
    @eventForm.remove()
    @$el.find("a.js-proposed-event-new").show()


