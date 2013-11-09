class MovieClub.Routers.Admin extends MovieClub.Routers.Base
  routes:
    "(events)": "events",
    "invitations": "invitations"


  events: ->
    @ensureAuthenticated =>
      @renderLayout().renderEvents()

  invitations: ->
    @ensureAuthenticated =>
      @renderLayout().renderInvitations()

  renderLayout: ->
    @adminLayout ?= new MovieClub.Views.AdminLayout(el: $(".js-content"), bootstrap: MovieClub.bootstrap)
    @adminLayout.render()

  leaveCurrentLayout: ->
    @adminLayout?.leave()

