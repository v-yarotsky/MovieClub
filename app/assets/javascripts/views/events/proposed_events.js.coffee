class MovieClub.Views.ProposedEvents extends Backbone.View
  tagName: "tbody"
  className: "events-proposed"

  initialize: ->
    @collection.on('add', this.render, this)
    @collection.on('reset', this.render, this)

  render: ->
    @$el.html('')
    @$el.append(new MovieClub.Views.ProposedEvent(model: event).render().el) for event in @collection.models
    @
