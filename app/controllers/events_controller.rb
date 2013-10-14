class EventsController < ApplicationController
  respond_to :html

  def index
    @events = user_signed_in? ? Event.top_rated_upcoming : []
    respond_with(@events)
  end
end

