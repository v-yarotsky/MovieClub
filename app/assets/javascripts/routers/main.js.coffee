class MovieClub.Routers.Main extends Backbone.Router
  routes:
    "(events)": "index"
    "events/:id": "show"

  initialize: ->
    @listenTo MovieClub, "login", @_retriggerRoute
    @listenTo MovieClub, "logout", @_switchToLogin
    @renderAuthenticationLayout()

  index: ->
    @ensureAuthenticated =>
      @renderLayout()

  show: (eventId) ->
    @ensureAuthenticated =>
      @renderLayout().renderEvent(eventId)

  renderLayout: ->
    @eventsLayout ?= new MovieClub.Views.EventsLayout(el: $(".js-content"), bootstrap: MovieClub.bootstrap)
    @eventsLayout.render()

  renderAuthenticationLayout: ->
    @authenticationLayout ?= new MovieClub.Views.AuthenticationLayout(el: $(".js-container"), bootstrap: MovieClub.bootstrap)
    @authenticationLayout.render()

  # TODO: Maybe we should just hook up into ajaxSetup and watch out for code 401.
  ensureAuthenticated: (boundCallback) ->
    if MovieClub.session().isAuthenticated()
      boundCallback()
    else
      @_switchToLogin()

  _switchToLogin: ->
    @eventsLayout?.leave()
    @renderAuthenticationLayout().renderLoginForm()

  _retriggerRoute: ->
    Backbone.history.loadUrl(Backbone.history.fragment)

