class MovieClub.Views.AdminLayout extends MovieClub.CompositeView
  template: JST["templates/layouts/admin"]

  initialize: (options) ->
    @log("create admin layout")
    @eventsView = new MovieClub.Views.AdminEvents(bootstrap: options.bootstrap)
    @invitationsView = new MovieClub.Views.AdminInvitations(bootstrap: options.bootstrap)
    @registerSubview(@eventsView)
    @registerSubview(@invitationsView)

  render: ->
    @log("render admin layout")
    @$el.html(@template())
    @$nav = @$(".js-admin-navigation")
    @$tabs = @$(".js-admin-tabs")
    @renderSubview(@eventsView, ".tab-pane[data-tab='events']")
    @renderSubview(@invitationsView, ".tab-pane[data-tab='invitations']")
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
    @$tabs.find(".tab-pane").hide()
    @$nav.find("li[data-tab='#{item}']").addClass("active")
    @$tabs.find(".tab-pane[data-tab='#{item}']").show()
    @$

