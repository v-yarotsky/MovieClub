class MovieClub.DatePresenter
  constructor: (date) ->
    @date = new Date(date)
    [@day, @month, @year] = [@date.getDate(), @date.getMonth(), @date.getFullYear()]
    @monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November"]

  asISO: ->
    dayNumber = if @day < 10 then '0' + @day else @day
    "#{@year}-#{@month + 1}-#{dayNumber}"

  asHuman: ->
    monthName = @monthNames[@month]
    "#{@day} #{monthName}, #{@year}"

