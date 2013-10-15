class EventsController < ApplicationController
  respond_to :html, :json

  def index
    @events = Event.top_rated_upcoming
    respond_with(@events)
  end

  def show
    @event = Event.find(params[:id])
    respond_with(@event)
  end

  def create
    puts params
    @event = Event.create(params[:event].permit(:title, :description, :trailer_url))
    respond_with(@event)
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event].permit(:title, :description, :trailer_url, :rate))
    respond_with(@event)
  end

  def interested
    @event = Event.find(params[:id])
    @event.interested!
    respond_with(@event)
  end
end
