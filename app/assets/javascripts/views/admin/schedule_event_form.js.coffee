class MovieClub.Views.AdminScheduleEventForm extends MovieClub.CompositeView
  template: JST["templates/admin/schedule_event_form"]

  initialize: ->
    @log("create admin schedule event form view")

  render: ->
    @log("render admin schedule event form view")
    @$el.html(@template())
    @$(".js-admin-schedule-event-form-schedule-for").datepicker
      format: "M dd (D), yyyy",
      weekStart: 1,
      daysOfWeekDisabled: "0,6",
      startDate: new Date()
    @

  leave: ->
    @log("leave admin schedule event form view")
    @removeSubviews()
    @remove()

