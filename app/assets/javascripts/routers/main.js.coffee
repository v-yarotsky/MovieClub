MovieClub.module "Routers", (Routers, MovieClub) ->
  class @Main extends @Base
    routes:
      "(events)": "index"
      "events/:id": "show"

    index: ->
      @ensureAuthenticated =>
        @renderLayout()

    show: (eventId) ->
      @ensureAuthenticated =>
        @renderLayout().renderEvent(eventId)

    renderLayout: ->
      @eventsLayout ?= new MovieClub.Views.EventsLayout(el: $(".js-content"), bootstrap: MovieClub.bootstrap)
      @eventsLayout.render()

    leaveCurrentLayout: ->
      @eventsLayout?.leave()

