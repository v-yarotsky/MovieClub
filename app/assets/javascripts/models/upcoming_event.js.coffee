class MovieClub.Models.UpcomingEvent extends Backbone.Model
  url: Routes.upcoming_api_events_path

  isAvailable: ->
    @attributes.scheduled_for?

