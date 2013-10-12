class MovieClub.Models.Event extends Backbone.Model
  increaseInterested: ->
    if @interested
      alert "yeah, I know"
    else
      @set("rate", @get("rate") + 1)
      @save()
      @interested = true

class MovieClub.Collections.ProposedEvents extends Backbone.Collection
  model: MovieClub.Models.Event
  urlRoot: "/events"

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

  showForm: ->
    @toggleForm(true);
    false

  cancelProposeEvent: ->
    @toggleForm(false)
    false

class MovieClub.Views.ProposedEvents extends Backbone.View
  tagName: "ul"
  class: "events-proposed"

  render: ->
    events = @collection.models
    $(@el).append(new MovieClub.Views.ProposedEvent(model: event).render().el) for event in events
    @

class MovieClub.Views.ProposedEvent extends Backbone.View
  tagName: "li"
  class: "event-proposed"
  template: JST["templates/events/proposed_event"]

  events:
    "click .event-interested": "interested"

  initialize: ->
    @model.bind("change", @render, @)

  render: ->
    $(@el).html(@template(@model.toJSON()))
    @

  interested: ->
    @model.increaseInterested()
    false

