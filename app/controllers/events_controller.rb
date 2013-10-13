class EventsController < ApplicationController
  respond_to :html, :json

  def index
    @events = Event.top_rated_upcoming
  end

  def show
    @event = Event.find(params[:id])
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def create
    @event = Event.create(params[:event])
    respond_with(@event)
  end

  def edit
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
