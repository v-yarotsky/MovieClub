class MovieClub.Views.AdminEvents extends MovieClub.CompositeView
  template: JST["templates/admin/events"]

  initialize: (options) ->
    @eventAttendees = new MovieClub.Collections.AdminEventAttendees(options.bootstrap.event_attendees)
    @scheduleEventFormView = new MovieClub.Views.AdminScheduleEventForm()
    @eventAttendeesGridView = new MovieClub.Views.AdminEventAttendeesGrid(collection: @eventAttendees)
    @eventAttendeesGridFiltersView = new MovieClub.Views.AdminEventAttendeesGridFilters(collection: @eventAttendees)
    @registerSubview(@scheduleEventFormView)
    @registerSubview(@eventAttendeesGridView)
    @registerSubview(@eventAttendeesGridFiltersView)
    @log("create events admin view")

  render: ->
    @log("render events admin view")
    @$el.html(@template())
    @renderSubview(@scheduleEventFormView, ".js-admin-events-schedule-event-form")
    @renderSubview(@eventAttendeesGridFiltersView, ".js-admin-event-attendees-grid-filters")
    @renderSubview(@eventAttendeesGridView, ".js-admin-event-attendees-grid")
    @

  leave: ->
    @log("leave events admin view")
    @removeSubviews()
    @remove()

