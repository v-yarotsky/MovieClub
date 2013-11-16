class MovieClub.Views.AdminEventAttendeesGrid extends MovieClub.CompositeView
  template: JST["templates/admin/event_attendees_grid"]

  events:
    "click .js-admin-event-attendees-grid-select-all": "toggleAllHandler"

  initialize: ->
    @listenTo(@collection, "add", @renderAttendee)
    @listenTo(@collection, "reset", @render)
    @listenTo(@collection, "filter", @render)
    @listenTo(@collection, "change:selected", @_updateAllSelected)

  render: ->
    @log("render admin event attendees list")
    @removeSubviews()
    @$el.html(@template())
    @delegateEvents()
    @$body = @$("tbody")
    @renderAttendee(invitation) for invitation in @collection.filtered()
    @

  renderAttendee: (invitation) ->
    @log("admin event attendees list renderInvitation")
    adminEventAttendeeView = new MovieClub.Views.AdminEventAttendeesGridItem(model: invitation)
    @registerSubview(adminEventAttendeeView)
    @$body.append(adminEventAttendeeView.render().el)

  toggleAllHandler: (e) ->
    checked = e.target.checked
    @collection.toggleAll(checked)

  leave: ->
    @log("leave admin event attendees list")
    @removeSubviews()
    @remove()

  _updateAllSelected: ->
    $selectAll = @$(".js-admin-event-attendees-grid-select-all")
    $selectAll.prop("checked", @collection.isAllSelected())

