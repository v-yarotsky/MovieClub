class EventsController < ApplicationController
  def index
    @events = Event.top_rated_upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(params[:event])
    if @event
      flash.now = "Event successfully created"
      redirect_to event_url(@event)
    else
      flash.now = "There were errors creating event"
      render :new
    end
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event].permit(:title, :description, :trailer_url, :rate))
      render :json => { success: true }
    else
      render :json => { success: false, errors: @event.errors }
    end
  end

  def interested
    @event = Event.find(params[:id])
    @event.interested!
    render :json => { success: true }
  end
end
