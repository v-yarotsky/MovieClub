class MovieClub.Views.AdminInvitationsGrid extends MovieClub.CompositeView
  template: JST["templates/admin/invitations_grid"]

  events:
    "click .js-admin-invitations-grid-select-all": "toggleAllHandler"

  initialize: ->
    @listenTo(@collection, "add", @renderInvitation)
    @listenTo(@collection, "reset", @render)
    @listenTo(@collection, "filter", @render)
    @listenTo(@collection, "change:selected", @_updateAllSelected)

  render: ->
    @log("render admin invitations list")
    @removeSubviews()
    @$el.html(@template())
    @delegateEvents()
    @$body = @$("tbody")
    @renderInvitation(invitation) for invitation in @collection.filtered()
    @

  renderInvitation: (invitation) ->
    @log("admin invitations list renderInvitation")
    adminInvitationView = new MovieClub.Views.AdminInvitationsGridItem(model: invitation)
    @registerSubview(adminInvitationView)
    @$body.append(adminInvitationView.render().el)

  toggleAllHandler: (e) ->
    checked = e.target.checked
    @collection.toggleAll(checked)

  leave: ->
    @log("leave admin invitations list")
    @removeSubviews()
    @remove()

  _updateAllSelected: ->
    $selectAll = @$(".js-admin-invitations-grid-select-all")
    $selectAll.prop("checked", @collection.isAllSelected())

