class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    event_params = params.require(:event).permit(:name, :price, :place, :event_date, :description, :image_file_name, :spot)

    @event.update(event_params)

    redirect_to event_path(@event)
  end

  def new
    @event = Event.new()
  end

  def create
    event_params = params.require(:event).permit(:name, :price, :place, :event_date, :description, :image_file_name, :spot)
    @event = Event.new(event_params)
    @event.save

    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
end
