MovieClub.module "Collections", (Collections, MovieClub) ->
  class @ProposedEvents extends @BaseCollection
    url: MovieClub.routes.api_events_path
    model: MovieClub.Models.Event
    comparator: (event) -> new Date(event.get("created_at"))

