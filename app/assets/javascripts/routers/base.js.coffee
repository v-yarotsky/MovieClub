MovieClub.module "Routers", (Routers, MovieClub, d) ->
  class @Base extends Backbone.Router
    initialize: ->
      @listenTo MovieClub, "login", @_retriggerRoute
      @listenTo MovieClub, "logout", @_switchToLogin
      @renderAuthenticationLayout()

    renderAuthenticationLayout: ->
      @authenticationLayout ?= new MovieClub.Views.AuthenticationLayout(el: $(".js-container"), bootstrap: MovieClub.bootstrap)
      @authenticationLayout.render()

    # TODO: Maybe we should just hook up into ajaxSetup and watch out for code 401.
    ensureAuthenticated: (boundCallback) ->
      if MovieClub.session().isAuthenticated()
        boundCallback()
      else
        @_switchToLogin()

    leaveCurrentLayout: ->
      throw "Override me"

    _switchToLogin: ->
      @leaveCurrentLayout()
      @renderAuthenticationLayout().renderLoginForm()

    _retriggerRoute: ->
      d.Backbone.history.loadUrl(d.Backbone.history.fragment)

