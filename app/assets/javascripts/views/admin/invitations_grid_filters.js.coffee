class MovieClub.Views.AdminInvitationsGridFilters extends MovieClub.CompositeView
  template: JST["templates/admin/invitations_grid_filters"]

  events:
    "click .js-admin-invitations-filter": "toggleFilterHandler"

  initialize: ->
    @listenTo(@collection, "filter", @_updateFilterButtons)

  render: ->
    @log("render admin invitations grid filters")
    @$el.html(@template())
    @delegateEvents()
    @_updateFilterButtons()
    @

  toggleFilterHandler: (e) ->
    e.preventDefault()
    @collection.toggleFilter($(e.target).data("filter"))

  _updateFilterButtons: ->
    _.each @collection.filters, (enabled, filterName) ->
      @$(".js-admin-invitations-filter[data-filter='#{filterName}']").toggleClass("active", enabled)

  leave: ->
    @log("leave admin invitations grid filters")
    @removeSubviews()
    @remove()

