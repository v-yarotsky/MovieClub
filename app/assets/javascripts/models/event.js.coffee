class MovieClub.Models.Event extends Backbone.Model
  urlRoot: Routes.events_path

  increaseInterested: ->
    if @interested
      alert "yeah, I know"
    else
      @save(rate: @get("rate") + 1)
      @interested = true

