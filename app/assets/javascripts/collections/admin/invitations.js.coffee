class MovieClub.Collections.AdminInvitations extends Backbone.Collection
  model: MovieClub.Models.AdminInvitation
  filters:
    not_invited: true
    pending: true
    accepted: true

  toggleFilter: (filterName) ->
    if not _.contains(_.keys(@filters), filterName)
      throw "Unknown filter '#{filterName}'"
    @filters[filterName] = !@filters[filterName]
    @trigger("filter", @filters)
    @_deselectFilteredOut()

  _deselectFilteredOut: ->
    filteredOut = _.difference(@models, @filtered())
    _.each filteredOut, (inv) ->
      inv.toggleSelected(false)

  filtered: ->
    result = []
    _.each @filters, (enabled, filterName) =>
      if enabled
        result.push(inv) for inv in _.select(@models, (inv) -> inv.status() == filterName)
    result

  isAllSelected: ->
    _.every(@filtered(), (inv) -> inv.get("selected"))

  toggleAll: (selected) ->
    _.each(@filtered(), (inv) -> inv.toggleSelected(selected))

