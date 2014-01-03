MovieClub.module "Models", (Models, MovieClub) ->
  class @UpcomingEvent extends @BaseModel
    url: MovieClub.routes.upcoming_api_events_path

    isAvailable: ->
      @attributes.scheduled_for?

