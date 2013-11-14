class MovieClub.Views.AdminInvitationsGridItem extends MovieClub.BaseView
  tagName: "tr"
  template: JST["templates/admin/invitations_grid_item"]

  events:
    "click .js-admin-invitations-grid-item-select": "selectHandler"

  initialize: ->
    @log("create admin invitations grid item")
    @listenTo(@model, "change", @render, @)
    @listenTo(@model, "change:selected", @toggle, @)

  render: ->
    @log("render admin invitaitons grid item")
    @$el.html(@template(@model.attributes))
    @delegateEvents()
    @$el.addClass(@model.status())
    @toggle(@model)
    @

  toggle: (model) ->
    $checkbox = @$(".js-admin-invitations-grid-item-select")
    $checkbox.prop("checked", model.get("selected"))

  selectHandler: (e) ->
    checked = e.target.checked
    @model.toggleSelected(!!checked)

