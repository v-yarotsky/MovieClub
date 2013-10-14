class MovieClub.Models.Event extends Backbone.Model
  urlRoot: Routes.api_events_path

  increaseInterested: ->
    @save(rate: @get("rate") + 1)
