MovieClub.module "Views", ->
  class @ResetPasswordForm extends @BaseView
    template: JST["templates/authentication/reset_password_form"]

    render: ->
      @$el.html(@template)
      @

