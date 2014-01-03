MovieClub.module "Presenters", ->
  class @DatePresenter
    constructor: (date) ->
      @date = new Date(date)
      [@day, @month, @year] = [@date.getDate(), @date.getMonth(), @date.getFullYear()]
      @monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November"]

    asISO: ->
      dayNumber = if @day < 10 then '0' + @day else @day
      month = @month + 1
      monthNumber = if month < 10 then '0' + month else month
      "#{@year}-#{monthNumber}-#{dayNumber}"

    asHuman: ->
      monthName = @monthNames[@month]
      "#{@day} #{monthName}, #{@year}"

