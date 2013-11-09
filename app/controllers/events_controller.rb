class EventsController < ApplicationController
  respond_to :html

  skip_before_filter :authenticate_user!, only: :index

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

