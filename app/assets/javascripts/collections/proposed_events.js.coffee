class MovieClub.Collections.ProposedEvents extends Backbone.Collection
  url: Routes.api_events_path
  model: MovieClub.Models.Event
  comparator: (event) -> new Date(event.get("created_at"))

