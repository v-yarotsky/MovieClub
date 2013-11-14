#= require markdown

class MovieClub.Views.AdminInvitations extends MovieClub.CompositeView
  template: JST["templates/admin/invitations"]

  initialize: (options) ->
    @log("create invitations admin view")
    @invitations = new MovieClub.Collections.AdminInvitations(options.bootstrap.invitations)
    @invitationsGridView = new MovieClub.Views.AdminInvitationsGrid(collection: @invitations)
    @invitationsGridFiltersView = new MovieClub.Views.AdminInvitationsGridFilters(collection: @invitations)
    @registerSubview(@invitationsGridView)
    @registerSubview(@invitationsGridFiltersView)

  render: ->
    @log("render invitations admin view")
    @$el.html(@template())
    @renderSubview(@invitationsGridFiltersView, ".js-admin-invitations-grid-filters")
    @renderSubview(@invitationsGridView, ".js-admin-invitations-grid")
    @

  leave: ->
    @log("leave invitations admin view")
    @removeSubviews()
    @remove()

