MovieClub.module "Models", (Models, MovieClub) ->
  class @Event extends @BaseModel
    urlRoot: MovieClub.routes.api_events_path

    increaseInterested: ->
      @save(rate: @get("rate") + 1)
