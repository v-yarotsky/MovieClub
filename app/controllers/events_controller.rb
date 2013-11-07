class EventsController < ApplicationController
  respond_to :html

  def index
    if user_signed_in?
      @events = Event.top_proposed
      @upcoming_event = Event.upcoming
    else
      @events = []
      @upcoming_event = nil
    end
  end
end

