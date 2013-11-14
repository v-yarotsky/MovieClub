class MovieClub.Models.AdminInvitation extends Backbone.Model
  defaults:
    id: null
    email: null
    invitation_sent_at: null
    invitation_accepted_at: null
    selected: false

  status: ->
    if @get("invitation_accepted_at")?
      "accepted"
    else if !@get("invitation_accepted_at")? and @get("invitation_sent_at")?
      "pending"
    else if !@get("invitation_sent_at")?
      "not_invited"

  toggleSelected: (selected) ->
    @set(selected: selected)
