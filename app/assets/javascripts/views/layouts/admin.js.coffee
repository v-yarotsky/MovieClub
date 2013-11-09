class MovieClub.Views.AdminLayout extends MovieClub.CompositeView
  template: JST["templates/layouts/admin"]

  initialize: (options) ->
    @log("create admin layout")
    @eventsView = new MovieClub.Views.AdminEventsView()
    @invitationsView = new MovieClub.Views.AdminInvitationsView()
    @registerSubview(@eventsView)
    @registerSubview(@invitationsView)

  render: ->
    @log("render admin layout")
    @$el.html(@template())
    @$nav = @$(".js-admin-navigation")
    @$tabs = @$(".js-admin-tabs")
    @renderSubview(@eventsView, ".tab[data-tab='events']")
    @renderSubview(@invitationsView, ".tab[data-tab='invitations']")
    @

  renderEvents: ->
    @_setNavItem("events")
    @

  renderInvitations: ->
    @_setNavItem("invitations")
    @

  leave: ->
    @log("leave admin layout")
    @removeSubviews()
    # TODO: not calling @remove because it will break the initial layout. Ideas?
    @stopListening()
    @$el.empty()

  _setNavItem: (item) ->
    @$nav.find("li").removeClass("active")
    @$tabs.find(".tab").hide()
    @$nav.find("li[data-tab='#{item}']").addClass("active")
    @$tabs.find(".tab[data-tab='#{item}']").show()
    @$

