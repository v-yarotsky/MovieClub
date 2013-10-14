module Api

  class EventsController < BaseApiController
    before_filter :authenticate_user!

    def index
      @events = Event.top_rated_upcoming
      respond_with(:api, @events)
    end

    def show
      @event = Event.find(params[:id])
      respond_with(:api, @event)
    end

    def create
      @event = Event.create(params[:event].permit(:title, :description, :trailer_url))
      respond_with(:api, @event)
    end

    def update
      @event = Event.find(params[:id])
      @event.update_attributes(params[:event].permit(:title, :description, :trailer_url, :rate))
      respond_with(:api, @event)
    end

    def interested
      @event = Event.find(params[:id])
      @event.interested!
      respond_with(:api, @event)
    end
  end

end

