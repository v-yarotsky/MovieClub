MovieClub.module "Views", ->
  class @AdminEventsView extends @CompositeView
    template: JST["templates/admin/events"]

    initialize: (options) ->
      @log("create events admin view")

    render: ->
      @log("render events admin view")
      @$el.html(@template())
      @

    leave: ->
      @log("leave events admin view")
      @removeSubviews()
      @remove()

