class MovieClub.Views.LoginFormDialog extends MovieClub.BaseView
  className: "modal authentication-login-form-dialog"
  template: JST["templates/authentication/login_form_dialog"]

  events:
    'submit': 'login'
    'click .js-password-reset-new': 'passwordResetHandler'

  initialize: ->
    @log("create login form")

  render: ->
    @log("render login form")
    @$el.html(@template)
    @delegateEvents() # In case the view is re-rendered
    @$el.modal(keyboard: false, backdrop: "static")
    @listenToOnce(MovieClub, "login", @dismiss)
    @listenTo(MovieClub, "login:failure", @_showLoginErrors)
    @

  renderPasswordReset: ->
    alert("What have you done!")
    @

  passwordResetHandler: (e) ->
    e.preventDefault()
    @renderPasswordReset()

  dismiss: ->
    @log("dismiss login form")
    @$el.on("hidden.bs.modal", _.bind(@remove, @))
    @$el.modal("hide")

  login: (e) ->
    @_hideLoginErrors()
    @log("submit login form")
    e.preventDefault()
    MovieClub.session().create
      email:    @$("input[name='email']").val()
      password: @$("input[name='password']").val()

  _showLoginErrors: (errorMessage) ->
    @$(".js-alerts").html("<div class='alert alert-danger'><a class='close' data-dismiss='alert' href='#'>×</a>#{errorMessage}</div>")

  _hideLoginErrors: ->
    @$(".js-alerts").empty()
