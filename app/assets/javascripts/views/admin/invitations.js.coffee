#= require markdown

class MovieClub.Views.AdminInvitations extends MovieClub.CompositeView
  template: JST["templates/admin/invitations"]

  initialize: (options) ->
    @log("create invitations admin view")

  render: ->
    @log("render invitations admin view")
    @$el.html(@template())
    @

  leave: ->
    @log("leave invitations admin view")
    @removeSubviews()
    @remove()

