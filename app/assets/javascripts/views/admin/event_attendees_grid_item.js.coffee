class MovieClub.Views.AdminEventAttendeesGridItem extends MovieClub.BaseView
  tagName: "tr"
  template: JST["templates/admin/event_attendees_grid_item"]

  events:
    "click .js-admin-event-attendees-grid-item-select": "selectHandler"

  initialize: ->
    @log("create admin event attendees grid item")
    @listenTo(@model, "change", @render, @)
    @listenTo(@model, "change:selected", @toggle, @)

  render: ->
    @log("render admin event attendees grid item")
    @$el.html(@template(@model.attributes))
    @delegateEvents()
    @$el.addClass(@model.status())
    @toggle(@model)
    @

  toggle: (model) ->
    $checkbox = @$(".js-admin-event-attendees-grid-item-select")
    $checkbox.prop("checked", model.get("selected"))

  selectHandler: (e) ->
    checked = e.target.checked
    @model.toggleSelected(!!checked)

