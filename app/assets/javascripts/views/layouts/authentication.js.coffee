class MovieClub.Views.AuthenticationLayout extends MovieClub.CompositeView
  initialize: (options) ->
    @log("create authentication layout")
    @listenTo MovieClub, "login", @renderLogout
    @listenTo MovieClub, "logout", @_updateCSRFToken
    @listenTo MovieClub, "login", @_updateCSRFToken
    @logoutView = new MovieClub.Views.Logout()
    @loginFormDialogView = new MovieClub.Views.LoginFormDialog(model: MovieClub.session())
    @resetPasswordFormView = new MovieClub.Views.ResetPasswordForm()

  render: ->
    @log("render authentication layout")
    if MovieClub.session().isAuthenticated()
      @renderLogout()
    @

  renderLogout: ->
    @log("authentication layout renderLogout")
    @$(".js-nav .js-logout").html(@logoutView.render().el)
    @

  renderLoginForm: ->
    @log("authentication layout renderLoginForm")
    @loginFormDialogView.render()
    @

  renderResetPasswordForm: ->
    @log("authentication layout renderResetPasswordForm")
    @resetPasswordFormView.render()
    @

  _updateCSRFToken: (payload) ->
    @log("Update authenticity token", payload)
    $("head meta[name='csrf-token']").attr("content", payload.authenticityToken)
