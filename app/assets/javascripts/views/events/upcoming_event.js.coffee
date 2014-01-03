MovieClub.module "Views", (Views, MovieClub) ->
  class @UpcomingEvent extends @BaseView
    className: "jumbotron"
    template: JST["templates/events/upcoming_event"]

    render: ->
      if @model.isAvailable()
        attributes = _.extend _.clone(@model.attributes),
          scheduled_for: new MovieClub.Presenters.DatePresenter(@model.get("scheduled_for"))
        @$el.html(@template(attributes))
      else
        @$el.html("<h2 class='upcoming-event-unavailable'>There are no upcoming events.</h2>")
      @

