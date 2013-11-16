class MovieClub.Views.AdminEventAttendeesGridFilters extends MovieClub.CompositeView
  template: JST["templates/admin/event_attendees_grid_filters"]

  events:
    "click .js-admin-event-attendees-filter": "toggleFilterHandler"

  initialize: ->
    @listenTo(@collection, "filter", @_updateFilterButtons)

  render: ->
    @log("render admin event attendees grid filters")
    @$el.html(@template())
    @delegateEvents()
    @_updateFilterButtons()
    @

  toggleFilterHandler: (e) ->
    e.preventDefault()
    @collection.toggleFilter($(e.target).data("filter"))

  _updateFilterButtons: ->
    _.each @collection.filters, (enabled, filterName) ->
      @$(".js-admin-event-attendees-filter[data-filter='#{filterName}']").toggleClass("active", enabled)

  leave: ->
    @log("leave admin event attendees grid filters")
    @removeSubviews()
    @remove()

