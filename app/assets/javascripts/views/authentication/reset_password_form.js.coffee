class MovieClub.Views.ResetPasswordForm extends MovieClub.BaseView
  template: JST["templates/authentication/reset_password_form"]

  render: ->
    @$el.html(@template)
    @

