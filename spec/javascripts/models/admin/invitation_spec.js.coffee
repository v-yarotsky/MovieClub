module "AdminInvitation"

test "status returns 'accepted' if invitation was accepted", () ->
  invitation = new MovieClub.Models.AdminInvitation
    invitation_sent_at: "2013-11-09 08:00:00"
    invitation_accepted_at: "2013-11-10 04:00:00"
  equal(invitation.status(), "accepted")

test "status returns 'pending' if invitation was not accepted yet", () ->
  invitation = new MovieClub.Models.AdminInvitation
    invitation_sent_at: "2013-11-09 08:00:00"
  equal(invitation.status(), "pending")

test "status returns 'not_invited' if invitation was not sent", () ->
  invitation = new MovieClub.Models.AdminInvitation()
  equal(invitation.status(), "not_invited")
