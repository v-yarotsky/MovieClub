class MovieClub.Collections.ProposedEvents extends Backbone.Collection
  model: MovieClub.Models.Event
  comparator: (event) -> new Date(event.get("created_at"))

